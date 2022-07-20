from typing import *

map = {
    'direction': [
        'north',
        'south',
        'east',
        'west',
        'down',
        'up',
        'left',
        'right',
        'back',
    ],
    'verb': ['go', 'kill', 'eat', 'run', 'scream'],
    'stop': ['the', 'in', 'of', 'from', 'at', 'it', 'to'],
    'noun': ['door', 'bear', 'princess', 'cabinet', 'honey'],
}


def scan(sentence: str) -> List[tuple]:
    """return a list of tuples consist of every word in the sentence and its
    type.

    >>> print(scan("north south east"))
    [('direction', 'north'), ('direction', 'south'), ('direction', 'east')]
    """
    result = []
    for word in sentence.split():
        try:
            result.append(('number', int(word)))
        except ValueError:
            for category, item in map.items():
                if word.lower() in item:
                    found_category = category
                    break
                else:
                    found_category = 'error'
            result.append((found_category, word))
    return result
