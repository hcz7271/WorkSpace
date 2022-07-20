package pizzaIngredient.ingredientFactory;

import pizzaIngredient.ingredients.cheese.Cheese;
import pizzaIngredient.ingredients.cheese.Mozzarella;
import pizzaIngredient.ingredients.clam.Clams;
import pizzaIngredient.ingredients.clam.FrozenClams;
import pizzaIngredient.ingredients.dough.Dough;
import pizzaIngredient.ingredients.dough.ThinCrustDough;
import pizzaIngredient.ingredients.pepperoni.Pepperoni;
import pizzaIngredient.ingredients.pepperoni.SlicedPepperoni;
import pizzaIngredient.ingredients.sauce.PlumTomatoSauce;
import pizzaIngredient.ingredients.sauce.Sauce;
import pizzaIngredient.ingredients.veggies.Eggplant;
import pizzaIngredient.ingredients.veggies.Mushroom;
import pizzaIngredient.ingredients.veggies.Spinach;
import pizzaIngredient.ingredients.veggies.Veggies;

public class CaliforniaPizzaIngredientFactory implements PizzaIngredientFactory {
    @Override
    public Dough createDough() {
        return new ThinCrustDough();
    }

    @Override
    public Sauce createSauce() {
        return new PlumTomatoSauce();
    }

    @Override
    public Cheese createCheese() {
        return new Mozzarella();
    }

    @Override
    public Veggies[] createVeggies() {
        Veggies[] veggies = {new Eggplant(), new Spinach(), new Mushroom()};
        return veggies;
    }

    @Override
    public Pepperoni createPepperoni() {
        return new SlicedPepperoni();
    }

    @Override
    public Clams createClam() {
        return new FrozenClams();
    }
}
