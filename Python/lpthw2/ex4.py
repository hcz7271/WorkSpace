import argparse

parser = argparse.ArgumentParser(description="description: parse arguments")

# metavar
parser.add_argument(
    "integers", metavar="N", type=int, nargs="+", help="an integer for the accumulator"
)


parser.add_argument("-f", "--foo", help="foo help")
parser.add_argument("-b", "--bar", help="bar help")
parser.add_argument("-z", "--baz", help="baz help")
parser.add_argument("-t", "--turn-on", action="store_true")
parser.add_argument("-x", "--exclude", action="store_false")
# parser.add_argument('-s', '--start', action='store_true')
args = parser.parse_args()

print(args)


# ArgumentParser.add_argument(name or flags...[, action][, nargs][, const][, default][, type][, choices][, required][, help][, metavar][, dest])
# name or flags - 一个命名或者一个选项字符串的列表，例如 foo 或 -f, --foo。
# action - 当参数在命令行中出现时使用的动作基本类型。
# nargs - 命令行参数应当消耗的数目 可以接受几个参数
# metavar - 在使用方法消息中使用的参数值示例
