import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        String str = input.nextLine();
        String output = str.replace('a', 'b');
        System.out.println(output);
    }
}