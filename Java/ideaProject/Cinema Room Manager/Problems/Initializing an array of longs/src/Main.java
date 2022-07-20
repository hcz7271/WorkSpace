import java.util.Arrays;

public class Main {

    public static void main(String[] args) {

        long[] longNumbers = new long[3];
        long longNum = 100_000_000_000L;
        longNumbers[0] = longNum + 1;
        longNumbers[1] = longNum + 2;
        longNumbers[2] = longNum + 3;

        System.out.println(Arrays.toString(longNumbers));
    }
}
