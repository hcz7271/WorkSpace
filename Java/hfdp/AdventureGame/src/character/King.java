package character;

import weaponBehavior.AxeBehavior;

public class King extends GameCharacter{

    public King(){
        weaponBehavior = new AxeBehavior();
    }
}
