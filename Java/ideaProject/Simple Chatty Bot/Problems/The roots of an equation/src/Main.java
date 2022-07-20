import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        // put your code here
        Scanner sc = new Scanner(System.in);
        int a = sc.nextInt();
        int b = sc.nextInt();
        int c = sc.nextInt();
        int d = sc.nextInt();

        for (int i = 0; i <= 1000; i++) {
            if (a * Math.pow(i, 3) + b * Math.pow(i, 2) + c * i + d == 0) {
                System.out.println(i);
            }
        }
    }
}
