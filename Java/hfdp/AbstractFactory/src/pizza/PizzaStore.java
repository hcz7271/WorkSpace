package pizza;

public abstract class PizzaStore {


    final public Pizza orderPizza(String type) {
        Pizza pizza;
        pizza = createPizza(type);

        pizza.prepare();
        pizza.bake();
        pizza.cut();
        pizza.box();

        return pizza;
    }

    // factory method: abstract Product factoryMethod(String type)
    abstract Pizza createPizza(String type);
}
