import java.io.IOException;

public class Sample {

    static class User{
        String role;
        String password;

        User(String role, String pass) {
            this.role = role;
            password = pass;
        }

        String getRole() {
            return this.role;
        }
        String changeUserPassword(String newPass) {
            this.password = newPass;
            return password;
        }
    }

    public static void main(String[] args) throws IOException {

        User root = new User("privilege", setUserPassword("root"));

        System.out.println(setUserPassword("Administrator"));
        System.out.println(setUserPassword("root"));
        System.out.println(setUserPassword("Regular_user"));
        setUserPassword("regular");
        setUserPassword(null);

        if (root.getRole().equals("privilege")) {
            root.changeUserPassword("hashPass");
        }

        System.out.println(root.password);
    }

    /**
     * https://openjdk.org/jeps/406
     * JEP 406: Pattern Matching for switch (Preview)
     * Pattern matching and null.
     */
    static String setUserPassword(String user) {
        String password = "changeMe";

        switch (user) {
            case null -> System.err.println("User can't be null");
            case "Administrator", "root" -> {
                return "Privilege password " + password;
            }
            case "Regular_user" -> {
                return "Password for regular user " + password;
            }
            default -> System.err.println("Unknown user");
        }
        return password;
    }
}