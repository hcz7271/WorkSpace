import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        // put your code here
        Scanner sc = new Scanner(System.in);
        String str1 = sc.nextLine().replace(" ", "");
        String str2 = sc.nextLine().replace(" ", "");
        boolean result = str1.equals(str2);
        System.out.println(result);
    }
}