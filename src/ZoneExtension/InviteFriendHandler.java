package ZoneExtension;

import java.sql.SQLException;
import java.util.List;

import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;

public class InviteFriendHandler extends BaseClientRequestHandler
{

	@Override
	public void handleClientRequest(User user, ISFSObject params)
	{
		String friend_email = params.getUtfString("friend_email");

		User friend = getParentExtension().getParentZone().getUserByName(friend_email);
		if(friend != null)
			send("invite_friend", params, friend);
	}
}
