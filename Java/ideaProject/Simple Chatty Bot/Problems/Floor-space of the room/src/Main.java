import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String shape = sc.nextLine();
        double area = 0;
        double a;
        double b;
        double c;
        double r;

        switch (shape) {
            case "triangle":
                a = sc.nextDouble();
                b = sc.nextDouble();
                c = sc.nextDouble();
                double p = (a + b + c) / 2;
                area = Math.sqrt(p * (p - a) * (p - b) * (p - c));
                break;
            case "rectangle":
                a = sc.nextDouble();
                b = sc.nextDouble();
                area = a * b;
                break;
            case "circle":
                r = sc.nextDouble();
                area = 3.14 * Math.pow(r, 2);
                break;
            default:
                break;
        }
        System.out.println(area);
    }
}