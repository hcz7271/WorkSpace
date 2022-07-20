import random
from urllib.request import urlopen
import sys

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

PHRASES = {  # dict key是专有词汇的代码片段(snippet) value是对应的措辞(phrase)
    # 1
    "class %%%(%%%):": "Make a class named %%% that is-a %%%.",
    # 2
    "class %%%(object):\n\tdef __init__(self, ***)": "class %%% has-a __init__ that takes self and *** params.",
    # 3
    "class %%%(object):\n\tdef ***(self, @@@)": "class %%% has-a function *** that takes self and @@@ params.",
    # 4
    "*** = %%%()": "Set *** to an instance of class %%%.",
    # 5
    "***.***(@@@)": "From *** get the *** function, call it with params self, @@@.",
    # 6
    "***.*** = '***'": "From *** get the *** attribute and set it to '***'.",
}

# do they want to drill phrases first
if len(sys.argv) == 2 and sys.argv[1] == 'english':
    PHRASE_FIRST = True
else:
    PHRASE_FIRST = False

# readlines()返回储存每行的列表
for word in urlopen(WORD_URL).readlines():
    WORDS.append(str(word.strip(), encoding="utf-8"))


# 片段(snippet)是一个编程用语, 指的是源代码, 机器代码, 文本中可重复使用的小区块
def convert(snippet: str, phrase: str) -> list:
    # 类名%%% 随机出和snippet中%%%同等数量的首字母大写单词类名
    class_names = [
        w.capitalize() for w in random.sample(WORDS, snippet.count("%%%"))
    ]
    print(f"Is there any class names '%%%'? {class_names}")

    # 其他名包括函数名和变量名*** 随机出和snippet中***同等数量的函数名或变量名的单词
    other_names = random.sample(WORDS, snippet.count("***"))
    print(f"Is there any func or var names '***'? {other_names}")

    # 参数名@@@ 随机参数的数量1~3
    param_names = []
    for i in range(0, snippet.count("@@@")):
        param_count = random.randint(1, 3)
        param_names.append(', '.join(random.sample(WORDS, param_count)))
    print(f"Is there any param_names '@@@' {param_names}")

    results = []

    # 依次替换snippet中的tag和phrase中的tag
    for sentence in snippet, phrase:
        result = sentence[:]  # 字符串复制
        print(f"\nreplace:\n\t{result}")

        # fake class names
        for word in class_names:
            result = result.replace("%%%", word, 1)
        # fake other names
        for word in other_names:
            result = result.replace("***", word, 1)
        # fake parameter lists
        for word in param_names:
            result = result.replace("@@@", word, 1)
        print(f"\t{result}\n")
        results.append(result)

    return results


# keep going until they hit CTRL-D
# snippets一个储存6个随即顺序snippet的list
snippets = list(PHRASES.keys())
random.shuffle(snippets)  # 打乱列表的排序

try:
    while True:
        for snippet in snippets:
            phrase = PHRASES[snippet]
            print(f"snippet:{snippet}\nphrase:{phrase}\n")

            # 替换掉snippet和phrase中的'@@@%%%***'
            question, answer = convert(snippet, phrase)
            if PHRASE_FIRST:
                question, answer = answer, question

            print(f"\n{question}\n")

            input("> type 'Enter' to see the solution")
            print(f"ANSWER: {answer}\n\n")
            input("> next question")

except EOFError:
    print("\nBye")