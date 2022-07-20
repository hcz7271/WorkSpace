import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final int size = sc.nextInt();
        int[] arr = new int[size];
        int max = 0; //variable to store the max count
        int longest = 1; //the longest consecutive increasing subsequence

        for (int i = 0; i < size; i++) {
            arr[i] = sc.nextInt();

            if ((i > 0) && (arr[i] > arr[i - 1])) {
                longest = Math.max((i + 1) - max, longest);
            } else {
                max = i;
            }
            System.out.println(max + " " + longest);
        }
        System.out.println(longest);
    }
}