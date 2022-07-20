from typing import List


class ParserError(Exception):
    pass


class Sentence(object):
    def __init__(
        self,
        subject: tuple[str, str],
        verb: tuple[str, str],
        obj: tuple[str, str],
    ):
        # remember we take ('noun','princess') tuples and convert them
        self.subject = subject[1]
        self.verb = verb[1]
        self.object = obj[1]


def peek(word_list: List[tuple[str, str]]) -> str or None:
    if word_list:
        word = word_list[0]
        return word[0]
    else:
        return None


def match(
    word_list: List[tuple[str, str]], expecting: str
) -> tuple[str, str] or None:
    if word_list:
        # match()会把wordlist的第一个单词元组给取出，如果相等则返回单词元组
        word = word_list.pop(0)
        if word[0] == expecting:
            return word
        else:
            return None
    else:
        return None


def skip(word_list: List[tuple[str, str]], word_type: str) -> None:
    while peek(word_list) == word_type:
        # 如果下一个字母元组的类型与之相等，取出单词列表
        # 如果下一个字母不等，就结束啥也不动
        match(word_list, word_type)


def parse_verb(
    word_list: List[tuple[str, str]]
) -> tuple[str, str] or Exception(str) or None:
    skip(word_list, 'stop')
    if peek(word_list) == 'verb':
        return match(word_list, 'verb')
    else:
        raise ParserError("Expected a verb next.")


def parse_object(
    word_list: List[tuple[str, str]]
) -> tuple[str, str] or Exception(str) or None:
    skip(word_list, 'stop')
    next_word = peek(word_list)
    if next_word == 'noun':
        return match(word_list, 'noun')
    elif next_word == 'direction':
        return match(word_list, 'direction')
    else:
        raise ParserError("Expected a noun or direction next.")


def parse_subject(
    word_list: List[tuple[str, str]]
) -> tuple[str, str] or Exception(str) or None:

    skip(word_list, 'stop')
    next_word = peek(word_list)
    if next_word == 'noun':
        return match(word_list, 'noun')
    elif next_word == 'verb':
        return ('noun', 'player')
    else:
        raise ParserError("Expected a verb next.")


def parse_sentence(word_list: List[tuple[str, str]]) -> object:
    """Return a Sentence object
    >>> x = parse_sentence([('verb','run'),('direction','north')])
    >>> x.subject
    'player'
    >>> x.verb
    'run'
    >>> x.object
    'north'
    """
    subj = parse_subject(word_list)
    verb = parse_verb(word_list)
    obj = parse_object(word_list)
    return Sentence(subj, verb, obj)
