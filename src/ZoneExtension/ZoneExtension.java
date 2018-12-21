package ZoneExtension;

import java.sql.SQLException;

import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;
import com.smartfoxserver.v2.extensions.SFSExtension;

public class ZoneExtension extends SFSExtension {

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
	}

	@Override
	public void destroy() {
		super.destroy();
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

}
