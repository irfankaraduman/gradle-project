import java.io.*;

public class RaceCondition {
  private static final String directory = "delete/this/directory";
  private static boolean toDelete = false;

  public void deleteDirectory() throws IOException {
    if (toDelete) {
      File dir = new File(directory);
      dir.delete();
    }
  }

  public void setToDelete(boolean toDel) {
    toDelete = toDel;
  }
}
