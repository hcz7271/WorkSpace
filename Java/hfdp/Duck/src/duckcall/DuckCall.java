package duckcall;

import behaviour.quackBehavior.QuackBehavior;

public abstract class DuckCall {

    QuackBehavior quackBehavior;

    public DuckCall() {

    }

    public abstract void showBrand();

    public void performQuack() {
        this.quackBehavior.quack();
    }

    public void setQuackBehavior(QuackBehavior qb) {
        this.quackBehavior = qb;
    }
}
