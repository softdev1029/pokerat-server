package RouletteExtension;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;
import com.smartfoxserver.v2.extensions.SFSExtension;

import RouletteEngine.Bet;
import RouletteEngine.BetType;
import RouletteEngine.Player;
import RouletteEngine.Status;
import RouletteEngine.Table;

public class RoomExtension extends SFSExtension {

	public int tableSize = 4;
	public long minBuyin, maxBuyin;
	public long minBet, maxBet;

	public Table table;

	public ISFSArray actionArray = new SFSArray();
	public boolean isAction = false;

	private static long[] MIN_BET = {1, 5, 10, 25, 50};
	private static long[] MAX_BET = {50, 200, 500, 1000, 2000};
	private static long[] MIN_BUYIN = {50, 15000, 25000, 50000, 150000};
	private static long[] MAX_BUYIN = {30000, 90000, 100000, 175000, 450000};

	@Override
	public void init() {
		addRequestHandler("roulette_ready", ReadyHandler.class);
		addRequestHandler("roulette_join", JoinHandler.class);
		addRequestHandler("roulette_leave", LeaveHandler.class);
		addRequestHandler("roulette_action", ActionHandler.class);
		addRequestHandler("roulette_chat", ChatHandler.class);
		addRequestHandler("roulette_gift", GiftHandler.class);

		addEventHandler(SFSEventType.USER_LEAVE_ROOM, DisconnectHandler.class);
		addEventHandler(SFSEventType.USER_DISCONNECT, DisconnectHandler.class);

		tableSize = 4;

		Random rd = new Random();
		int index = rd.nextInt(2);
		minBuyin = MIN_BUYIN[index];	maxBuyin = MAX_BUYIN[index];
		minBet = MIN_BET[index];		maxBet = MAX_BET[index];

		table = new Table(this);
	}

	@Override
	public Object handleInternalMessage(String cmdName, Object params) {
		if (cmdName.equals("get_room_info")) {
			ISFSObject obj = new SFSObject();
			obj.putUtfString("name", getParentRoom().getName());
			obj.putInt("type", 2);
			obj.putLong("min_buyin", minBuyin);
			obj.putLong("max_buyin", maxBuyin);
			obj.putLong("min_bet", minBet);
			obj.putLong("max_bet", maxBet);
			obj.putInt("size", tableSize);
			obj.putInt("player_num", table.playerSize());
			ISFSArray playerList = new SFSArray();
			for(Player player : table.players) {
				ISFSObject obj1 = new SFSObject();
				obj1.putInt("pos", player.getPos());
				obj1.putUtfString("email", player.getEmail());
				obj1.putUtfString("name", player.getName());
				playerList.addSFSObject(obj1);
			}
			for(Player player : table.newPlayers) {
				ISFSObject obj1 = new SFSObject();
				obj1.putInt("pos", player.getPos());
				obj1.putUtfString("email", player.getEmail());
				obj1.putUtfString("name", player.getName());
				playerList.addSFSObject(obj1);
			}
			obj.putSFSArray("player_list", playerList);

			return obj;
		}
		return null;
	}

	public void readyPlayer(String email, boolean isAutomatic)
	{
		if(isAutomatic) {
			for(int i = 0; i < tableSize; i ++) {
				boolean flag = true;
				for(Player player : table.players) {
					if(player.getPos() == i)
						flag = false;
				}
				for(Player player : table.newPlayers) {
					if(player.getPos() == i)
						flag = false;
				}
				if(flag) {
					ISFSObject obj = new SFSObject();
					obj.putInt("pos", i);
					if(getParentRoom().getUserByName(email) != null)
						send("roulette_autojoin", obj, getParentRoom().getUserByName(email));
					break;
				}
			}
		}

		updateAll(email);
	}

	public void joinPlayer(ISFSObject params)
	{
		String email = params.getUtfString("email");
		String name = params.getUtfString("name");
		int pos = params.getInt("pos");
		long amount = params.getLong("amount");
		
		ISFSObject info = getUserInfo(email);
		int giftCategory = info.getInt("gift_category");
		int giftValue = info.getInt("gift_value");

		payPlayerChipcount(email, amount);
		if(table.status == Status.BET)
			table.players.add(new Player(pos, email, name, amount, giftCategory, giftValue));
		else
			table.newPlayers.add(new Player(pos, email, name, amount, giftCategory, giftValue));
		updatePlayers();
		updateBets(email);
		updateStoryboard();
		sendMessage("", "", name + " has joined the game", true);
		if(table.isRunning)
			updateStatus(false);
		else
			table.run();
	}

