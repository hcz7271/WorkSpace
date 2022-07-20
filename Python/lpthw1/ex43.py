from sys import exit
from random import randint
from textwrap import dedent


class Scene(object):
    """A base class represents all the scenes in this game

    Args:
        object (Object): inheritaged from the build-in class Object
    """
    def enter(self) -> None:
        print("This scene is not yet configured.")
        print("Subclass it and implement enter()")
        exit(1)


class Death(Scene):  # 死亡场景
    """A scene when the player is died.

    Args:
        Scene (object): Death is-a Scene
    """

    # 嘲讽的语句
    quips = [
        "You died. You kinda suck at this.",
        "Your mom would be proud...if she were smarter.",
        "Such a luser.",
        "I have a small puppy that's better at this.",
        "You're worse than your Dad's jokes.",
    ]

    def enter(self) -> None:
        print(Death.quips[randint(0, len(self.quips) - 1)])
        exit(1)


class CentralCorridor(Scene):  # 中央走廊场景
    """ A main scene that game starts here.

    Args:
        Scene (object): CentralCorridor is-a Scene
    """
    def enter(self) -> str:
        """[summary]

        Returns:
            str: a string represents the next_scene after taking an action
        """
        print(  # dedent???
            dedent("""
            The Gothons of Planet Percal #25 have invaded your ship and
            destroyed your entire crew. You are the last surviving
            member and your last mission is to get the neutron destruct
            bomb from the Weapons Armory, put it in the bridge, and
            blow the ship up after getting into an escape pod.

            You're running down the central corridor to the Weapons
            Armory when a Gothon jumps out, red scaly skin, dark grimy
            teeth, and evil clown costume flowing around his hate
            filled body. He's blocking the door to the Armory and
            about to pull a weapon to blast you.
            """))

        action = input("> ")

        # 采取不同的行动 会导致进入不同的场景
        if action == "shoot!":
            print(
                dedent("""
                Quick on the draw you yank out your blaster and fire
                it at the Gothon. His clown costume is flowing and
                moving around his body, which throws off your aim.
                Your laser hits his costume but misses him entirely.
                This completely ruins his brand new costume his mother
                bought him, which makes him fly into an insane rage
                and blast you repeatedly in the face until you are
                dead. Then he eats you.
                """))
            return 'death'

        elif action == "dodge!":
            print(
                dedent("""
                Like a world class boxer you dodge, weave, slip and
                slide right as the Gothon's blaster cranks a laser
                past your head. In the middle of your artful dodge
                your foot slips and you bang your head on the metal
                wall and pass out. You wake up shortly after only to
                die as the Gothon stomps on your head and eats you.
                """))
            return 'death'

        elif action == "tell a joke":
            print(
                dedent("""
                Lucky for you they made you learn Gothon insults in
                the academy. You tell the one Gothon joke you know:
                lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr,
                fur fvgf nebhaq gur ubhfr. The Gothon stops, tries
                not to laugh, then busts out laughing and can't move.
                While he's laughing you run up and shoot him square in
                the head putting him down, then jump through the
                Weapon Armory door.
                """))
            return 'laser_weapon_armory'

        else:
            print("DOES NOT COMPUTE!")
            return 'central_corridor'


class LaserWeaponArmory(Scene):  # 激光武器库场景
    """ A scene of a laser weapon armory that the player in here is
    about to escape.

    Args:
        Scene (object): LaserWeaponArmory is-a Scene
    """
    def enter(self) -> str:
        """[summary]

        Returns:
            str: returns a string represents the next_scene whether the
            player guessed it right or not
        """
        print(
            dedent("""
            You do a dive roll into the Weapon Armory, crouch and scan
            the room for more Gothons that might be hiding. It's dead
            quiet, too quiet. You stand up and run to the far side of
            the room and find the neutron bomb in its container.
            There's a keypad lock on the box and you need the code to
            get the bomb out. If you get the code wrong 10 times then
            the lock closes forever and you can't get the bomb. The
            code is 3 digits.
            """))

        code = f"{randint(1,9)}{randint(1,9)}{randint(1,9)}"
        print(code)
        guess = input("[keypad]> ")
        guesses = 0

        # 当猜测不对且猜测的次数小于10的时候
        while guess != code and guesses < 9:
            print("BZZZZEDDD!")
            guesses += 1
            guess = input("[keypad]> ")

        if guess == code:  # 猜对了
            print(
                dedent("""
                The container clicks open and the seal breaks, letting
                gas out. You grab the neutron bomb and run as fast as
                you can to the bridge where you must place it in the
                right spot.
                """))
            return 'the_bridge'
        else:  # 次数超过10次了
            print(
                dedent("""
                The lock buzzes one last time and then you hear a
                sickening melting sound as the mechanism is fused
                together. You decide to sit there, and finally the
                Gothons blow up the ship from their ship and you die.
                """))
            return 'death'


