package pizzaIngredient.ingredientFactory;

import pizzaIngredient.ingredients.cheese.Cheese;
import pizzaIngredient.ingredients.cheese.ReggianoCheese;
import pizzaIngredient.ingredients.clam.Clams;
import pizzaIngredient.ingredients.clam.FreshClams;
import pizzaIngredient.ingredients.dough.Dough;
import pizzaIngredient.ingredients.dough.ThinCrustDough;
import pizzaIngredient.ingredients.pepperoni.Pepperoni;
import pizzaIngredient.ingredients.pepperoni.SlicedPepperoni;
import pizzaIngredient.ingredients.sauce.MarinaraSauce;
import pizzaIngredient.ingredients.sauce.Sauce;
import pizzaIngredient.ingredients.veggies.*;

public class NYPizzaIngredientFactory implements PizzaIngredientFactory {

    @Override
    public Dough createDough() {
        return new ThinCrustDough();
    }

    @Override
    public Sauce createSauce() {
        return new MarinaraSauce();
    }

    @Override
    public Cheese createCheese() {
        return new ReggianoCheese();
    }

    @Override
    public Veggies[] createVeggies() {
        Veggies veggies[] = {new Garlic(), new Onion(), new Mushroom(), new RedPepper()};
        return veggies;
    }

    @Override
    public Pepperoni createPepperoni() {
        return new SlicedPepperoni();
    }

    @Override
    public Clams createClam() {
        return new FreshClams();
    }
}
