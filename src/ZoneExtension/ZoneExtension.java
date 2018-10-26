package ZoneExtension;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.SFSExtension;

public class ZoneExtension extends SFSExtension {
	
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
		addRequestHandler("get_friend_request_list", GetFriendRequestListHandler.class);
		addRequestHandler("get_friend_search_list", GetFriendSearchListHandler.class);
		addRequestHandler("get_friend_room", GetFriendRoomHandler.class);
		addRequestHandler("invite_friend", InviteFriendHandler.class);
		addRequestHandler("friend_chat_action", FriendChatActionHandler.class);
		
		addRequestHandler("send_message", SendMessageHandler.class);
		addRequestHandler("get_new_message", GetNewMessageHandler.class);
		addRequestHandler("get_message", GetMessageHandler.class);
		addRequestHandler("read_new_message", ReadNewMessageHandler.class);
	}
	
	@Override
	public void destroy() {
		super.destroy();
	}
	
	public void AddUserInfo(ISFSObject obj)
	{
		User user = getParentZone().getUserByName(obj.getUtfString("email"));
		obj.putBool("online", user != null);
		if(user != null)
		{
			Room room = user.getLastJoinedRoom();
			obj.putUtfString("room_name", room.getGroupId());
			if(room.getGroupId() == "TexasPoker" || room.getGroupId() == "Roulette")
			{
				long balance = (long)room.getExtension().handleInternalMessage("get_user_balance", obj.getUtfString("email"));
				obj.putLong("chip", obj.getLong("chip") + balance);
			}
		}
	}
	
}
