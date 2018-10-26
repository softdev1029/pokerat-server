package TexasPokerExtension;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import TexasPokerEngine.Card;
import TexasPokerEngine.Client;
import TexasPokerEngine.Hand;
import TexasPokerEngine.HandValue;
import TexasPokerEngine.PlayMode;
import TexasPokerEngine.Player;
import TexasPokerEngine.PlayerStatus;
import TexasPokerEngine.Table;
import TexasPokerEngine.TableType;
import TexasPokerAction.Action;
import TexasPokerAction.BetAction;
import TexasPokerAction.RaiseAction;
import TexasPokerBot.BasicBot;

import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.entities.variables.RoomVariable;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;
import com.smartfoxserver.v2.extensions.SFSExtension;

public class RoomExtension extends SFSExtension implements Client {

	public Table table;

	private static final TableType TABLE_TYPE = TableType.NO_LIMIT;

	private int tableSize = 9;
	private boolean isFast = true;
	public BigDecimal minBuyin = BigDecimal.valueOf(500);
	public BigDecimal maxBuyin = BigDecimal.valueOf(10000);
	public BigDecimal bigBlind = BigDecimal.valueOf(10);

	private int BOT_WAITING_TIME = 1;
	private int USER_WAITING_TIME = 20;
	private int CARD_BACK_NUM = 52;
	private int CARD_PLACEHOLDER_NUM = 53;

	private Player humanPlayer;
	private String dealerName;
	private int dealerPos;
	private String actorName;
	private int actorPos;

	private Timer timer;
	private TimerTask task;
	private Action selectedAction;
	private final Object monitor = new Object();
	private boolean prevShow = false;

	public static class TableInfo {
		public long blind;
		public long minBuyin, maxBuyin;

		public TableInfo(long b, long minb, long maxb) {
			blind = b;
			minBuyin = minb;
			maxBuyin = maxb;
		}
	}

	private static TableInfo[] TEXAS_INFO = { new TableInfo(2, 20, 40), new TableInfo(10, 100, 1000),
			new TableInfo(50, 500, 20000), new TableInfo(200, 2000, 50000), new TableInfo(1000, 10000, 200000),
			new TableInfo(4000, 40000, 1000000), new TableInfo(20000, 200000, 4000000),
			new TableInfo(100000, 1000000, 20000000), new TableInfo(500000, 5000000, 100000000),
			new TableInfo(1000000, 10000000, 400000000), new TableInfo(2000000, 100000000, 1000000000),
			new TableInfo(10000000, 200000000, 2000000000), new TableInfo(20000000, 400000000, 4000000000l),
			new TableInfo(50000000, 1000000000, 10000000000l), new TableInfo(100000000, 2000000000, 20000000000l), };

	@Override
	public void init() {
		addRequestHandler("texas_ready", ReadyHandler.class);
		addRequestHandler("texas_join", JoinHandler.class);
		addRequestHandler("texas_action", ActionHandler.class);
		addRequestHandler("texas_leave", TexasLeaveHandler.class);
		addRequestHandler("texas_sitout", SitOutHandler.class);
		addRequestHandler("texas_setrebuy", SetRebuyHandler.class);
		addRequestHandler("texas_chat", ChatHandler.class);
		addRequestHandler("texas_addchip", AddChipHandler.class);
		addRequestHandler("texas_gift", GiftHandler.class);
		addRequestHandler("texas_anim_emoji", AnimEmojiHandler.class);

		addEventHandler(SFSEventType.USER_LEAVE_ROOM, LeaveHandler.class);
		addEventHandler(SFSEventType.USER_DISCONNECT, LeaveHandler.class);

		isFast = true;
		USER_WAITING_TIME = isFast ? 20 : 20;

		tableSize = this.getParentRoom().getVariable("table_size").getIntValue();
		int blindType = this.getParentRoom().getVariable("blind_type").getIntValue();
		boolean isEmpty = false;
		RoomVariable emptyVal = this.getParentRoom().getVariable("empty");
		if(emptyVal != null)
			isEmpty = emptyVal.getBoolValue();

		bigBlind = BigDecimal.valueOf(TEXAS_INFO[blindType].blind);
		minBuyin = BigDecimal.valueOf(TEXAS_INFO[blindType].minBuyin);
		maxBuyin = BigDecimal.valueOf(TEXAS_INFO[blindType].maxBuyin);

		table = new Table(PlayMode.NORMAL_MODE, TABLE_TYPE, tableSize, bigBlind, this);

		if(!isEmpty)
		{
			Random rd = new Random();
			BigDecimal botBuyin = minBuyin.add(maxBuyin).divide(BigDecimal.valueOf(2));
			int pos1 = rd.nextInt(2), pos2 = rd.nextInt(2) + 2;
			table.players[pos1].join(true, true, new BasicBot(0, 25), pos1, "Bot1", "Guest", 9, botBuyin, -1, 0);
			table.players[pos2].join(true, true,  new BasicBot(25, 60), pos2, "Bot2", "Guest", 10, botBuyin, -1, 0);
			table.players[4].join(true, true, new BasicBot(25, 90), 4, "Bot3", "Guest", 11, botBuyin, -1, 0);
		}
	}

