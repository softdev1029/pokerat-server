package ZoneExtension;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;

import TexasPokerEngine.Player;
import TexasPokerEngine.PlayerStatus;
import TexasPokerExtension.LeaveHandler;
import TexasPokerExtension.RoomExtension;

import com.smartfoxserver.v2.api.CreateRoomSettings;
import com.smartfoxserver.v2.api.CreateRoomSettings.RoomExtensionSettings;
import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.SFSRoom;
import com.smartfoxserver.v2.entities.SFSRoomRemoveMode;
import com.smartfoxserver.v2.entities.SFSZone;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.entities.variables.RoomVariable;
import com.smartfoxserver.v2.entities.variables.SFSRoomVariable;
import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;
import com.smartfoxserver.v2.extensions.SFSExtension;


public class ZoneExtension extends SFSExtension {

	public static ZoneExtension tempVar = null;
	public enum DynamicRoomType
	{
		RT_DEFAULT,
		RT_AUTO_CREATE,
		RT_PRIVATE
	}
	// for debugging
	public static String whereis() {
		StackTraceElement ste = Thread.currentThread().getStackTrace()[2];
		String where = "Zone: " + ste.getClassName() + " " + ste.getMethodName() + " " + ste.getLineNumber() + " ";
//		System.out.println(where);
		return where;
	}

	@Override
	public void init() {
		addRequestHandler("login", LoginHandler.class);
		addRequestHandler("register", RegisterHandler.class);
		addRequestHandler("reset_password", ResetPasswordHandler.class);

		addRequestHandler("get_room_list", GetRoomListHandler.class);
		addRequestHandler("getuserinfo", GetUserInfoHandler.class);
		addRequestHandler("update_userinfo", UpdateUserInfoHandler.class);
		addRequestHandler("update_global_info", UpdateGlobalInfoHandler.class);
		addRequestHandler("get_leaderboard", GetLeaderboardHandler.class);
		addRequestHandler("get_random_userlist", GetRandomUserListHandler.class);

		addRequestHandler("friend_action", FriendActionHandler.class);
		addRequestHandler("get_friend_list", GetFriendListHandler.class);
		addRequestHandler("update_friend_list", UpdateFriendListHandler.class);
		addRequestHandler("get_friend_request_list",
				GetFriendRequestListHandler.class);
		addRequestHandler("get_friend_search_list",
				GetFriendSearchListHandler.class);
		addRequestHandler("get_friend_room", GetFriendRoomHandler.class);
		addRequestHandler("invite_friend", InviteFriendHandler.class);
		addRequestHandler("friend_chat_action", FriendChatActionHandler.class);
		addRequestHandler("update_best_friend", UpdateBestFriendHandler.class);
		addRequestHandler("get_best_friend_request", GetBestFriendRequestHandler.class);
		addRequestHandler("read_best_friend_request", ReadBestFriendRequestHandler.class);
		
		addRequestHandler("send_message", SendMessageHandler.class);
		addRequestHandler("get_new_message", GetNewMessageHandler.class);
		addRequestHandler("get_message", GetMessageHandler.class);
		addRequestHandler("read_new_message", ReadNewMessageHandler.class);

		addRequestHandler("get_today_send_gift", GetTodaySendGiftHandler.class);
		addRequestHandler("transfer_gift", TransferGiftHandler.class);
		addRequestHandler("get_gift_transfer_list", GetGiftTransferListHandler.class);
		addRequestHandler("transfer_action", TransferActionHandler.class);
		
		addRequestHandler("create_private_table", CreatePrivateRoomHandler.class);		

		addRequestHandler("update_level", UpdateLevelHandler.class);
		addRequestHandler("get_news_level", GetNewsLevelHandler.class);
		addRequestHandler("read_news_level", ReadNewsLevelHandler.class);

		addRequestHandler("get_daily_bonus", GetDailyBonusHandler.class);
		addRequestHandler("update_daily_bonus", UpdateDailyBonusHandler.class);

		addRequestHandler("get_store_event", GetStoreEventHandler.class);
		addRequestHandler("store_buy", StoreBuyHandler.class);
		addRequestHandler("get_purchase_list", GetPurchaseListHandler.class);
		addRequestHandler("purchase_action", PurchaseActionHandler.class);
		
		addEventHandler(SFSEventType.SERVER_READY, ServerReadyHandler.class);
	}
	
