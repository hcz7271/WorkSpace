import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int size = Integer.parseInt(sc.nextLine());
        String[] strArr = sc.nextLine().split(" ");
        int[] intArr = new int[size];
        int n = sc.nextInt();
        int m = sc.nextInt();

        for (int i = 0; i < size; i++) {
            intArr[i] = Integer.parseInt(strArr[i]);
        }

        boolean result = true;

        for (int i = 0; i < size - 1; i++) {
            if (intArr[i] == n && intArr[i + 1] == m ||
                    intArr[i] == m && intArr[i + 1] == n) {
                result = false;
                break;
            }
        }
        System.out.println(result);
    }
}