package duck;

import behaviour.flyBehavior.FlyWithWings;
import behaviour.quackBehavior.Quack;

public class RedheadDuck extends Duck{

    public RedheadDuck() {
        flyBehavior = new FlyWithWings();
        quackBehavior = new Quack();
    }

    @Override
    public void display() {
        System.out.println("I'm a redhead duck");
    }
}