	public void leavePlayer(String email)
	{
		System.out.println("leave : " + email);
		for(Player player : table.players) {
			if(player.getEmail().compareTo(email) == 0) {
				addPlayerChipcount(email, player.getCash());

				ISFSObject resObj = new SFSObject();
				resObj.putInt("pos", player.getPos());
				resObj.putUtfString("email", player.getEmail());
				if(getParentRoom().getUserList().size() > 0)
					send("roulette_leave", resObj, getParentRoom().getUserList());

				sendMessage("", "", player.getName() + " has left the game", true);
				table.players.remove(player);
				updatePlayers();
				updateBets("");
				return;
			}
		}
		for(Player player : table.newPlayers) {
			if(player.getEmail().compareTo(email) == 0) {
				addPlayerChipcount(email, player.getCash());

				ISFSObject resObj = new SFSObject();
				resObj.putInt("pos", player.getPos());
				resObj.putUtfString("email", player.getEmail());
				if(getParentRoom().getUserList().size() > 0)
					send("roulette_leave", resObj, getParentRoom().getUserList());

				sendMessage("", "", player.getName() + " has left the game", true);
				table.newPlayers.remove(player);
				updatePlayers();
				updateBets("");
				return;
			}
		}
	}

	public void addBet(Player player, int type, int value, long amount/*, int animPos*/)
	{
		List<Bet> betList = player.getBetList();
		Bet bet = new Bet(type, amount, value);
		//		betList.add(bet);
		//		player.payCash(bet.amount);
		//		player.addBet(bet.amount);
		//		sendAction(0, player.getPos(), bet/*, animPos*/);

		int sum = 0, total = 0;
		if(betList.size() > 0) {
			for(Bet b : betList) {
				if(betList == null)
					System.out.println("AddBet betList null: " + player.getEmail() + "," + type + "," + value);
				if(b == null)
					System.out.println("AddBet bet null: " + player.getEmail() + "," + type + "," + value);
				total += b.getAmount();
				if(b.getType().getId() == type && bet.value == b.value) {
					sum += b.getAmount();
				}
			}
		}

		if(player.getBet() >= maxBet * 5) {
			//			sendServerMessage(player.getEmail(), "Your total bet is over the limit.\nMaximum bet is $300", false, 0);
			return;
		}

		if(bet.getType() == BetType.EVEN_CHANCE) {
			if(sum < maxBet * 5 && player.getBet() < maxBet * 5) {
				long diff = maxBet * 5 - sum;
				if(diff > maxBet * 5 - total)
					diff = maxBet * 5 - total;
				if(diff < bet.amount)
					bet.amount = diff;
				betList.add(bet);
				player.payCash(bet.amount);
				player.addBet(bet.amount);
				sendAction(0, player.getPos(), bet/*, animPos*/);
			}
			//			else
			//				sendServerMessage(player.getEmail(), "Maximum bet is on this cell is $250", false, 1);
		} else if(bet.getType() == BetType.DOZEN || bet.getType() == BetType.COLUMN) {
			if(sum < maxBet * 4 && player.getBet() < maxBet * 5) {
				long diff = maxBet * 4 - sum;
				if(diff > maxBet * 5 - total)
					diff = maxBet * 5 - total;
				if(diff < bet.amount)
					bet.amount = diff;
				betList.add(bet);
				player.payCash(bet.amount);
				player.addBet(bet.amount);
				sendAction(0, player.getPos(), bet/*, animPos*/);
			}
			//			else
			//				sendServerMessage(player.getEmail(), "Maximum bet is on this cell is $200", false, 1);
		} else {
			if(sum < maxBet && player.getBet() < maxBet * 5) {
				long diff = maxBet - sum;
				if(diff > maxBet * 5 - total)
					diff = maxBet * 5 - total;
				if(diff < bet.amount)
					bet.amount = diff;
				betList.add(bet);
				player.payCash(bet.amount);
				player.addBet(bet.amount);
				sendAction(0, player.getPos(), bet/*, animPos*/);
			}
			//			else
			//				sendServerMessage(player.getEmail(), "Maximum bet is on this cell is $50", false, 2);
		}
	}

