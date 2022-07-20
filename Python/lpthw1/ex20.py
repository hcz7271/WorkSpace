from sys import argv

script, input_file = argv


def print_all(f):
    """
    docstring
    """
    print(f.read())


# 倒带
def rewind(f):
    """
    docstring
    """
    f.seek(0)  # 把指针"磁头"转到文件的第一个字节


def print_a_line(line_count, f):
    """
    docstring
    """
    print(line_count, f.readline(), end="")  # readline() 函数返回的内容中包含文件本来就有\n


current_file = open(input_file)

print("First let's print the whole file:\n")
print_all(current_file)

print("Now let's rewind, kind of like a tape.")
rewind(current_file)

print("Let's print three lines:")
current_line = 1
print_a_line(current_line, current_file)
current_line += 1
print_a_line(current_line, current_file)
current_line += 1
print_a_line(current_line, current_file)