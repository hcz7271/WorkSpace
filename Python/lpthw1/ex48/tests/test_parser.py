import nose2
from ex48 import lexicon, parser


# 实例化一个名为s的Sentence对象


def test_subject():
    s = parser.Sentence(
        ('noun', 'cheese'), ('verb', 'eats'), ('noun', 'pigeon')
    )
    assert s.verb == 'eats'
    assert s.subject == 'cheese'
    assert s.object == 'pigeon'


def test_peek():
    word_list1 = []
    assert None == parser.peek(word_list1)

    word_list2 = lexicon.scan("princess killed bear")
    assert "noun" == parser.peek(word_list2)


def test_match():
    word_list = []
    assert None == parser.match(word_list, 'noun')

    word_list = lexicon.scan("bear eat princess")
    assert ('noun', 'bear') == parser.match(word_list, 'noun')

    word_list = lexicon.scan("bear eat princess")


def test_skip():
    wl1 = lexicon.scan("at the bear")
    parser.skip(wl1, 'stop')
    print(wl1)
    assert [('noun', "bear")] == wl1

    wl2 = lexicon.scan("scream at the bear")
    parser.skip(wl2, 'stop')
    print(wl2)
    # assert [('verb', "scream"), ('noun', "bear")] == word_list


def test_parse_verb():
    word_list = lexicon.scan("scream at the bear")
    assert ('verb', "scream") == parser.parse_verb(word_list)

    word_list = lexicon.scan("at the bear")


def test_parse_object():
    word_list = lexicon.scan("at the bear")
    assert ('noun', "bear") == parser.parse_object(word_list)

    word_list = lexicon.scan("at the north")
    assert ('direction', "north") == parser.parse_object(word_list)

    word_list = lexicon.scan("at the eat")


def test_parse_subject():
    word_list = lexicon.scan("kill the bear")
    assert ('noun', "player") == parser.parse_subject(word_list)

    word_list = lexicon.scan("at the bear")
    assert ('noun', "bear") == parser.parse_subject(word_list)

    word_list = lexicon.scan("at the at")


def test_parse_sentence():
    word_list = lexicon.scan("scream at the bear")
    sen = parser.parse_sentence(word_list)
    assert "player" == sen.subject
    assert "scream" == sen.verb
    assert "bear" == sen.object

    word_list = lexicon.scan("princess kill the bear")
    sen = parser.parse_sentence(word_list)
    assert "princess" == sen.subject
    assert "kill" == sen.verb
    assert "bear" == sen.object

    word_list = lexicon.scan("the bear run south")
    sen = parser.parse_sentence(word_list)
    assert "bear", sen.subject
    assert "run", sen.verb
    assert "south", sen.object