	public void processAction()
	{
		isAction = true;
		while(actionArray.size() > 0)
		{
			ISFSObject params = actionArray.getSFSObject(0);
			getAction(params);
			actionArray.removeElementAt(0);
		}
		isAction = false;
	}

	public void getAction(ISFSObject params)
	{
		int action = params.getInt("action");
		int pos = params.getInt("pos");
		int type = params.getInt("type");
		long amount = params.getLong("amount");
		int value = params.getInt("value");
		//		int animPos = params.getInt("anim");
		Player player = null;
		for(Player p : table.players) {
			if(p.getPos() == pos)
				player = p;
		}
		if(player == null)
			return;
		List<Bet> betList = player.getBetList();

		if(action == 0) {						// Add bet
			addBet(player, type, value, amount/*, animPos*/);
		} else if(action == 1) {			// Remove bet
			if(betList.size() > 0) {
				Bet bet = betList.get(betList.size() - 1);
				player.addCash(bet.amount);
				player.payBet(bet.amount);
				betList.remove(betList.size() - 1);
				sendAction(action, pos, null/*, -1*/);
			}
		} else if(action == 2) {			// Remove all bet
			if(betList.size() > 0) {
				player.addCash(player.getBet());
				player.setBet(0);
				betList.clear();
				sendAction(action, pos, null/*, -1*/);
			}
		} else if(action == 3) {					// Prev Bet
			if(player.prevBetList.size() > 0) {
				player.addCash(player.getBet());
				player.setBet(0);
				betList.clear();
				for(Bet b : player.prevBetList) {
					betList.add(b);
					player.payCash(b.getAmount());
				}
				sendAction(action, pos, null/*, -1*/);
			}
		} else if(action == 4) {					// Ready
			player.isReady = true;
			boolean isAllReady = true;
			for(Player p : table.players) {
				if(!p.isReady)
					isAllReady = false;
			}
			if(isAllReady && table.status == Status.BET) {
				table.stopDelay();
			}
		} else if(action == 5) {					// Static hot
			for(Integer spin : table.spinList) {
				if(spin == 0)
					continue;
				if(Bet.colors[spin] == type) {
					addBet(player, 0, spin, amount/*, 41*/);
				}
			}
		} else if(action == 6) {					// Spin done
			player.isReady = true;
			boolean isAllReady = true;
			for(Player p : table.players) {
				if(!p.isReady)
					isAllReady = false;
			}
			//    		System.out.println("Spin: " + isAllReady);
			if(isAllReady) {
				table.stopDelay();
			}
		}
		updatePlayers();
	}

	public void sendAction(int action, int pos, Bet bet/*, int animPos*/)
	{
		ISFSObject resObj = new SFSObject();
		resObj.putInt("action", action);
		resObj.putInt("pos", pos);
		if(action == 0) {
			resObj.putInt("type", bet.getType().getId());
			resObj.putLong("amount", bet.getAmount());
			resObj.putInt("value", bet.value);
			//    		resObj.putInt("anim", animPos);
		}
		if(getParentRoom().getUserList().size() > 0)
			send("roulette_action", resObj, getParentRoom().getUserList());
	}

	public void setGift(ISFSObject params)
	{
		String email = params.getUtfString("email");
		boolean isAll = params.getBool("all");
		int pos = params.getInt("to");
		int category = params.getInt("category");
		int detail = params.getInt("detail");
		long amount = params.getLong("amount");
		boolean isCoin = params.getBool("coin");

		if(isCoin)
			payPlayerCoin(email, amount);
		else
			payPlayerChipcount(email, amount);
		for(Player player : table.players) {
			if(isAll || (pos == player.getPos())) {
				player.giftCategory = category;
				player.giftDetail = detail;
			}
		}
		for(Player player : table.newPlayers) {
			if(isAll || (pos == player.getPos())) {
				player.giftCategory = category;
				player.giftDetail = detail;
				setGift(player.getEmail(), category, detail);
			}
		}
//		updatePlayers();
		if(getParentRoom().getUserList().size() > 0)
			send("roulette_gift", params, getParentRoom().getUserList());
	}