	@Override
	public Object handleInternalMessage(String cmdName, Object params) {
		if (cmdName.equals("get_room_info")) {
			ISFSObject obj = new SFSObject();
			obj.putUtfString("name", getParentRoom().getName());
			obj.putInt("type", 0); // TexasPoker
			obj.putLong("blind", bigBlind.longValue());
			obj.putLong("min_buyin", minBuyin.longValue());
			obj.putLong("max_buyin", maxBuyin.longValue());
			obj.putLong("pot", table.getTotalChip().longValue());
			obj.putInt("size", tableSize);
			obj.putInt("player_num", table.playerSize());
			obj.putBool("speed", isFast);
			ISFSArray playerList = new SFSArray();
			for (Player player : table.players) {
				if (player.playerStatus != PlayerStatus.NONE) {
					ISFSObject obj1 = new SFSObject();
					obj1.putInt("pos", player.getPos());
					obj1.putUtfString("email", player.getEmail());
					obj1.putUtfString("name", player.getName());
					obj1.putLong("chip", player.getCash().longValue());
					playerList.addSFSObject(obj1);
				}
			}
			// for(Player player : table.newPlayers) {
			// ISFSObject obj1 = new SFSObject();
			// obj1.putInt("pos", player.getPos());
			// obj1.putUtfString("name", player.getName());
			// playerList.addSFSObject(obj1);
			// }
			obj.putSFSArray("player_list", playerList);

			return obj;
		}
		else if (cmdName.equals("get_user_balance")) {
			for(Player player : table.players)
			{
				if(player.getEmail().compareTo((String)params) == 0)
				{
					return player.getCash().longValue();
				}
			}
			return 0;
		}

		return null;
	}

	public void readyPlayer(String email, boolean isAutomatic) {
		for (Player player : table.players) {
			if (player.playerStatus != PlayerStatus.NONE) {
				if (email.compareTo(player.getEmail()) == 0) {
					ISFSObject obj = new SFSObject();
					obj.putInt("pos", player.getPos());
					if (getParentRoom().getUserByName(email) != null)
						send("texas_ready", obj, getParentRoom().getUserByName(email));
				}
			}
		}
		// for(Player player : table.newPlayers) {
		// if(email.compareTo(player.getEmail()) == 0) {
		// ISFSObject obj = new SFSObject();
		// obj.putInt("pos", player.getPos());
		// if(getParentRoom().getUserByName(email) != null)
		// send("texas_ready", obj, getParentRoom().getUserByName(email));
		// }
		// }
		if (isAutomatic) {
			for (int i = 0; i < tableSize; i++) {
				boolean flag = true;
				for (Player player : table.players) {
					if (player.playerStatus != PlayerStatus.NONE) {
						if (player.getPos() == i)
							flag = false;
					}
				}
				// for(Player player : table.newPlayers) {
				// if(player.getPos() == i)
				// flag = false;
				// }
				if (flag) {
					ISFSObject obj = new SFSObject();
					obj.putInt("pos", i);
					if (getParentRoom().getUserByName(email) != null)
						send("texas_autojoin", obj, getParentRoom().getUserByName(email));
					break;
				}
			}
		}
		updateAll();
		if (!table.isRunning()) {
			if (table.playerSize() >= 2)
				table.run();
		}
	}

	public void addChip(ISFSObject params) {
		String email = params.getUtfString("email");
		long chip = params.getLong("chip");
		for (Player player : table.players) {
			if (player.playerStatus != PlayerStatus.NONE) {
				if (player.getEmail().compareTo(email) == 0) {
					if(player.playerStatus == PlayerStatus.ACTIVE && player.isActive)
					{
						player.isAddChip = true;
						player.newChip = chip;
					}
					else
					{
						player.newChip = chip;
//						System.out.println("chip: " + player.getCash() + ", newChip: " + chip);
						sendNewChip(player);
						if(player.playerStatus == PlayerStatus.SITOUT)
							sitoutPlayer(player.getEmail(), false);
						else
							updatePlayer(player, false, false);
					}
					return;
				}
			}
		}
	}

