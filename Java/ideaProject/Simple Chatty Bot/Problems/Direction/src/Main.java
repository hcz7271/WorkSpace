import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int val = sc.nextInt();
        String result = null;

        switch (val) {
            case 0:
                result = "do not move";
                break;
            case 1:
                result = "move up";
                break;
            case 2:
                result = "move down";
                break;
            case 3:
                result = "move left";
                break;
            case 4:
                result = "move right";
                break;
            default:
                result = "error!";
                break;
        }
        System.out.println(result);
    }
}