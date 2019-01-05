package ZoneExtension;

import java.util.List;

import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.extensions.BaseServerEventHandler;
import com.smartfoxserver.v2.extensions.ExtensionLogLevel;

public class ServerReadyHandler extends BaseServerEventHandler
{
	@Override
	public void handleServerEvent(ISFSEvent event) throws SFSException {
		ZoneExtension gameExt = (ZoneExtension) getParentExtension();
		// gameExt.CreateTexasDefaultRooms();
		List<Room> roomList = gameExt.getParentZone().getRoomList();
		trace(ExtensionLogLevel.WARN, "roomList count =  " + roomList.size());

	}
}

