import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int a = input.nextInt();
        int b = input.nextInt();

        long product = 1;
        for (int i = a; i < b; i++) {
            product *= i;
        }
        System.out.println(product);
    }
}