	public void createTexasDefaultRooms()
	{
		int blindTypeCount = RoomExtension.TEXAS_INFO.length;
		int seatTypeCount = 2;
		int[][] roomCounts = new int[blindTypeCount][seatTypeCount];
		List<Room> roomList = getParentZone().getRoomList();
		for(Room room : roomList) {
			
			int tableSize = 9;
			RoomVariable v = room.getVariable("table_size");
			if(v == null)
				continue;
			tableSize = v.getIntValue();
			int blindType = 0;
			v = room.getVariable("blind_type");
			if(v == null)
				continue;
			blindType = v.getIntValue();
			int seatIndex = tableSize == 5 ? 0 : 1;
			if(blindType < blindTypeCount)
				roomCounts[blindType][seatIndex]++;
		}
		for(int i = 0; i < blindTypeCount; i++)
		{
			for(int j = 0; j < seatTypeCount; j++)
			{
				int seat = j == 0 ? 5 : 9;
				boolean isFast = true;
				while(roomCounts[i][j] < 2)
				{
					boolean isEmpty = (roomCounts[i][j] % 2) != 0;
					CreateRoom(i, seat, isFast, isEmpty, "TexasPoker", DynamicRoomType.RT_DEFAULT, null);
					roomCounts[i][j]++;
				}
			}
		}
	}
	
	private List<Room> getEmptyRoomList(int blindType, int seat, boolean speed, boolean isEmpty, String groupName)
	{
		List<Room> roomList = getParentZone().getRoomList();
		List<Room> emptyRoomList = new ArrayList<Room>();
		
		for(Room room : roomList) {
			if(!room.isGame() || room.getGroupId().compareTo("default") == 0)
				continue;
			
			int userCount = room.getUserList().size();
			int tableSize = 9;
			RoomVariable v = room.getVariable("table_size");
			if(v == null)
				continue;
			tableSize = v.getIntValue();
			if(tableSize != seat)
				continue;
			int curBlindType = 0;
			v = room.getVariable("blind_type");
			if(v == null)
				continue;
			curBlindType = v.getIntValue();
			if(blindType != curBlindType)
				continue;
			boolean curIsEmpty = false;
			v = room.getVariable("empty");
			if(v != null)
				curIsEmpty = v.getBoolValue();
			if(curIsEmpty != isEmpty)
				continue;
			if(!room.getGroupId().equals(groupName))
				continue;
			if(userCount == 0)
				emptyRoomList.add(room);
		}
		return emptyRoomList;
	}
	
	public void autoCreateRooms(int blindType, int seat, boolean speed, boolean isEmpty, String groupName)
	{
		
		List<Room> createdRoomList = new ArrayList<Room>();
		List<Room> emptyRoomList = getEmptyRoomList(blindType, seat, speed, isEmpty, groupName);
		int emptyRoomCount = emptyRoomList.size();
		while(emptyRoomCount < 1)
		{
			Room room = CreateRoom(blindType, seat, speed, isEmpty, groupName, DynamicRoomType.RT_AUTO_CREATE, null);
			if(room != null)
				createdRoomList.add(room);
			emptyRoomCount++;
		}
		if(emptyRoomList.size() < 1)
		{
			if(groupName.equals("TexasPoker"))
			{
				long blind = RoomExtension.getBlind(blindType);
				updateRoomList(0, blind, null);
			}
		}
	}

	public void autoDeleteRooms(int blindType, int seat, boolean speed, boolean isEmpty, String groupName)
	{
		ISFSArray res = new SFSArray();
		List<Room> deletedRoomList = new ArrayList<Room>();
		List<Room> emptyRoomList = getEmptyRoomList(blindType, seat, speed, isEmpty, groupName);
		for(int i = emptyRoomList.size() - 1; i >= 1  ; i--)
		{
			if(!emptyRoomList.get(i).isDynamic())
				continue;
			getApi().removeRoom(emptyRoomList.get(i));
			deletedRoomList.add(emptyRoomList.get(i));
			ISFSObject obj = new SFSObject();
			obj.putInt("table_pos", i);
			res.addSFSObject(obj);
		}
		if(deletedRoomList.size() > 0)
		{
			if(groupName.equals("TexasPoker"))
			{
				long blind = RoomExtension.getBlind(blindType);
				// removeRoomList(0, blind, res);
				updateRoomList(0, blind, null);
				ISFSObject response = new SFSObject();
				List<User> userList = new ArrayList<User>();
				userList.addAll(getParentZone().getUserList());
				send("update_friend_room", response, userList);
			}
		}
	}
	
