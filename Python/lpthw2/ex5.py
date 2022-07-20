import argparse

parser = argparse.ArgumentParser()

parser.add_argument("files", metavar="Files", type=str, nargs="+")
parser.add_argument("-n", "--numbers", action="store_true", help="Print line numbers")

args = parser.parse_args()

print(">>> parsed args: ", args, args.numbers)

for in_file_name in args.files:
    line_number = 1
    in_file = open(in_file_name)

    # store_true 用户有输入numbers
    if args.numbers:
        for line in in_file.readlines():
            print(f"\t{line_number}\t{line}", end="")
            line_number += 1
        print("\n", end="")
    else:
        print(in_file.read())
    in_file.close()
