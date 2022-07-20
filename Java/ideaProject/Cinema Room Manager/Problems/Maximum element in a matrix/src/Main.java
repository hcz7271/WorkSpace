import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();

        int[][] matrix = new int[n][m];
        int maxRow = 0;
        int maxCol = 0;

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                matrix[i][j] = sc.nextInt();
                if (matrix[i][j] > matrix[maxRow][maxCol]) {
                    maxRow = i;
                    maxCol = j;
                }
            }
        }
        System.out.println(maxRow + " " + maxCol);
    }
}