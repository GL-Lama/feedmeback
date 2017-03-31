package utils;

public class console  {

    public static void log(String... params) {
       for (int i = 0; i < params.length; i ++) {
            System.out.print(params[i]);
            System.out.print(" ");
        }
        System.out.println("");
    }

    public static void log(Integer... params) {
       for (int i = 0; i < params.length; i ++) {
            System.out.print(params[i]);
            System.out.print(" ");
        }
        System.out.println("");
    }
}