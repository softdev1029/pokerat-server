package ZoneExtension;

import java.util.List;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class GetFriendRoomHandler extends BaseClientRequestHandler
{

	@Override
	public void handleClientRequest(User user, ISFSObject params)
	{
		ISFSObject response = new SFSObject();
		List<Room> roomList = getParentExtension().getParentZone().getRoomList();
		for(Room room : roomList)
		{
			if(!room.isGame() || room.getGroupId().compareTo("default") == 0)
				continue;
			ISFSObject obj = (ISFSObject) room.getExtension().handleInternalMessage("get_room_info", null);
			if(obj == null)
				continue;			
			ISFSArray array = obj.getSFSArray("player_list");
			for(int i = 0; i < array.size(); i ++) {
				ISFSObject obj1 = array.getSFSObject(i);
				if(obj1.getUtfString("email").compareTo(params.getUtfString("email")) == 0)
				{
					response.putSFSObject("room_info", obj);
					send("get_friend_room", response, user);
					return;
				}
			}
		}
	}
}