	public void sendNewChip(Player player) {
		long diff = player.newChip - player.getCash().longValue();
		if(!player.isBot())
			payPlayerChipcount(player.getEmail(), diff);
		player.isAddChip = false;
		player.setCash(BigDecimal.valueOf(player.newChip));

		ISFSObject obj = new SFSObject();
		obj.putInt("pos", player.getPos());
		obj.putLong("diff", diff);
		if (getParentRoom().getUserList().size() > 0)
			send("texas_addchip", obj, getParentRoom().getUserList());
	}
	
	public void sendRebuy(Player player) {
		if (!player.isBot() && getParentRoom().getUserByName(player.getEmail()) != null)
			send("texas_rebuy", new SFSObject(), getParentRoom().getUserByName(player.getEmail()));
	}
	
	public void setRebuy(String email, boolean isRebuy) {
		for(Player player: table.players) {
			if (player.playerStatus == PlayerStatus.NONE)
				continue;
			if (email.compareTo(player.getEmail()) == 0) {
				player.isAutoRebuy = isRebuy;
			}
		}
	}

	public void joinNewPlayer(ISFSObject params) {
		int pos = params.getInt("pos");
		String email = params.getUtfString("email");
		String name = params.getUtfString("name");
		long buyin = params.getLong("buyin");
		boolean isAutoRebuy = params.getBool("rebuy");

		ISFSObject info = getUserInfo(email);

		int giftCategory = info.getInt("gift_category");
		int giftValue = info.getInt("gift_value");

		int i = 0;

		if (table.playerSize() == tableSize)
			return;
		addPlayerChipcount(email, -buyin);

		table.players[pos].join(false, isAutoRebuy, this, pos, email, name, 0, BigDecimal.valueOf(buyin), giftCategory, giftValue);

		updateAll();

		if (getParentRoom().getUserList().size() > 0)
			send("texas_join", params, getParentRoom().getUserList());
		sendMessage("", "Dealer", name + " has joined the game.", true);

		if (!table.isRunning()) {
			if (table.playerSize() >= 2)
				table.run();
		}
	}

	public void leavePlayer(String email, int status) {
		for (Player player : table.players) {
			if (player.playerStatus == PlayerStatus.NONE)
				continue;
			if (email.compareTo(player.getEmail()) == 0) {
				if (player.isActive) {
					if (table.actor == player) {
						setSelectedAction(1, 0);
					} else {
						player.isActive = false;
						// table.activePlayers.remove(player);
						table.playersToAct--;
					}
				}

				// player.playerStatus = PlayerStatus.NONE;
				player.leave();
				removePlayer(player, status);
			}
		}
	}

	public void removePlayer(Player player, int status) {
		if (!player.isBot())
			addPlayerChipcount(player.getEmail(), player.getCash().longValue());
		if (getParentRoom().getUserList().size() > 0) {
			ISFSObject obj = new SFSObject();
			obj.putInt("pos", player.getPos());
			obj.putUtfString("email", player.getEmail());
			obj.putUtfString("name", player.getName());
			obj.putInt("status", status);
			send("texas_leave", obj, getParentRoom().getUserList());
		}
		sendMessage("", "Dealer", player.getName() + " has left the game.", true);
		showBestCards();
	}

	public void sitoutPlayer(String email, boolean isSitOut) {
		for (Player player : table.players) {
			if (player.playerStatus == PlayerStatus.NONE)
				continue;
			if (email.compareTo(player.getEmail()) == 0) {
				if (player.isActive) {
					if (table.actor == player) {
						setSelectedAction(1, 0);
					} else {
						player.isActive = false;
						// table.activePlayers.remove(player);
						table.playersToAct--;
					}
				}

				if(isSitOut)
				{
//					System.out.println("sitout start");
					player.playerStatus = PlayerStatus.SITOUT;
					player.resetHand();
					player.setAction(Action.SIT_OUT);
//					System.out.println(player.playerStatus.toString());
				}
				else
				{
					player.playerStatus = PlayerStatus.ACTIVE;
					player.resetHand();
				}
			}
		}
		updateAll();
	}

	public void updateAll() {
		updateBoard(0);
		updatePlayers(prevShow, false);
		showBestCards();
		if (table.isRunning()) {
			setBlind();
			selectActor(table.actor, table.isSelect);
		}
	}

	public void sendChipStatus(String _email) {
		if (getParentRoom().getUserByName(_email) == null)
			return;
		long amount = getPlayerChipcount(_email);
		ISFSObject obj = new SFSObject();
		obj.putLong("chip", amount);
		send("texas_chipstatus", obj, getParentRoom().getUserByName(_email));
	}

	/**
	 * The application's entry point.
	 * 
	 * @param args
	 *            The command line arguments.
	 */