	public void updateAll(String email)
	{
		updateStatus(false);
		updatePlayers();
		updateBets(email);
		updateStoryboard();
	}

	public void updateStatus(boolean isNewState)
	{
		ISFSObject resObj = new SFSObject();
		resObj.putInt("status", table.status.getValue());
		resObj.putInt("value", table.wheelValue);
		resObj.putBool("new", isNewState);
		if(getParentRoom().getUserList().size() > 0)
			send("roulette_updatestatus", resObj, getParentRoom().getUserList());
	}

	public void updatePlayers()
	{
		ISFSObject resObj = new SFSObject();
		ISFSArray array = new SFSArray();
		for(Player player : table.players) {
			ISFSObject obj = new SFSObject();
			obj.putInt("pos", player.getPos());
			obj.putUtfString("email", player.getEmail());
			obj.putUtfString("name", player.getName());
			obj.putLong("cash", player.getCash());
			obj.putLong("bet", player.getBet());
			obj.putBool("ready", player.isReady);
			obj.putInt("gift_category", player.giftCategory);
			obj.putInt("gift_detail", player.giftDetail);
			array.addSFSObject(obj);
		}
		for(Player player : table.newPlayers) {
			ISFSObject obj = new SFSObject();
			obj.putInt("pos", player.getPos());
			obj.putUtfString("email", player.getEmail());
			obj.putUtfString("name", player.getName());
			obj.putLong("cash", player.getCash());
			obj.putLong("bet", player.getBet());
			obj.putBool("ready", player.isReady);
			obj.putInt("gift_category", player.giftCategory);
			obj.putInt("gift_detail", player.giftDetail);
			array.addSFSObject(obj);
		}
		resObj.putSFSArray("array", array);
		if(getParentRoom().getUserList().size() > 0)
			send("roulette_updateplayers", resObj, getParentRoom().getUserList());
	}

	public void updateBets(String email)
	{
		ISFSObject resObj = new SFSObject();
		ISFSArray array = new SFSArray();
		for(Player player : table.players) {
			ISFSObject obj1 = new SFSObject();
			ISFSArray array1 = new SFSArray();
			ISFSArray prevArray = new SFSArray();
			List<Bet> betList = player.getBetList();

			if(betList.size() > 0) {
				for(Bet bet : betList) {
					if(betList == null)
						System.out.println("UpdateBet betList null: " + player.getEmail() + "," + bet.type + "," + bet.value);
					if(bet == null)
						System.out.println("UpdateBet bet null: " + player.getEmail());
					ISFSObject obj = new SFSObject();
					obj.putInt("pos", player.getPos());
					obj.putInt("type", bet.getType().getId());
					obj.putLong("amount", bet.getAmount());
					obj.putInt("value", bet.value);
					//            		System.out.println("updatebet : " + player.getPos() + "," + bet.getAmount() + "," +  bet.getType().getId() + "," + bet.value);
					array1.addSFSObject(obj);
				}
			}
			obj1.putSFSArray("array", array1);

			if(player.prevBetList.size() > 0) {
				for(Bet bet : player.prevBetList) {
					ISFSObject obj = new SFSObject();
					obj.putInt("pos", player.getPos());
					obj.putInt("type", bet.getType().getId());
					obj.putLong("amount", bet.getAmount());
					obj.putInt("value", bet.value);
					prevArray.addSFSObject(obj);
				}
			}
			obj1.putSFSArray("prevarray", prevArray);

			array.addSFSObject(obj1);
		}
		resObj.putSFSArray("array", array);
		if(email.compareTo("") == 0) {
			if(getParentRoom().getUserList().size() > 0)
				send("roulette_updatebets", resObj, getParentRoom().getUserList());
		}
		else {
			if(getParentRoom().getUserByName(email) != null)
				send("roulette_updatebets", resObj, getParentRoom().getUserByName(email));
		}
	}

	public void removeBets()
	{
		if(getParentRoom().getUserList().size() > 0)
			send("roulette_removebets", new SFSObject(), getParentRoom().getUserList());
	}

