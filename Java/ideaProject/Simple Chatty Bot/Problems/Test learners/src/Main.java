import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int val = sc.nextInt();
        String result;

        switch (val) {
            case 1:
                result = "Yes!";
                break;
            case 2:
            case 3:
            case 4:
                result = "No!";
                break;
            default:
                result = "Unknown number";
        }
        System.out.println(result);
    }
}