	@Override
	public void joinedTable(Player playerToNotify, TableType type, BigDecimal bigBlind, List<Player> players) {
		for (Player player : players) {
			playerUpdated(playerToNotify, player);
		}
	}

	@Override
	public void messageReceived(Player playerToNotify, String message) {
		// sendMessage(playerToNotify.getEmail(), message);
	}

	public void sendMessage(String message) {
		ISFSObject resObj = new SFSObject();
		resObj.putUtfString("text", message);
		if (getParentRoom().getUserList().size() > 0)
			send("texas_settext", resObj, getParentRoom().getUserList());
	}

	public void sendMessage(String email, String name, String message, boolean isDealer) {
		ISFSObject resObj = new SFSObject();
		resObj.putUtfString("email", email);
		resObj.putUtfString("name", name);
		resObj.putUtfString("message", message);
		resObj.putBool("dealer", isDealer);

		int pos = -1;
		for (Player player : table.players) {
			if (player.playerStatus == PlayerStatus.NONE)
				continue;
			if (player.getEmail().compareTo(email) == 0)
				pos = player.getPos();
		}
		resObj.putInt("pos", pos);

		if (getParentRoom().getUserList().size() > 0)
			send("texas_chat", resObj, getParentRoom().getUserList());
	}

	@Override
	public void handStarted(Player playerToNotify, Player dealer) {
		setDealer(playerToNotify, dealerPos, false);
		dealerPos = dealer.getPos();
		dealerName = dealer.getName();
		setDealer(playerToNotify, dealer.getPos(), true);
	}

	public void setDealer(int pos) {
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", pos);
		if (getParentRoom().getUserList().size() > 0)
			send("texas_setdealer", resObj, getParentRoom().getUserList());
	}

	public void setBlind(int _pos, int type) {
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", _pos);
		resObj.putInt("type", type);
		// resObj.putUtfString("blind_text", blindText);
		if (getParentRoom().getUserList().size() > 0)
			send("texas_setblind", resObj, getParentRoom().getUserList());
	}

	public void setBlind(Player blind, int type) {
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", blind.getPos());
		resObj.putInt("type", type);
		// resObj.putUtfString("blind_text", blindText);
		if (getParentRoom().getUserList().size() > 0)
			send("texas_setblind", resObj, getParentRoom().getUserList());
	}

