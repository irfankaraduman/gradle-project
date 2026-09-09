import java.io.*;
import java.util.logging.*;

public class LocalizedCodeSample {
  public static void main(String [] args) {
    char[] buf = null;
    InputStreamReader isr = null;
    OutputStreamWriter osw = null;
    try {
      buf = new char[20];
      isr = new InputStreamReader(new FileInputStream(args[0]), "UTF-8");
      isr.read(buf, 0, 20);
      osw = new OutputStreamWriter(new FileOutputStream(args[1]));
      osw.write(buf, 0, 20);
      osw.flush();
    }
    catch (Exception e) {
      Logger.getAnonymousLogger().fine("Something's wrong!");
    }
    finally {
      try {
        if (null != isr) {
          isr.close();
        }
        if (null != osw) {
          osw.close();
        }
      }
      catch (Exception e) {
        Logger.getAnonymousLogger().fine("Something's really wrong!");
      }
    }
  }
}
