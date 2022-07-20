package pizzaIngredient.ingredientFactory;

import pizzaIngredient.ingredients.cheese.Cheese;
import pizzaIngredient.ingredients.clam.Clams;
import pizzaIngredient.ingredients.dough.Dough;
import pizzaIngredient.ingredients.pepperoni.Pepperoni;
import pizzaIngredient.ingredients.sauce.Sauce;
import pizzaIngredient.ingredients.veggies.Veggies;

public interface PizzaIngredientFactory {

    public Dough createDough();

    public Sauce createSauce();

    public Cheese createCheese();

    public Veggies[] createVeggies();

    public Pepperoni createPepperoni();

    public Clams createClam();
}
