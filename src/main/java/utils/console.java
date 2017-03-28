package utils;

public class console  {

    public static void log(String message) {
        System.out.print(message);
        System.out.println();
    }

    public static void log(String m1, String m2) {
        System.out.print(m1);
        System.out.print(" ");
        console.log(m2);
    }

    public static void log(String m1, String m2, String m3) {
        System.out.print(m1);
        System.out.print(" ");
        System.out.print(m2);
        System.out.print(" ");
        console.log(m3);
    }

    public static void log(String m1, String m2, String m3, String m4) {
        System.out.print(m1);
        System.out.print(" ");
        System.out.print(m2);
        System.out.print(" ");
        System.out.print(m3);
        System.out.print(" ");
        console.log(m4);
    }

    public static void log(String[] arr) {
        for (int i = 0; i < arr.length; i ++) {
            System.out.print(arr[i]);
            System.out.print(" ");
        }
        console.log("");
    }
}