	public void doPayout(int pos, long amount)
	{
		System.out.println(amount);
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", pos);
		resObj.putLong("amount", amount);
		if(getParentRoom().getUserList().size() > 0)
			send("roulette_payout", resObj, getParentRoom().getUserList());
	}

	public void updateStoryboard()
	{
		ISFSObject resObj = new SFSObject();
		resObj.putIntArray("array", table.spinList);
		if(getParentRoom().getUserList().size() > 0)
			send("roulette_storyboard", resObj, getParentRoom().getUserList());
	}

	public void sendServerMessage(String email, String msg, boolean isDealer, int value)
	{
		ISFSObject resObj = new SFSObject();
		resObj.putBool("dealer", isDealer);
		resObj.putUtfString("text", msg);
		resObj.putInt("value", value);
		if(email.compareTo("") == 0) {
			if(getParentRoom().getUserList().size() > 0)
				send("roulette_servermessage", resObj, getParentRoom().getUserList());
		}
		else {
			if(getParentRoom().getUserByName(email) != null)
				send("roulette_servermessage", resObj, getParentRoom().getUserByName(email));
		}
	}

	public void sendMessage(String email, String name, String message, boolean isDealer)
	{
		ISFSObject resObj = new SFSObject();
		resObj.putUtfString("email", email);
		resObj.putUtfString("name", name);
		resObj.putUtfString("message", message);
		resObj.putBool("dealer", isDealer);

		int pos = -1;
		for(Player player : table.players) {
			if(player.getEmail().compareTo(email) == 0)
				pos = player.getPos();
		}
		for(Player player : table.newPlayers) {
			if(player.getEmail().compareTo(email) == 0)
				pos = player.getPos();
		}
		resObj.putInt("pos", pos);

		if(getParentRoom().getUserList().size() > 0)
			send("roulette_chat", resObj, getParentRoom().getUserList());
	}

	public void addPlayerChipcount(String email, long value) {
		long chip = getPlayerChipcount(email);
		setPlayerChipcount(email, chip + value);
	}

	public void payPlayerChipcount(String email, long value) {
		long chip = getPlayerChipcount(email);
		chip -= value;
		if(chip < 0)
			chip = 0;
		setPlayerChipcount(email, chip);
	}

	public void setPlayerChipcount(String email, long value) {
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "UPDATE user SET chip=" + value + " WHERE email=\"" + email + "\"";
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}

	public long getPlayerChipcount(String email) {
		long chipcount = 0;
		IDBManager dbManager = getParentZone().getDBManager();
		// System.out.println(email);
		String sql = "SELECT chip FROM user WHERE email=\"" + email + "\"";
		try {
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			chipcount = res.getSFSObject(0).getLong("chip");
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
		return chipcount;
	}


	public void payPlayerCoin(String email, long value) {
		long coin = getPlayerCoin(email);
		coin -= value;
		if(coin < 0)
			coin = 0;
		setPlayerCoin(email, coin);
	}

	public void setPlayerCoin(String email, long value) {
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "UPDATE user SET coin=" + value + " WHERE email=\"" + email + "\"";
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}

	public long getPlayerCoin(String email) {
		long coin = 0;
		IDBManager dbManager = getParentZone().getDBManager();
		// System.out.println(email);
		String sql = "SELECT coin FROM user WHERE email=\"" + email + "\"";
		try {
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			coin = res.getSFSObject(0).getLong("chip");
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
		return coin;
	}

	public ISFSObject getUserInfo(String email) {
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "SELECT * FROM user WHERE email=\"" + email + "\"";
		try {
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			return res.getSFSObject(0);
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
		return null;
	}

	public void addPlayInfo(String email, long winAmount)
	{
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "UPDATE user"
					+ " SET games_played=games_played+1"
					+ ", biggest_win = CASE WHEN (biggest_win < " + winAmount + ") THEN " + winAmount + " ELSE biggest_win END"
					+ " WHERE email=\"" + email + "\"";
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}

	public void setGift(String email, int giftCategory, int giftValue)
	{
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "UPDATE user"
					+ " SET gift_category=" + giftCategory
					+ ", gift_value=" + giftValue
					+ " WHERE email=\"" + email + "\"";
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}

}
