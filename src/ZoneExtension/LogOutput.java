
////////////////////////// 	class for debug		///////////// 

package ZoneExtension;

import com.smartfoxserver.v2.extensions.ExtensionLogLevel;
import com.smartfoxserver.v2.extensions.SFSExtension;

public class LogOutput extends  SFSExtension{
	
	private static LogOutput inst = null;
	public LogOutput() {
		// TODO Auto-generated method stub
		inst = this;
	}
	
	public static LogOutput instance()
	{
		if(inst == null)
			inst = new LogOutput();
		return inst;
	}
	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}
}
