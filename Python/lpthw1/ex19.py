def cheeses_and_crackers(cheese_count, boxes_of_crackers):
    """
    docstring
    """
    print("You have " + str(cheese_count) + " cheeses!")
    print(f"You have {boxes_of_crackers} boxes of crackers!")
    print("Man that's enough for a party")
    print("Get a blanket.\n")


# user_input
def cheeses_and_crackers_input(cheese_count, boxes_of_crackers):
    cheese_count = int(input("How many cheese do you have? "))
    boxes_of_crackers = int(input("How many boxes of Crackers do you have? "))
    print("You have " + str(cheese_count) + " cheeses!")
    print(f"You have {boxes_of_crackers} boxes of crackers!")
    print("Man that's enough for a party")
    print("Get a blanket.\n")


print("We can just give the function numbers directly:")
cheeses_and_crackers(20, 30)


print("OR, we can use variables from our script:")
amount_of_cheese = 10
amout_of_crackers = 50

cheeses_and_crackers(amount_of_cheese, amout_of_crackers)


print("We can even do math inside too:")
cheeses_and_crackers(10 + 20, 5 + 6)


print("And we can combine the two, variables and math:")
cheeses_and_crackers(amount_of_cheese + 100, amout_of_crackers + 1000)
