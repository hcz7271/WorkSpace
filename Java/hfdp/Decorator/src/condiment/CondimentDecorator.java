package condiment;

import beverage.Beverage;

public abstract class CondimentDecorator extends Beverage {

    public abstract String getDescription();

    public abstract int getSize();

    public abstract double cost();
}
