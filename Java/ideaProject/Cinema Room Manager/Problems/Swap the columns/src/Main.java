import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();
        int[][] inputMatrix = new int[n][m];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                inputMatrix[i][j] = sc.nextInt();
            }
        }
        int swapCol1 = sc.nextInt();
        int swapCol2 = sc.nextInt();
        sc.close();

        int[][] outputMatrix = new int[n][m];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (j == swapCol1) {
                    outputMatrix[i][j] = inputMatrix[i][swapCol2];
                } else if (j == swapCol2) {
                    outputMatrix[i][j] = inputMatrix[i][swapCol1];
                } else {
                    outputMatrix[i][j] = inputMatrix[i][j];
                }
                System.out.print(outputMatrix[i][j] + " ");
            }
            System.out.println();
        }
    }
}