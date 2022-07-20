import pizza.ChicagoPizzaStore;
import pizza.NYPizzaStore;

public class PizzaTestDrive {

    public static void main(String[] args) {
        NYPizzaStore nyPizzaStore = new NYPizzaStore();
        nyPizzaStore.orderPizza("cheese");
        nyPizzaStore.orderPizza("pepperoni");

        ChicagoPizzaStore chicagoPizzaStore = new ChicagoPizzaStore();
        chicagoPizzaStore.orderPizza("veggie");
    }
}
