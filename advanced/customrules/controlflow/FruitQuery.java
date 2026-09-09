import com.fruit.*;  

public class FruitQuery {
  public static void getCommandLine (String orange, int value) throws Exception {
    Apple a = Apple.getWebInput("a");
    Orange o = Orange.getWebInput("o");

    if (a == null) {
      return;
    }

    Basket appleBasket = new Basket();
    Basket orangeBasket = new Basket();

    a.washFruit();

    appleBasket.putInBasket(a);
    orangeBasket.putInBasket(o); 

    FruitDatabase.executeQuery((Apple)appleBasket.getFirstFruit(), 10);
    FruitDatabase.executeQuery((Orange)orangeBasket.getFirstFruit(), 5);
    FruitDatabase.executeQuery((Apple)appleBasket.getFirstFruit(), value);

    orangeBasket.emptyBasket();
  }
}
