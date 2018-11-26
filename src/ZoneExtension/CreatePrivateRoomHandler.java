package ZoneExtension;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.SFSRoom;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.entities.variables.RoomVariable;
import com.smartfoxserver.v2.entities.variables.SFSRoomVariable;
import com.smartfoxserver.v2.entities.variables.SFSUserVariable;
import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
import com.smartfoxserver.v2.exceptions.SFSTooManyRoomsException;
import com.smartfoxserver.v2.exceptions.SFSVariableException;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;
import com.smartfoxserver.v2.api.CreateRoomSettings;
import com.smartfoxserver.v2.api.CreateRoomSettings.RoomExtensionSettings;
import com.smartfoxserver.v2.api.SFSApi;

public class CreatePrivateRoomHandler extends BaseClientRequestHandler
{
	@Override
	public void handleClientRequest(User user, ISFSObject params)
	{
 		String tableName = params.getUtfString("table_name");
		int blind = params.getInt("blind");
		int type = params.getInt("type");
		int seat = params.getInt("size");
		boolean speed = params.getBool("speed");
		
		CreateRoomSettings settings = new CreateRoomSettings();
		settings.setGame(true);
		settings.setName(tableName);
		settings.setGroupId("TexasPoker");
		settings.setDynamic(true);
		settings.setMaxUsers(20);
		List<RoomVariable> roomVariables = new ArrayList<RoomVariable>();
		SFSRoomVariable rv = new SFSRoomVariable("table_size", seat);
		roomVariables.add(rv);
		rv = new SFSRoomVariable("blind_type", blind);
		roomVariables.add(rv);
		rv = new SFSRoomVariable("speed", speed);
		roomVariables.add(rv);
		rv = new SFSRoomVariable("is_private_table", true);
		roomVariables.add(rv);
		rv = new SFSRoomVariable("empty", true);
		roomVariables.add(rv);		
		settings.setRoomVariables(roomVariables);
		
		RoomExtensionSettings extension = new RoomExtensionSettings("Pokerat", "TexasPokerExtension.RoomExtension");
		settings.setExtension(extension);
		
		ISFSObject response = new SFSObject();
		try {
			Room room = getApi().createRoom(((ZoneExtension)getParentExtension()).getParentZone(), settings, null);

			response.putBool("success", true);
			response.putUtfString("table_name", tableName);
			response.putInt("size", seat);
			send("create_private_table", response, user);
			
		} catch (SFSCreateRoomException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.putBool("success", false);
			send("create_private_table", response, user);
		}
		 

		
	}
}

