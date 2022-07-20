import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String str = input.nextLine();
        int startIndex = input.nextInt();
        int endIndex = input.nextInt();
        String output = str.substring(startIndex, endIndex + 1);
        System.out.println(output);
    }
}