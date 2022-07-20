import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String[] arr = sc.nextLine().split(" ");
        int rotate = sc.nextInt();
        String[] arrOut = new String[arr.length];

        for (int i = 0; i < arr.length; i++) {
            arrOut[(i + rotate) % arr.length] = arr[i];
        }
        System.out.println(String.join(" ", arrOut));
    }
}