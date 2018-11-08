package ZoneExtension;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import com.smartfoxserver.v2.db.IDBManager;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;

public class LoginHandler extends BaseClientRequestHandler
{
	private static int USER_START_ID = 1203948735;
	@Override
	public void handleClientRequest(User user, ISFSObject params)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "SELECT * FROM user WHERE email=\"" + params.getUtfString("email") + "\"";
		try {
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			ISFSObject response = new SFSObject();            
			if(res.size() == 0) {
				if(params.getBool("facebook"))
				{
					ISFSObject obj = registerFacebookUser(params);
					response.putBool("daily_bonus", setDailyBonus(user, obj));
					sendNotificationToFriends(params.getUtfString("email"), obj.getUtfString("name"));
					response.putBool("success", true);
					response.putSFSObject("info", getUserInfo(params.getUtfString("email")));
				}
				else if(params.getBool("guest"))
				{
					ISFSObject obj = registerGuest(params);
					response.putBool("daily_bonus", setDailyBonus(user, obj));
					sendNotificationToFriends(params.getUtfString("email"), obj.getUtfString("name"));
					response.putBool("success", true);
					response.putSFSObject("info", getUserInfo(params.getUtfString("email")));
				}
				else
				{
					response.putBool("success", false);
					response.putUtfString("reason", "email");
				}
			}
			else {
				ISFSObject obj = (ISFSObject)(res.getElementAt(0));
				String pwd = obj.getUtfString("password");
				if(params.getBool("facebook"))
				{
					ISFSObject obj1 = updateFacebookUser(params);
					response.putBool("daily_bonus", setDailyBonus(user, obj1));
					sendNotificationToFriends(params.getUtfString("email"), obj1.getUtfString("name"));
					response.putBool("success", true);
					response.putSFSObject("info", getUserInfo(params.getUtfString("email")));
				}
				else if(pwd.compareTo(params.getUtfString("password")) == 0) {
					User oldUser = getParentExtension().getParentZone().getUserByName(params.getUtfString("email"));
					if (oldUser != null) {
						response.putBool("success", false);
						response.putUtfString("reason", "relogin");
					} else {
						response.putBool("daily_bonus", setDailyBonus(user, obj));
						sendNotificationToFriends(params.getUtfString("email"), res.getSFSObject(0).getUtfString("name"));
						response.putBool("success", true);
						response.putSFSObject("info", getUserInfo(params.getUtfString("email")));
					}
				}
				else {
					response.putBool("success", false);
					response.putUtfString("reason", "password");
				}
			}
			send("login", response, user);
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}
	
	public boolean setDailyBonus(User user, ISFSObject dataObject)
	{
		long curTime = System.currentTimeMillis();
		Date date1 = new Date(curTime);
		Date date2 = new Date(dataObject.getLong("last_login"));

		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "UPDATE user SET last_login=" + curTime + " WHERE email=\"" + dataObject.getUtfString("email") + "\"";
		
		SimpleDateFormat dateFormatGmt = new SimpleDateFormat("yyyy-MM-dd");
		dateFormatGmt.setTimeZone(TimeZone.getTimeZone("GMT"));

		System.out.println(dateFormatGmt.format(date1));
		System.out.println(dateFormatGmt.format(date2));

		if(dateFormatGmt.format(date1).compareTo(dateFormatGmt.format(date2)) != 0)
			sql = "UPDATE user SET last_login=" + curTime + ", chip=" + (dataObject.getLong("chip") + 100000) + " WHERE email=\"" + dataObject.getUtfString("email") + "\"";
		
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
		
		return (dateFormatGmt.format(date1).compareTo(dateFormatGmt.format(date2)) != 0);
	}

	public void sendNotificationToFriends(String email, String name)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "SELECT friend.email FROM friend INNER JOIN user ON friend.email=user.email WHERE friend.friend_email=\"" + email + "\"";
		try {
			ISFSObject response = new SFSObject();
			response.putUtfString("email", email);
			response.putUtfString("name", name);
			ISFSArray res = dbManager.executeQuery(sql, new Object[] {});
			for(int i = 0; i < res.size(); i ++) {
				User user = getParentExtension().getParentZone().getUserByName(res.getSFSObject(i).getUtfString("email"));
				if(user != null)
					send("friend_login", response, user);
			}
		} catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
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
	
	public ISFSObject registerGuest(ISFSObject params)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "INSERT INTO user(email, password, name, chip, coin, user_id, started_playing, description, location)"
				+ " VALUES (\""
				+ params.getUtfString("email") + "\",\""
				+ params.getUtfString("password") + "\",\""
				+ params.getUtfString("name") + "\","
				+ 10000 + ","
				+ 10 + ",\""
				+ "\","
				+ System.currentTimeMillis() + ",\""
				+ "\",\""
				+ "UNKNOWN" + "\")";
		try {
			Long rowId = (Long)dbManager.executeInsert(sql, new Object[] {});
			setUserId(rowId.intValue());
		}
		catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}

		return getUserInfo(params.getUtfString("email"));
	}

	public void setUserId(int rowId)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String idStr = String.format("%02d-%04d-%04d", ((USER_START_ID + rowId) / 10000) / 10000, ((USER_START_ID + rowId) / 10000) % 10000, (USER_START_ID + rowId) % 10000);
		String sql = "UPDATE user SET user_id=\"" + idStr + "\" WHERE id=" + rowId;
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		}
		catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}
	}
	
	public ISFSObject registerFacebookUser(ISFSObject params)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "INSERT INTO user(email, password, name, photo, chip, coin, user_id, started_playing, description, location)"
				+ " VALUES (\""
				+ params.getUtfString("email") + "\",\""
				+ "" + "\",\""
				+ params.getUtfString("name") + "\","
				+ params.getInt("photo") + ","
				+ 10000 + ","
				+ 10 + ",\""
				+ "\","
				+ System.currentTimeMillis() + ",\""
				+ "\",\""
				+ "UNKNOWN" + "\")";
		try {
			Long rowId = (Long)dbManager.executeInsert(sql, new Object[] {});
			setUserId(rowId.intValue());
		}
		catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}

		return getUserInfo(params.getUtfString("email"));
	}
	
	public ISFSObject updateFacebookUser(ISFSObject params)
	{
		IDBManager dbManager = getParentExtension().getParentZone().getDBManager();
		String sql = "UPDATE user"
				+ " SET name=\"" + params.getUtfString("name") + "\""
				+ " AND photo=" + params.getInt("photo")
				+ " AND chip=" + 10000
				+ " AND coin=" + 10
				+ " AND user_id=\"" + "" + "\""
				+ " AND started_playing=" + System.currentTimeMillis()
				+ " AND description=\"" + "" + "\""
				+ " AND location=\"" + "UNKNOWN" + "\""
				+ " WHERE email=\"" + params.getUtfString("email") + "\"";
		try {
			dbManager.executeUpdate(sql, new Object[] {});
		}
		catch (SQLException e) {
			trace(ExtensionLogLevel.WARN, "SQL Failed: " + e.toString());
		}

		return getUserInfo(params.getUtfString("email"));
	}

}
