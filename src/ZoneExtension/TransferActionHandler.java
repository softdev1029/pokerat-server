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

public class TransferActionHandler extends BaseClientRequestHandler 
{	
	@Override
	public void handleClientRequest(User user, ISFSObject params)
	{
		int action = params.getInt("action");
		int id = params.getInt("id");
		int status = 0;
		ISFSObject transferInfo = getTransferInfo(id, status);
		if(transferInfo != null) {
			if(action == 0) {
				updateTransferRecord(id, 1);
				int type = transferInfo.getInt("type");
				long value = transferInfo.getLong("value");
				String from_email = transferInfo.getUtfString("from_email");
				String to_email = transferInfo.getUtfString("to_email");
				
				transferGift(from_email, to_email, type, value);
				
				User user1 = getParentExtension().getParentZone().getUserByName(from_email);
				User user2 = getParentExtension().getParentZone().getUserByName(to_email);
			
				if(user1 != null)
					send("transfer_update", new SFSObject(), user1);
				if(user2 != null)
					send("transfer_update", new SFSObject(), user2);				
			}		
		}		
	}

	public ISFSObject getTransferInfo(int id, int status)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "SELECT * FROM transfer_gift WHERE id=\"" + id + "\" AND status=\"" + status + "\"";
		try {
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			return res.getSFSObject(0);
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
		return null;
	}
	
	public ISFSObject getUserInfo(String email)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "SELECT * FROM user WHERE email=\"" + email + "\"";
		try {
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			return res.getSFSObject(0);
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
		return null;
	}
	
	public void transferGift(String from_email, String to_email, int type, long value) {
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();

		ISFSObject user1 = getUserInfo(from_email);
		ISFSObject user2 = getUserInfo(to_email);
		if(type == 0) { // transfer chip
			if(user1 != null) {
				long chip = user1.getLong("chip");
				if(chip < value)
					value = chip;
				
				chip -= value;
				String sql = "UPDATE user SET chip=" + chip + " WHERE email=\"" + from_email + "\"";				
		        try {
		            dbManager.executeUpdate(sql, new Object[] {});
		        }
		        catch (SQLException e) {
		            trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		        }
			}
			
			if(user2 != null) {
				long chip = user2.getLong("chip");
				chip += value;
				
				String sql = "UPDATE user SET chip=" + chip + " WHERE email=\"" + to_email + "\"";
		        try {
		            dbManager.executeUpdate(sql, new Object[] {});
		        }
		        catch (SQLException e) {
		            trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		        }
			}
		}
	}
	
	public void updateTransferRecord(int id, int status)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "UPDATE transfer_gift SET status=" + status + " WHERE id=\"" + id + "\" AND status=0";
        try {
            dbManager.executeUpdate(sql, new Object[] {});
        }
        catch (SQLException e) {
            trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
        }
	}	
}