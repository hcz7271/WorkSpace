import re
import sys
import argparse
from pathlib import Path


def parse_args():
    parser = argparse.ArgumentParser()

    # 第一个必要参数 要搜索的内容
    parser.add_argument("pattern", type=str, nargs=1)
    # 第二个必要参数 要搜索的路径
    parser.add_argument("start", type=str, nargs=1)
    # 第三个开关参数 选择递归遍历路径子目录
    parser.add_argument("-r", action="store_true")

    return parser.parse_args()


# args.pattern
# args.start
# args.recursive 存储着一个boolean


def find_in_file(file_name, pattern):
    # 尝试打开文件 如果是二进制编码文件则引起异常
    try:
        lines = open(file_name).readlines()
    except UnicodeDecodeError:
        print(f"Binary file {file_name} matches.")
        return

    # 创建为一个正则表达式对象 expr
    expr = re.compile(pattern)

    # 遍历文件的每一行 如果expr存在则返回一个匹配对象
    for line in lines:
        if expr.search(line):
            print(line, end="")


args = parse_args()
print(f"args.pattern = {args.pattern}")
print(f"args.start = {args.start}")
print(args.r)

# 如果需要遍历子目录
if args.r:
    start_path = Path(args.start[0])
    for f in start_path.rglob("*"):
        if f.is_file():
            find_in_file(f, args.pattern[0])
else:
    find_in_file(args.start[0], args.pattern[0])
