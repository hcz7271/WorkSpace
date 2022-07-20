package pizza;

import pizzaIngredient.ingredients.cheese.Cheese;
import pizzaIngredient.ingredients.clam.Clams;
import pizzaIngredient.ingredients.dough.Dough;
import pizzaIngredient.ingredients.pepperoni.Pepperoni;
import pizzaIngredient.ingredients.sauce.Sauce;
import pizzaIngredient.ingredients.veggies.Veggies;

public abstract class Pizza {

    String name;
    Dough dough;
    Sauce sauce;
    Veggies[] veggies;
    Cheese cheese;
    Pepperoni pepperoni;
    Clams clam;


    abstract void prepare();

    void bake() {
        System.out.println("Bake for 25 minutes at 350");
    }

    void cut() {
        System.out.println("Cutting the pizza into diagonal slices");
    }

    void box() {
        System.out.println("Place pizza in official PizzaStore box");
    }

    void setName(String name) {
        this.name = name;
    }

    String getName() {
        return name;
    }

    public String toString() {
        return getName();
    }
}
