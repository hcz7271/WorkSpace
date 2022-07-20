# i = 0
# numbers = []

# while i < 6:
#     print(f"At the top i is {i}")
#     numbers.append(i)

#     i += 1
#     print("Numbers now: ", numbers)
#     print(f"At the bottom i is {i}")


# print("The numbers: ")

# for num in numbers:
#     print(num)

while_list = []
for_list = []


def fill_list_by_while(num, increment):
    """
    docstring
    """
    i = 0
    while i < num:
        while_list.append(i)
        i += increment
    return None


fill_list_by_while(21, 2)
for num in while_list:
    print(num)


def fill_list_by_for(num, increment):
    """
    docstring
    """
    for i in range(0, num, increment):
        for_list.append(i)
    return None


fill_list_by_for(21, 2)
for num in for_list:
    print(num)