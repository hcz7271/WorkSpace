package cinema;

import java.util.Scanner;

public class Cinema {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of rows:");
        int numRows = sc.nextInt();
        System.out.println("Enter the number of seats in each row:");
        int numSeats = sc.nextInt();
        int totalSeats = numRows * numSeats;

        String[][] seats = new String[numRows + 1][numSeats + 1];
        for (int i = 0; i < numRows + 1; i++) {
            for (int j = 0; j < numSeats + 1; j++) {
                if (i == 0) {
                    if (j == 0) {
                        seats[i][j] = " ";
                    } else {
                        seats[i][j] = String.valueOf(j);
                    }
                } else if (j == 0) {
                    seats[i][j] = String.valueOf(i);
                } else {
                    seats[i][j] = "S";
                }
            }
        }

        outer:
        while (true) {
            System.out.println("\n1. Show the seats\n2. Buy a ticket\n3. Statistics\n0. Exit");
            int userChoice = sc.nextInt();

            switch (userChoice) {
                case 1: // Show the seats
                    System.out.println("\nCinema:");
                    for (int i = 0; i < numRows + 1; i++) {
                        for (int j = 0; j < numSeats + 1; j++) {
                            System.out.print(seats[i][j] + " ");
                        }
                        System.out.println();
                    }
                    break;

                case 2: // Buy a ticket
                    while (true) {
                        System.out.println("\nEnter a row number:");
                        int rowNum = sc.nextInt();
                        System.out.println("Enter a seat number in that row:");
                        int seatNum = sc.nextInt();

                        int ticketPrice;
                        if (totalSeats <= 60) {
                            ticketPrice = 10;
                        } else {
                            int midRow = (numRows / 2);
                            ticketPrice = rowNum <= midRow ? 10 : 8;
                        }

                        if (rowNum > numRows || seatNum > numSeats) {
                            System.out.println("Wrong input!");
                        } else if (seats[rowNum][seatNum].equals("B")) {
                            System.out.println("That ticket has already been purchased!");
                        } else {
                            seats[rowNum][seatNum] = "B";
                            System.out.println("Ticket price: $" + ticketPrice);
                            break;
                        }
                    }
                    break;

                case 3: // Statistics
                    int currentFirstHalf = 0;
                    int currentBackHalf = 0;
                    int currentIncome;
                    int totalIncome;

                    for (int i = 1; i < numRows + 1; i++) {
                        for (int j = 1; j < numSeats + 1; j++) {
                            if (seats[i][j].equals("B")) {
                                if (i <= numRows / 2) {
                                    currentFirstHalf++;
                                } else {
                                    currentBackHalf++;
                                }
                            }
                        }
                    }

                    int purchasedTicket = currentFirstHalf + currentBackHalf;
                    float percent = (float) purchasedTicket / totalSeats * 100;

                    if (totalSeats <= 60) {
                        totalIncome = 10 * totalSeats;
                        currentIncome = 10 * purchasedTicket;
                    } else {
                        int midRow = (numRows / 2);
                        currentIncome = 10 * currentFirstHalf + 8 * currentBackHalf;
                        totalIncome = (midRow * 10 + (numRows - midRow) * 8) * numSeats;
                    }

                    System.out.printf("\nNumber of purchased tickets: %d", purchasedTicket);
                    System.out.printf("\nPercentage: %.2f%%", percent);
                    System.out.printf("\nCurrent income: $%d", currentIncome);
                    System.out.printf("\nTotal income: $%d\n", totalIncome);
                    break;

                case 0: // Exit
                    break outer;

                default:
                    break;
            }
        }
        sc.close();
    }
}