class TheBridge(Scene):  # 主控舱场景
    def enter(self) -> str:
        print(
            dedent("""
            You burst onto the Bridge with the neutron destruct bomb
            under your arm and surprise 5 Gothons who are trying to
            take control of the ship. Each of them has an even uglier
            clown costume than the last. They haven't pulled their
            weapons out yet, as they see the active bomb under your
            arm and don't want to set it off.
            """))

        action = input("> ")

        if action == "throw the bomb":
            print(
                dedent("""
                In a panic you throw the bomb at the group of Gothons
                and make a leap for the door. Right as you drop it a
                Gothon shoots you right in the back killing you. As
                you die you see another Gothon frantically try to
                disarm the bomb. You die knowing they will probably
                blow up when it goes off.
                """))
            return 'death'

        elif action == "slowly place the bomb":
            print(
                dedent("""
                You point your blaster at the bomb under your arm and
                the Gothons put their hands up and start to sweet.
                You inch backward to the door, open it, and then
                carefully place the bomb on the floor, pointing your
                blaster at it. You then jump back through the door,
                punch the close button and blast the lock so the
                Gothons can't get out. Now that the bomb is placed
                you run to the escape pod to get off this tin can.
                """))
            return 'escape_pod'
        else:
            print("DOES NOT COMPUTE!")
            return "the_bridge"


class EscapePod(Scene):  # 逃生舱场景
    def enter(self) -> str:
        print(
            dedent("""
            You rush through the ship desperately trying to make it to
            the escape pod before the whole ship explodes. It seems
            like hardly any Gothons are on the ship, so your run is
            clear of interference. You get to the chamber with the
            escape pods, and now need to pick one to take. Some of
            them could be damaged but you don't have time to look.
            There's 5 pods, which one do you take?
            """))

        good_pod = randint(1, 5)
        print(good_pod)
        guess = input("[pod #]> ")

        if int(guess) != good_pod:
            print(
                dedent(f"""
                You jump into pod {guess} and hit the eject button.
                The pod escapes out into the void of space, then
                implodes as the hull ruptures, crushing your body
                into jam jelly.
                """))
            return 'death'
        else:
            print(
                dedent(f"""
                You jump into pod {guess} and hit the eject button.
                The pod easily slides out into space heading to
                the planet below. As it flies to the planet, you look
                back and see your ship implode then explode like a
                bright star, taking out the Gothon ship at the same
                time. You won!
                """))
            return 'finished'


class Finished(Scene):
    def enter(self) -> str:
        print("You won! Good job.")
        return 'finished'


class Map(object):

    # 一个字典 key是代表所有场景的string
    # value 是场景对应的实例化对象
    scenes = {
        'central_corridor': CentralCorridor(),
        'laser_weapon_armory': LaserWeaponArmory(),
        'the_bridge': TheBridge(),
        'escape_pod': EscapePod(),
        'death': Death(),
        'finished': Finished(),
    }

    # Map 这个对象存储着一个string
    def __init__(self, start_scene: str):
        self.start_scene = start_scene

    # 返回一个 装着代表下个场景的字符串的 Map对象
    def next_scene(self, scene_name: str) -> object:
        val = Map.scenes.get(scene_name)
        return val

    # 调用 下个场景函数 参数为Map对象自带的代表开始场景的字符串
    # 返回一个 Map对象
    def opening_scene(self) -> object:
        return self.next_scene(self.start_scene)


class Engine(object):  # 游戏的引擎
    """A base class represents the game start engine

    Args:
        object (Object): inheritaged from the build-in class Object
    """

    # Engine对象储存着 一个代表着开始场景字符串的Map对象 ''
    def __init__(self, scene_map: object):
        self.scene_map = scene_map

    def play(self) -> None:
        """[summary]
        """
        # current_scene 储存着 一个代表现在场景的Map对象
        current_scene = self.scene_map.opening_scene()
        # 最后场景 储存一个Map对象装着结束场景的字符串'finished'
        last_scene = self.scene_map.next_scene('finished')

        print("^循环前^ current_scene=", current_scene, "last_scene=", last_scene)

        while current_scene != last_scene:
            print("^while开始^ current_scene=", current_scene)

            # 返回下个场景的字符串
            next_scene_name = current_scene.enter()

            current_scene = self.scene_map.next_scene(next_scene_name)
            print("^while结束^ current_scene=", current_scene,
                  "next_scene_name=", next_scene_name, "last_scene=",
                  last_scene)

        # be sure to print out the last scene
        print("^循环后^ current_scene=", current_scene, "last_scene=", last_scene)
        current_scene.enter()


a_map = Map('central_corridor')
a_game = Engine(a_map)
a_game.play()