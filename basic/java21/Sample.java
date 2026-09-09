public class Sample {
    /**
     * https://openjdk.org/jeps/440
     * JEP 440: Record Patterns
     * 
     * https://openjdk.org/jeps/441
     * JEP 441: Pattern Matching for switch
     */

    static String taint = System.getenv("USERNAME");
    static String password = "PASSWORD";
        
    record Pattern(int x, int y, String z) {}

    public static void main(String[] args) {
        Pattern p = new Pattern(-2,-3, "USERNAME");
        String value = switch (p) {
            case Pattern(var x, var y, var z) when x == 1  -> password;
            case Pattern(var x, var y, var z) when z.equals("USERNAME") -> taint;
            default -> "other";
        };

        System.out.println("Switch expression with Record pattern: "+value);
    }
}