	public void updateRoomList(int type, long blind, User user)
	{
		ISFSArray res = getRoomList(type, blind);
		
		ISFSObject response = new SFSObject();	
		response.putSFSArray("array", res);
		response.putInt("game_type", type);
		response.putLong("blind", blind);
		if(user != null)
			send("get_room_list", response, user);
		else
		{
			List<User> userList = new ArrayList<User>();
			userList.addAll(getParentZone().getUserList());
			send("update_room_list", response, userList);
		}
	}

	public ISFSArray getRoomList(int type, long blind)
	{
		ISFSArray res = new SFSArray();
		List<Room> roomList = getParentZone().getRoomList();
		List<ISFSObject> tempList = new ArrayList<ISFSObject>();
		for(Room room : roomList)
		{
			if(!room.isGame() || room.getGroupId().compareTo("default") == 0)
				continue;
			ISFSObject obj = (ISFSObject) room.getExtension().handleInternalMessage("get_room_info", null);
			if(obj != null && obj.getInt("type") == type)
			{
				if(type == 0) {
					if(blind >= 10000000 && obj.getLong("blind") >= 10000000)
						tempList.add(obj);
					else if(blind == obj.getLong("blind"))
						tempList.add(obj);
					
				}
				if(type == 2 && blind == obj.getLong("min_bet"))
					tempList.add(obj);
			}
		}
		
		// sort room list by min_buyin and is_empty
		tempList.sort(new Comparator<ISFSObject>() {
			@Override
			public int compare(ISFSObject o1, ISFSObject o2) {
				boolean empty1 = o1.getBool("is_empty");
				boolean empty2 = o2.getBool("is_empty");
				long min1 = o1.getLong("min_buyin");
				long min2 = o2.getLong("min_buyin");
				long tableSize1 = o1.getInt("size");
				long tableSize2 = o2.getInt("size");
				long playerNum1 = o1.getInt("player_num");
				long playerNum2 = o2.getInt("player_num");
				
				if(empty1 != empty2)
				{
					if(empty1 == true)
						return 1;
					else
						return -1;
				}
				else
				{
					if(min1 > min2)
						return 1;
					else if(min1 < min2)
						return -1;
					else
					{
						if(tableSize1 > tableSize2)
							return 1;
						else if(tableSize1 < tableSize2)
							return -1;
						else
						{
							return 0;
						}
					}
				}
			}
		});
		
		res = new SFSArray();
		for(int i = 0; i < tempList.size(); i++)
		{
			res.addSFSObject(tempList.get(i));
		}
		return res;
	}
	
	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	public Object handleInternalMessage(String cmdName, Object params) {
		if (cmdName.equals("auto_create_empty_table")) {
			ISFSObject obj = (ISFSObject) params;
			String groupName = obj.getUtfString("groupName");
			int blindType = obj.getInt("blind");
			int tableSize = obj.getInt("tableSize");
			boolean isFast = obj.getBool("speed");
			boolean isEmpty = obj.getBool("isEmpty");
			autoCreateRooms(blindType, tableSize, isFast, isEmpty, groupName);
		}
		else if(cmdName.equals("auto_delete_empty_table"))
		{
			ISFSObject obj = (ISFSObject) params;
			String groupName = obj.getUtfString("groupName");
			int blindType = obj.getInt("blind");
			int tableSize = obj.getInt("tableSize");
			boolean isFast = obj.getBool("speed");
			boolean isEmpty = obj.getBool("isEmpty");
			autoDeleteRooms(blindType, tableSize, isFast, isEmpty, groupName);
		}
		else if(cmdName.equals("update_room_list"))
		{
			ISFSObject obj = (ISFSObject) params;
			String groupName = obj.getUtfString("groupName");
			int blindType = obj.getInt("blind");
			if(groupName.equals("TexasPoker"))
			{
				long blind = RoomExtension.getBlind(blindType);
				updateRoomList(0, blind, null);
				ISFSObject response = new SFSObject();
				List<User> userList = new ArrayList<User>();
				userList.addAll(getParentZone().getUserList());
				send("update_friend_room", response, userList);
			}
		}
		return null;
	}
	
