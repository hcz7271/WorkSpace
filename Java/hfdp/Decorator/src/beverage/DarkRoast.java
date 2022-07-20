package beverage;

public class DarkRoast extends Beverage {

    public DarkRoast() {
        description = "Espresso";
    }

    @Override
    public double cost() {
        return .99;
    }

}
