import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[][] spiralMatrix = new int[n][n];
        int val = 1;
        int depth = (int) Math.ceil(n / 2.0);
        for (int d = 0; d < depth; d++) {
            for (int j = d; j <= (n - d - 1); j++) { // Move right
                spiralMatrix[d][j] = val++;
            }
            for (int i = d + 1; i <= (n - d - 1); i++) { // Move down
                spiralMatrix[i][n - d - 1] = val++;
            }
            for (int j = n - d - 2; j >= d; j--) { // Move left
                spiralMatrix[n - d - 1][j] = val++;
            }
            for (int i = n - d - 2; i >= d + 1; i--) { // Move up
                spiralMatrix[i][d] = val++;
            }
        }
        for (int i = 0; i < n; i++) { // print the spiral matrix
            for (int j = 0; j < n; j++) {
                System.out.print(spiralMatrix[i][j] + " ");
            }
            System.out.println();
        }
    }
}