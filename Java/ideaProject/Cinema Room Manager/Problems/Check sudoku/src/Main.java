import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        final int n = sc.nextInt();
        final int size = n * n;

        int[][] sudoku = new int[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                sudoku[i][j] = sc.nextInt();
            }
        }

        int[][] columnMatrix = new int[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                columnMatrix[i][j] = sudoku[j][i];
            }
        }

        int[][] blockMatrix = new int[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                int row = i / n * n + j / n;
                int col = i % n * n + j % n;
                blockMatrix[row][col] = sudoku[i][j];
            }
        }

        boolean result = checkMatrix(sudoku) && checkMatrix(columnMatrix) && checkMatrix(blockMatrix);
        System.out.println(result ? "YES" : "NO");
    }

    public static boolean checkMatrix(int[][] matrix) {
        int n = matrix.length;
        int[] nums = new int[n];

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                // check whether the element is out of bound
                if (matrix[i][j] > 0 && matrix[i][j] <= n) {
                    nums[matrix[i][j] - 1]++;
                } else {
                    return false;
                }
            }
            // check each row in matrix does not contain duplicate element
            for (int k = 0; k < n; k++) {
                if (nums[k] != i + 1) {
                    return false;
                }
            }
        }
        return true;
    }
}