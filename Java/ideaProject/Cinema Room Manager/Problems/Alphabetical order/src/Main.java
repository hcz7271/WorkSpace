import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String[] arr = sc.nextLine().split(" ");
        boolean isAlphaOrder = true;

        for (int i = 1; i < arr.length; i++) {
            int compare = arr[i - 1].compareTo(arr[i]);

            if (compare > 0) {
                isAlphaOrder = false;
                break;
            }
        }
        System.out.println(isAlphaOrder);
    }
}