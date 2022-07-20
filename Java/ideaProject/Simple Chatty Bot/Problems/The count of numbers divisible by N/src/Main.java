import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        // put your code here
        Scanner sc = new Scanner(System.in);
        String[] strings = sc.nextLine().split(" ");
        int a = Integer.parseInt(strings[0]);
        int b = Integer.parseInt(strings[1]);
        int n = Integer.parseInt(strings[2]);

        int count = 0;
        for (int i = a; i <= b; i++) {
            if (i % n == 0) count++;
        }
        System.out.println(count);
    }
}