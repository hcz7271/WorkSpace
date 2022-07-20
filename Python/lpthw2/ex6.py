from pathlib import Path
import sys
import argparse


def name_find(start, args):
    # rglob()相当于glob()以及递归遍历所有的子目录
    for f in start.rglob(args.name):
        print(f)


def type_find(start, args):
    if args.type not in ["d", "f"]:
        print(f"Unknown type: {args.type}")
        sys.exit(1)

    for f in start.rglob(args.name or "*"):
        # "d" 代表文件夹
        if args.type == "d" and f.is_dir():
            print(f)
        # "f" 代表文件
        elif args.type == "f" and f.is_file():
            print(f)


def find_files(args):
    # 只能输入一个目录 start[0] 代表起始目录
    start_path = Path(args.start[0])

    if args.name and not args.type:
        name_find(start_path, args)
    elif args.type:
        type_find(start_path, args)
    else:
        print("You need either --name or --type")
        sys.exit(1)


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument("start", type=str, nargs=1)
    parser.add_argument("--name", metavar="keyword", type=str, help="find file")
    parser.add_argument(
        "--type", metavar="f<files> or d<dirs>", type=str, help="find type"
    )

    return parser.parse_args()


find_files(parse_args())