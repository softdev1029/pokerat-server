package ZoneExtension;

import java.util.List;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class GetRoomListHandler extends BaseClientRequestHandler
{

	@Override
	public void handleClientRequest(User user, ISFSObject params)
	{
		int type = params.getInt("type");
		long blind = params.getLong("blind");

		ISFSArray res = new SFSArray();
		List<Room> roomList = getParentExtension().getParentZone().getRoomList();
		for(Room room : roomList)
		{
			if(!room.isGame() || room.getGroupId().compareTo("default") == 0)
				continue;
//			System.out.println(room.getName() + "," + room.getGroupId() + "," + room.getExtension());
			ISFSObject obj = (ISFSObject) room.getExtension().handleInternalMessage("get_room_info", null);
			if(obj.getInt("type") == type)
			{
				if(type == 0) {
					if(blind >= 10000000 && obj.getLong("blind") >= 10000000)
						res.addSFSObject(obj);
					else if(blind == obj.getLong("blind"))
						res.addSFSObject(obj);
				}
				if(type == 2 && blind == obj.getLong("min_bet"))
					res.addSFSObject(obj);
			}
		}
		ISFSObject response = new SFSObject();
		response.putSFSArray("array", res);
		send("get_room_list", response, user);
	}
}