	public void AddUserInfo(ISFSObject obj) {
		User user = getParentZone().getUserByName(obj.getUtfString("email"));
		obj.putBool("online", user != null);
		if (user != null) {
			Room room = user.getLastJoinedRoom();
			if(room != null) {
				obj.putUtfString("room_name", room.getGroupId());
				if(room.getGroupId() == "TexasPoker" || room.getGroupId() == "Roulette")
				{
					long balance = (long)room.getExtension().handleInternalMessage("get_user_balance", obj.getUtfString("email"));
					obj.putLong("chip", obj.getLong("chip") + balance);
				}
			}
		}
		
		IDBManager dbManager = getParentZone().getDBManager();
		String sql = "SELECT * FROM friend INNER JOIN user ON friend.email=user.email WHERE friend.friend_email=\"" + obj.getUtfString("email") + "\"";
		try {
			boolean bExist = false;
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			for(int i = 0; i < res.size(); i ++) {
				ISFSObject newObj = res.getSFSObject(i);
				if(newObj.getInt("best_friend") == 1) {
					bExist = true;
					obj.putUtfString("best_friend_email", newObj.getUtfString("email"));
					obj.putUtfString("best_friend_name", newObj.getUtfString("name"));
					obj.putLong("best_friend_cash", newObj.getLong("chip"));
					break;
				}
			}
			if(!bExist) {
				obj.putUtfString("best_friend_email", "");
				obj.putUtfString("best_friend_name", "");
				obj.putLong("best_friend_cash", 0);
			}
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}
	
	public Room CreateRoom( int blindType, int seat, boolean speed, boolean isEmpty, String groupName, DynamicRoomType dynamicRoomType, String roomName)
	{
		String tableName = roomName != null ? roomName : GetNewRoomName(blindType, seat, isEmpty, groupName); 
		
		SFSZone zone = (SFSZone)getParentZone();
		
		CreateRoomSettings settings = new CreateRoomSettings();
		settings.setGame(true);
		settings.setName(tableName);
		settings.setGroupId(groupName);
		settings.setDynamic(true);
		settings.setMaxUsers(20);
		List<RoomVariable> roomVariables = new ArrayList<RoomVariable>();
		SFSRoomVariable rv = new SFSRoomVariable("table_size", seat);
		roomVariables.add(rv);
		rv = new SFSRoomVariable("blind_type", blindType);
		roomVariables.add(rv);
		rv = new SFSRoomVariable("speed", speed);
		roomVariables.add(rv);
		String tableType = dynamicRoomType.toString();
		rv = new SFSRoomVariable("dynamic_table_type", tableType);
		roomVariables.add(rv);
		rv = new SFSRoomVariable("empty", isEmpty);
		roomVariables.add(rv);		
		settings.setRoomVariables(roomVariables);
		settings.setAutoRemoveMode(SFSRoomRemoveMode.NEVER_REMOVE);
		
		RoomExtensionSettings extension = null;
		if(groupName.equals("TexasPoker"))
			extension = new RoomExtensionSettings("Pokerat", "TexasPokerExtension.RoomExtension");
		settings.setExtension(extension);
		
		try {
			return getApi().createRoom(getParentZone(), settings, null);
	} catch (SFSCreateRoomException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public String GetNewRoomName(int blind, int seat, boolean isEmpty, String groupName) {
		String baseName = groupName + "_" + blind + "_" + seat + "_";
		if(isEmpty)
			baseName = baseName + "empty_";
		String roomName = "";
		List<Room> roomList = getParentZone().getRoomList();

		int roomIndex = 0;
		while(true)
		{
			boolean existSameName = false;
			roomName = baseName + roomIndex;
			for(Room room : roomList) {
				if(room.getName().equalsIgnoreCase(roomName))
				{
					existSameName = true;
					break;
				}
			}
			if(!existSameName)
				break;
			roomIndex++;
		}
		return roomName;
	}
}
