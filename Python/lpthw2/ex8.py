import sys

_, delim, fields = sys.argv

# 显示切割后的第几个字段
split_at = [int(x) for x in fields.split(",")]
print(f"split_at: {split_at}")

while True:
    try:
        line = input()
        cuts = line.split(delim)
        print(f"cuts: {cuts}")

        for i in split_at:
            print(f"{cuts[i]} ", end="")
        print()
    except EOFError:
        sys.exit(0)
    except IndexError:
        pass
# import sys

# _, delim, fields = sys.argv
# split_at = [int(x) for x in fields.split(",")]


# def lines_of_input():
#     try:
#         while True:
#             yield input()
#     except EOFError:
#         raise StopIteration


# split_lines = (line.split(delim) for line in lines_of_input())

# cuts = (line[split_at[0]] for line in split_lines)

# print("\n".join(cut for cut in cuts))