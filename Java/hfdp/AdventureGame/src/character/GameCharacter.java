package character;

import weaponBehavior.WeaponBehavior;

public abstract class GameCharacter {

    WeaponBehavior weaponBehavior;

    public GameCharacter() {

    }

    public void fight() {
        weaponBehavior.useWeapon();
    }

    public void setWeapon(WeaponBehavior w) {
        this.weaponBehavior = w;
    }
}
