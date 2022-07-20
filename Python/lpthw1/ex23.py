import sys

script, encoding, error = sys.argv


def main(language_file, encoding, errors):
    """
    docstring
    """
    line = language_file.readline()
    # main函数中的循环 到结尾readline()返回空字符串的时候停止
    if line:
        print_line(line, encoding, errors)
        return main(language_file, encoding, errors)


def print_line(line, encoding, errors):
    """
    docstring
    """
    next_lang = line.strip()
    raw_bytes = next_lang.encode(encoding, errors=errors)
    cooked_string = raw_bytes.decode(encoding, errors=errors)

    print(raw_bytes, "<===>", cooked_string)


languages = open("languages.txt", encoding="utf-8")

main(languages, encoding, error)
