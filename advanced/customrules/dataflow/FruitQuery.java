import com.fruit.*;  

public class FruitQuery {
  public static void getCommandLine (String orange, int value) throws Exception {
    Apple red = (Apple)Apple.getWebInput("red");
    Apple green = (Apple)Apple.getWebInput("green");
    Orange o = new Orange(orange);

    FruitDatabase.executeQuery(red, 0);

    Basket redAppleBasket = new Basket();
    Basket greenAppleBasket = new Basket();
    Basket orangeBasket = new Basket();

    red = (Apple)Apple.washFruit(red);

    redAppleBasket.putInBasket(red);
    greenAppleBasket.putInBasket(green);
    orangeBasket.putInBasket(o); 

    FruitDatabase.executeQuery((Apple)redAppleBasket.getFirstFruit(), 10);
    FruitDatabase.executeQuery((Orange)orangeBasket.getFirstFruit(), value);
    FruitDatabase.executeQuery((Apple)greenAppleBasket.getFirstFruit(), 5);
  }
}
