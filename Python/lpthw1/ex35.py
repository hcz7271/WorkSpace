from sys import exit


def gold_room():
    """
    docstring
    """
    print("This room is full of gold. How much do you take?")

    choice = int(input("> "))
    if (choice == 0) or (choice == 1):
        how_much = choice
    else:
        dead("Man, learn to type a number.")

    if how_much < 50:
        print("Nice, you're not greddy, you win!")
        exit(0)
    else:
        dead("You greddy bastard!")


def bear_room():
    """
    docstring
    """
    print("There is a bear here.")
    print("The bear has a bunch of honey.")
    print("The fat bear is in front of another door.")
    print(
        "How are you going to move the bear?('take honey' or 'taunt bear' or 'escape')"
    )
    bear_moved = False

    while True:
        choice = input("> ")

        if choice == "take honey":  # 直接抢蜂蜜 死
            dead("The bear looks at you then slaps your face off.")
        elif choice == "escape":
            start_again()
        elif (choice == "taunt bear") and (not bear_moved):  # 第一次嘲讽的时候 熊走了
            print("The bear has moved from the door.")
            print("You can go thru it now.('taunt bear' again or 'open door')")
            bear_moved = True
        elif (choice == "taunt bear") and (bear_moved):  # 第二次再嘲讽 熊生气了 死
            dead("The bear gets pissed off and chews your leg off.")
        elif (choice == "open door") and (bear_moved):  # 第一次嘲讽完 熊离开后 打开了金库的门
            gold_room()
        else:
            print("I got no idea what that means.")  # 重新进入无限循环


def cthulhu_room():
    """
    docstring
    """
    print("Here you see the great evil Cthulhu.")
    print("He, it, w/e stares at you and you go insane.")
    print("Do you flee for your life or eat your head?")

    choice = input("> ")

    if ("flee" in choice) and ("head" not in choice):  # 跪下的话 就可以有重新选择的机会
        start_again()
    elif ("head" in choice) and ("flee" not in choice):
        dead("Well that was tasty!")
    else:
        cthulhu_room()


def dead(why):
    """
    docstring
    """
    print(why, "Good job!")
    exit(0)


def start():
    """
    docstring
    """
    print("You are in a dark room.")
    print("There is a door to your right and left.")
    print("Which one do you take?")

    choice = input("> ")

    if choice == "left":
        bear_room()
    elif choice == "right":
        cthulhu_room()
    else:
        dead("You stumble around the room until you starve.")


def start_again():
    """
    docstring
    """
    print("You're such a coward!")
    print("However, god gives you a second chance.")
    start()


start()