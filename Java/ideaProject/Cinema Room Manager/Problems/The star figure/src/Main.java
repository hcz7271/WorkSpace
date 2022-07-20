import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int size = sc.nextInt();
        int mid = size / 2;

        String[][] output = new String[size][size];

        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (j == i || j == Math.abs(i + 1 - size) || j == mid || i == mid) {
                    output[i][j] = "*";
                } else {
                    output[i][j] = ".";
                }
                System.out.print(output[i][j] + " ");
            }
            System.out.println();
        }
    }
}