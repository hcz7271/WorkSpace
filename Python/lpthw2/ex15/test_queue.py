from queue import *


def test_enqueue():
    colors = Queue()
    colors.enqueue("Pthalo Blue")
    assert colors.count() == 1
    colors.enqueue("Ultramarine Blue")
    assert colors.count() == 2


def test_unshift():
    colors = Queue()
    colors.enqueue("Magenta")
    colors.enqueue("Alizarin")
    assert colors.dequeue() == "Magenta"
    assert colors.dequeue() == "Alizarin"
    assert colors.dequeue() == None


def test_first():
    colors = Queue()
    colors.enqueue("Cadmium Red Light")
    assert colors.first() == "Cadmium Red Light"
    colors.enqueue("Hansa Yellow")
    assert colors.first() == "Cadmium Red Light"
    colors.enqueue("Pthalo Green")
    assert colors.first() == "Cadmium Red Light"


def test_drop():
    colors = Queue()
    colors.enqueue("Cad Red")
    colors.enqueue("Hansa Yellow")
    assert colors.count() == 2
    colors.drop()
    assert colors.count() == 1
    assert colors.first() == "Cad Red"
    colors.drop()
    assert colors.first() == None
