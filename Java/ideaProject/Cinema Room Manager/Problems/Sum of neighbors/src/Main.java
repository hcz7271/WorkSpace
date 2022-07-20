import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String input = sc.nextLine();
        String matrixString = "";
        int row = 0;
        int col = input.split(" ").length;

        while (!"end".equals(input)) {
            matrixString += input.trim() + ",";
            row++;
            input = sc.nextLine();
        }

        int[][] matrix = new int[row][col];
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < col; j++) {
                matrix[i][j] = Integer.parseInt(matrixString.split(",")[i].split(" ")[j]);
            }
        }

        int[][] output = new int[row][col];
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                int left = matrix[i][(j + col - 1) % col];
                int right = matrix[i][(j + col + 1) % col];
                int up = matrix[(i + row - 1) % row][j];
                int down = matrix[(i + row + 1) % row][j];

                output[i][j] = left + right + up + down;
                System.out.print(output[i][j] + " ");
            }
            System.out.println();
        }
        sc.close();
    }
}