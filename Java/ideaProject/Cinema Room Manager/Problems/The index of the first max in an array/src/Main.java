import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final int size = sc.nextInt();
        int[] arr = new int[size];
        int maxIndex = 0;
        for (int i = 0; i < size; i++) {
            arr[i] = sc.nextInt();
            if (arr[i] > arr[maxIndex]) {
                maxIndex = i;
            }
        }
        System.out.println(maxIndex);
    }
}