	@Override
	public void setBlind(Player playerToNotify, Player blind, String blindText) {
		if (getParentRoom().getUserByName(playerToNotify.getEmail()) == null)
			return;
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", blind.getPos());
		resObj.putUtfString("blind_text", blindText);
		send("texas_setblind", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));
	}

	public void setBlind() {
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos0", table.dealerPos);
		resObj.putInt("pos1", table.smallBlindPos);
		resObj.putInt("pos2", table.bigBlindPos);
		// System.out.println("Blind:" + table.dealerPos + "," + table.smallBlindPos +
		// "," + table.bigBlindPos);
		if (getParentRoom().getUserList().size() > 0)
			send("texas_setblind", resObj, getParentRoom().getUserList());
	}

	@Override
	public void actorRotated(Player playerToNotify, Player actor) {
		setActorInTurn(playerToNotify, actorPos, false);
		actorPos = actor.getPos();
		actorName = actor.getName();
		setActorInTurn(playerToNotify, actorPos, true);
	}

	public void selectActor(Player actor, boolean show) {
		actorPos = actor.getPos();
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", actorPos);
		resObj.putBool("show", show);
		resObj.putInt("time", actor.isBot() ? BOT_WAITING_TIME : ((isFast) ? 10 : 20));
		if (getParentRoom().getUserList().size() > 0)
			send("texas_setactor", resObj, getParentRoom().getUserList());
	}

	@Override
	public void selectActor(Player playerToNotify, Player actor, boolean show) {
		if (getParentRoom().getUserByName(playerToNotify.getEmail()) == null)
			return;
		actorPos = actor.getPos();
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", actorPos);
		resObj.putBool("show", show);
		resObj.putInt("time", actor.isBot() ? BOT_WAITING_TIME : ((isFast) ? 10 : 20));
		send("texas_setactor", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));
	}

	public void updateBoard(int dealRound) {
		ISFSObject resObj = new SFSObject();
		List<Integer> cardArray = new ArrayList<Integer>();
		for (Card card : table.board) {
			cardArray.add(card.hashCode());
		}

		long pot = table.getTotalPot().longValue();
		for (Player player : table.players) {
			pot -= player.getBet().longValue();
		}

		resObj.putIntArray("cards", cardArray);
		resObj.putLong("pot", pot);
		resObj.putInt("dealround", dealRound);

		if (getParentRoom().getUserList().size() > 0)
			send("texas_updateboard", resObj, getParentRoom().getUserList());
	}

	@Override
	public void boardUpdated(Player playerToNotify, List<Card> cards, BigDecimal bet, BigDecimal pot) {
		if (getParentRoom().getUserByName(playerToNotify.getEmail()) == null)
			return;
		playerUpdated(playerToNotify, playerToNotify);

		ISFSObject resObj = new SFSObject();
		List<Integer> cardArray = new ArrayList<Integer>();
		for (Card card : cards) {
			cardArray.add(card.hashCode());
		}
		resObj.putIntArray("cards", cardArray);
		resObj.putLong("pot", pot.longValue());

		send("texas_updateboard", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));
	}

	public void resetButtons() {
		if (getParentRoom().getUserList().size() > 0)
			send("texas_reset", new SFSObject(), getParentRoom().getUserList());
	}

	@Override
	public void playerUpdated(Player playerToNotify, Player player) {
		updatePlayer(playerToNotify, player, false, false);
	}

	public void updatePlayers(boolean isShow, boolean isDeal) {
		prevShow = isShow;
		for (Player player : table.players) {
			if (player.playerStatus == PlayerStatus.ACTIVE) {
//				if (!isShow)
//					updatePlayer(player.publicClone(), false, isDeal);
//				else if (player.isShow)
//					updatePlayer(player, false, isDeal);
//				else
//					updatePlayer(player.publicClone(), false, isDeal);
//
//				if (!player.isBot())
//					updatePlayer(player, player, false, isDeal);

				updatePlayer(player, false, isDeal);
			}
			else if (player.playerStatus == PlayerStatus.NEW)
				updatePlayer(player, true, isDeal);
			else if (player.playerStatus == PlayerStatus.SITOUT)
				updatePlayer(player, false, isDeal);
		}
		showBestCards();
	}

	void updatePlayer(Player player, boolean isNew, boolean isDeal) {
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", player.getPos());
		resObj.putUtfString("email", player.getEmail());
		resObj.putUtfString("name", player.getName());
		// resObj.putInt("avatar", player.getAvatar());
		resObj.putLong("chip", player.getCash().longValue());
		resObj.putLong("balance", player.getCash().longValue() + getPlayerChipcount(player.getEmail()));
		resObj.putInt("raise", player.raise);
		// System.out.println("UPDATE1:" + player.getName() + ":" + player.raise);
		resObj.putLong("pot", player.getBet().longValue());
		resObj.putBool("new", isNew);
		resObj.putBool("sitout", player.playerStatus == PlayerStatus.SITOUT);
		resObj.putBool("active", player.isActive);
		resObj.putBool("deal", isDeal);
//		resObj.putBool("winner", player.isWinner);
		resObj.putInt("gift_category", player.giftCategory);
		resObj.putInt("gift_detail", player.giftDetail);
		resObj.putBool("show", player.isShow);
		resObj.putUtfString("hand_value", player.handValue);
		// System.out.println(player.getEmail() + "," + player.giftCategory + "," +
		// player.giftDetail);
		Action action = player.getAction();
		if (action != null) {
			resObj.putUtfString("action", action.getName());
		} else {
			resObj.putUtfString("action", "");
		}
		if (player.hasCards()) {
			Card[] cards = player.getCards();
			if (cards.length == 2) {
				// Visible cards.
				resObj.putInt("card1", cards[0].hashCode());
				resObj.putInt("card2", cards[1].hashCode());
			} else {
				// Hidden cards (face-down).
				resObj.putInt("card1", CARD_BACK_NUM);
				resObj.putInt("card2", CARD_BACK_NUM);
			}
		} else {
			// No cards.
			resObj.putInt("card1", CARD_PLACEHOLDER_NUM);
			resObj.putInt("card2", CARD_PLACEHOLDER_NUM);
		}

		if (getParentRoom().getUserList().size() > 0)
			send("texas_updateplayer", resObj, getParentRoom().getUserList());
	}

	void updatePlayer(Player playerToNotify, Player player, boolean isNew, boolean isDeal) {
		ISFSObject resObj = new SFSObject();
		resObj.putInt("pos", player.getPos());
		resObj.putUtfString("email", player.getEmail());
		resObj.putUtfString("name", player.getName());
		// resObj.putInt("avatar", player.getAvatar());
		resObj.putInt("raise", player.raise);
		// System.out.println("UPDATE2:" + player.getName() + ":" + player.raise);
		resObj.putLong("chip", player.getCash().longValue());
		resObj.putLong("balance", player.getCash().longValue() + getPlayerChipcount(player.getEmail()));
		resObj.putLong("pot", player.getBet().longValue());
		resObj.putBool("new", isNew);
		resObj.putBool("sitout", player.playerStatus == PlayerStatus.SITOUT);
		resObj.putBool("active", player.isActive);
		resObj.putBool("deal", isDeal);
//		resObj.putBool("winner", player.isWinner);
		resObj.putInt("gift_category", player.giftCategory);
		resObj.putInt("gift_detail", player.giftDetail);
		resObj.putBool("show", player.isShow);
		resObj.putUtfString("hand_value", player.handValue);
		// System.out.println(player.getEmail() + "," + player.giftCategory + "," +
		// player.giftDetail);
		Action action = player.getAction();
		if (action != null) {
			resObj.putUtfString("action", action.getName());
		} else {
			resObj.putUtfString("action", "");
		}
		if (player.hasCards()) {
			Card[] cards = player.getCards();
			if (cards.length == 2) {
				// Visible cards.
				resObj.putInt("card1", cards[0].hashCode());
				resObj.putInt("card2", cards[1].hashCode());
			} else {
				// Hidden cards (face-down).
				resObj.putInt("card1", CARD_BACK_NUM);
				resObj.putInt("card2", CARD_BACK_NUM);
			}
		} else {
			// No cards.
			resObj.putInt("card1", CARD_PLACEHOLDER_NUM);
			resObj.putInt("card2", CARD_PLACEHOLDER_NUM);
		}

		if (getParentRoom().getUserByName(playerToNotify.getEmail()) != null)
			send("texas_updateplayer", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));
	}

	public void showBestCards() {
		if (table.showPlayer != null) {
			Hand hand = new Hand(table.board);
			hand.addCards(table.showPlayer.getCards());
			HandValue handValue = new HandValue(hand);
			List<Card> cards = handValue.getBestCards();

			ISFSObject resObj = new SFSObject();
			resObj.putInt("pos", table.showPlayer.getPos());
			resObj.putBool("winner", true);
			resObj.putInt("value", handValue.getType().getValue());
			resObj.putUtfString("description", handValue.getDescription());
			List<Integer> cardArray = new ArrayList<Integer>();
			if(table.showPlayer.isShow)
			{
				for (Card card : cards)
					cardArray.add(card.hashCode());
			}
			resObj.putIntArray("cards", cardArray);
			if (getParentRoom().getUserList().size() > 0)
				send("texas_showbestcards", resObj, getParentRoom().getUserList());
			return;
		}
		for (Player player : table.players) {
			if (player.playerStatus == PlayerStatus.NONE || player.isBot())
				continue;
			Player showPlayer = (table.showPlayer == null) ? player : table.showPlayer;
			Hand hand = new Hand(table.board);
			hand.addCards(showPlayer.getCards());
			HandValue handValue = new HandValue(hand);
			List<Card> cards = handValue.getBestCards();

			ISFSObject resObj = new SFSObject();
			resObj.putInt("pos", showPlayer.getPos());
			resObj.putBool("winner", false);
			resObj.putInt("value", handValue.getType().getValue());
			resObj.putUtfString("description", handValue.getDescription());
			List<Integer> cardArray = new ArrayList<Integer>();
			for (Card card : cards)
				cardArray.add(card.hashCode());
			resObj.putIntArray("cards", cardArray);
			if (getParentRoom().getUserByName(player.getEmail()) != null)
				send("texas_showbestcards", resObj, getParentRoom().getUserByName(player.getEmail()));
		}
	}

	public void hideBestCards() {
		if (getParentRoom().getUserList().size() > 0)
			send("texas_hidebestcards", new SFSObject(), getParentRoom().getUserList());
	}
	
	public void showWinnerCards(Player player)
	{
		Card[] cards = player.getCards();
		ISFSObject obj = new SFSObject();
		obj.putInt("pos", player.getPos());
		obj.putInt("card1", cards[0].hashCode());
		obj.putInt("card2", cards[1].hashCode());

		if (getParentRoom().getUserList().size() > 0)
			send("texas_show_winner_cards", obj, getParentRoom().getUserList());
	}
	
	public void payWinnerChips(Player player, Long pot, HandValue handValue)
	{
		Card[] cards = player.getCards();
		ISFSObject obj = new SFSObject();
		obj.putInt("pos", player.getPos());
		obj.putLong("chip", player.getCash().longValue());
		obj.putLong("pot", pot);
		obj.putInt("card1", cards[0].hashCode());
		obj.putInt("card2", cards[1].hashCode());
		obj.putUtfString("hand", handValue.getDescription());

		if (getParentRoom().getUserList().size() > 0)
			send("texas_pay_winner_chips", obj, getParentRoom().getUserList());
	}
	
	public void hideWinners()
	{
		if (getParentRoom().getUserList().size() > 0)
			send("texas_hide_winners", new SFSObject(), getParentRoom().getUserList());
	}
	
	public void updateHandHistory(String name, long pot, HandValue handValue) {

		sendMessage("", "Dealer", name + " wins " + table.getGameText(pot) + " with " + handValue.toString(), true);

		ISFSObject obj = new SFSObject();
		obj.putUtfString("name", name);
		obj.putLong("pot", pot);
		obj.putUtfString("hand", handValue.getWholeCardString());
		if (getParentRoom().getUserList().size() > 0)
			send("texas_update_hand_history", obj, getParentRoom().getUserList());
	}

	@Override
	public void playerActed(Player playerToNotify, Player player) {
		Action action = player.getAction();
		// System.out.println(action.getName());
		if (action != null) {
			if (player.getClient() != this) {
				waitForUserInput();
			}
		}
	}

	public void sendAllowedActions(Player playerToNotify, BigDecimal minBet, Set<Action> allowedActions) {
		if (getParentRoom().getUserByName(playerToNotify.getEmail()) == null)
			return;
		// Send client actions
		ISFSObject resObj = new SFSObject();
		resObj.putLong("pot", playerToNotify.getBet().longValue());
		resObj.putLong("min_bet", minBet.longValue());
		resObj.putLong("chip", playerToNotify.getCash().longValue());
		resObj.putInt("action_size", allowedActions.size());
		int i = 0;
		for (Action action : allowedActions) {
			resObj.putUtfString("action" + i, action.getName());
			i++;
		}
		send("texas_allowedactions", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));
	}

	@Override
	public Action act(Player playerToNotify, BigDecimal bigBlind, BigDecimal callAmount, BigDecimal minBetAmount, BigDecimal maxBetAmount, List<Card> board,
			Set<Action> allowedActions) {
		return getUserInput(playerToNotify, callAmount, minBetAmount, maxBetAmount, allowedActions);
	}

	/**
	 * Sets whether the actor is in turn.
	 * 
	 * @param isInTurn
	 *            Whether the actor is in turn.
	 */
	private void setActorInTurn(Player playerToNotify, int _pos, boolean isInTurn) {
		if (getParentRoom().getUserByName(playerToNotify.getEmail()) == null)
			return;
		ISFSObject resObj = new SFSObject();
		resObj.putInt("actor_pos", _pos);
		resObj.putBool("show", isInTurn);
		resObj.putInt("waiting_time", isFast ? 10 : 20);
		send("texas_setactor", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));
	}

	/**
	 * Sets the dealer.
	 * 
	 * @param isDealer
	 *            Whether the player is the dealer.
	 */
	private void setDealer(Player playerToNotify, int _pos, boolean isDealer) {
		if (getParentRoom().getUserByName(playerToNotify.getEmail()) == null)
			return;
		ISFSObject resObj = new SFSObject();
		resObj.putInt("dealer_pos", _pos);
		resObj.putBool("is_dealer", isDealer);
		send("texas_setdealer", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));
	}

	// public void dealCards(int round)
	// {
	// ISFSObject resObj = new SFSObject();
	// resObj.putInt("round", round);
	// if(getParentRoom().getUserList() != null)
	// send("texas_dealcards", resObj, getParentRoom().getUserList());
	// }

	Room getGameRoom() {
		return this.getParentRoom();
	}

	void setSelectedAction(int mode, long value) {
		if (mode == 1)
			selectedAction = Action.FOLD;
		else if (mode == 2)
			selectedAction = Action.CHECK;
		else if (mode == 3)
			selectedAction = Action.CALL;
		else if (mode == 4)
			selectedAction = new RaiseAction(new BigDecimal(value));
		else if (mode == 5)
			selectedAction = Action.ALL_IN;

		timer.cancel();
		synchronized (monitor) {
			monitor.notifyAll();
		}
	}

	/**
	 * Waits for the user to click the Continue button.
	 */
	public void waitForUserInput() {
		selectedAction = null;
		// SetTimer
		timer = new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				// Your database code here
				if (selectedAction == null) {
					selectedAction = Action.CONTINUE;
					synchronized (monitor) {
						monitor.notifyAll();
					}
				}
			}
		}, 1 * 1000);

		while (selectedAction == null) {
			// Wait for the user to select an action.
			synchronized (monitor) {
				try {
					monitor.wait();
				} catch (InterruptedException e) {
					// Ignore.
				}
			}
		}
		timer.cancel();
	}

	/**
	 * Waits for the user to click an action button and returns the selected action.
	 * 
	 * @param minBet
	 *            The minimum bet.
	 * @param cash
	 *            The player's remaining cash.
	 * @param allowedActions
	 *            The allowed actions.
	 * 
	 * @return The selected action.
	 */
	public Action getUserInput(Player playerToNotify, BigDecimal callAmount, BigDecimal minBetAmount, BigDecimal maxBetAmount, 
			final Set<Action> allowedActions) {
		selectedAction = null;

		if (getParentRoom().getUserByName(playerToNotify.getEmail()) == null)
			return null;

		// Send client actions
		ISFSObject resObj = new SFSObject();
		resObj.putLong("pot", playerToNotify.getBet().longValue());
		resObj.putLong("call_amount", callAmount.longValue());
		resObj.putLong("min_bet", minBetAmount.longValue());
		resObj.putLong("max_bet", maxBetAmount.longValue());
		resObj.putInt("action_size", allowedActions.size());
		resObj.putLong("cash", playerToNotify.getCash().longValue());
		int i = 0;
		for (Action action : allowedActions) {
			resObj.putUtfString("action" + i, action.getName());
			i++;
		}
		send("texas_userinput", resObj, getParentRoom().getUserByName(playerToNotify.getEmail()));

		timer = new Timer();
		task = new TimerTask() {
			@Override
			public void run() {
				// Your database code here
				if (selectedAction == null) {
					selectedAction = Action.NO_RESPONSE;
					synchronized (monitor) {
						monitor.notifyAll();
					}
				}
			}
		};
		timer.schedule(task, ((isFast) ? 20 : 20) * 1000);

		while (selectedAction == null) {
			// Wait for the user to select an action.
			synchronized (monitor) {
				try {
					monitor.wait();
				} catch (InterruptedException e) {
					// Ignore.
				}
			}
		}
		timer.cancel();
		if (getParentRoom().getUserByName(playerToNotify.getEmail()) != null)
			send("texas_hidebuttons", new SFSObject(), getParentRoom().getUserByName(playerToNotify.getEmail()));

		return selectedAction;
	}

	public void potAnim(int pos) {
		if (getParentRoom().getUserList().size() > 0) {
			ISFSObject obj = new SFSObject();
			obj.putInt("pos", pos);
			send("texas_potanim", obj, getParentRoom().getUserList());
		}
	}

	public void kickPlayers() {
		if (getParentRoom().getUserList().size() > 0)
			send("texas_kick", new SFSObject(), getParentRoom().getUserList());
		getApi().removeRoom(getParentRoom());
	}

	public void setGift(ISFSObject params) {
		String email = params.getUtfString("email");
		boolean isAll = params.getBool("all");
		int pos = params.getInt("to");
		int category = params.getInt("category");
		int detail = params.getInt("detail");
		long amount = params.getLong("amount");
		boolean isCoin = params.getBool("coin");

		if (isCoin)
			payPlayerCoin(email, amount);
		else
			payPlayerChipcount(email, amount);
		for (Player player : table.players) {
			if (player.playerStatus == PlayerStatus.NONE)
				continue;
			if (isAll || (pos == player.getPos())) {
				player.setGift(category, detail);
				if (!player.isBot())
					setGift(player.getEmail(), category, detail);
			}
		}
		// for(Player player : table.newPlayers) {
		// if(isAll || (pos == player.getPos())) {
		// player.giftCategory = category;
		// player.giftDetail = detail;
		// }
		// }
		// updateAll();
		if (getParentRoom().getUserList().size() > 0)
			send("texas_gift", params, getParentRoom().getUserList());
	}
	
	public void ShowAnimEmoji(ISFSObject params)
	{
		if (getParentRoom().getUserList().size() > 0)
			send("texas_anim_emoji", params, getParentRoom().getUserList());
	}

	public void addPlayerChipcount(String email, long value) {
		long chip = getPlayerChipcount(email);
		setPlayerChipcount(email, chip + value);
	}

	public void payPlayerChipcount(String email, long value) {
		long chip = getPlayerChipcount(email);
		chip -= value;
		if (chip < 0)
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
			if(res.size() > 0)
				chipcount = res.getSFSObject(0).getLong("chip");
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
		return chipcount;
	}

	public void payPlayerCoin(String email, long value) {
		long coin = getPlayerCoin(email);
		coin -= value;
		if (coin < 0)
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
			coin = res.getSFSObject(0).getLong("coin");
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

	public void setGift(String email, int giftCategory, int giftValue) {
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "UPDATE user" + " SET gift_category=" + giftCategory + ", gift_value=" + giftValue
				+ " WHERE email=\"" + email + "\"";
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}

	public void addPlayInfo(String email, long winAmount) {
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "UPDATE user" + " SET games_played=games_played+1" + ", biggest_win = CASE WHEN (biggest_win < "
				+ winAmount + ") THEN " + winAmount + " ELSE biggest_win END" + " WHERE email=\"" + email + "\"";
		// System.out.println(sql);
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}

}
