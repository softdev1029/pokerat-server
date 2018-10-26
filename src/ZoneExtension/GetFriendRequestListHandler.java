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

public class GetFriendRequestListHandler extends BaseClientRequestHandler
{

	@Override
	public void handleClientRequest(User user, ISFSObject params)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "SELECT friend_request.id, friend_request.time, friend_request.status, user.email, user.name, user.chip, user.location FROM friend_request INNER JOIN user ON friend_request.email=user.email WHERE friend_request.friend_email=\"" + user.getName() + "\" ORDER BY time ASC";
		try {
			ISFSObject response = new SFSObject();
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			response.putSFSArray("array", res);
			send("get_friend_request_list", response, user);
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}
}
