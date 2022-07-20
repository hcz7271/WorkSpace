class Stack:
    class _StackNode:
        __slots__ = "_value", "_next"

        def __init__(self, value, next):
            self._value = value
            self._next = next

        def __repr__(self):
            nval = self._next and self._next._value or None
            return f"[{self._value}:{repr(nval)}]"

    def __init__(self):
        self._top = None
        self._size = 0

    def __len__(self):
        return self._size

    def is_empty(self):
        return self._size == 0

    def push(self, obj):
        self._top = self._StackNode(obj, self._top)
        self._size += 1

    def pop(self):
        if self._size == 0:
            result = None
        else:
            result = self._top._value
            self._top = self._top._next
            self._size -= 1
        return result

    def top(self):
        if self._size == 0:
            result = None
        else:
            result = self._top._value
        return result

    def count(self):
        return self._size

    def dump(self, mark="----"):
        print(">>>>> ", end="")
        node = self._top
        while node:
            print(node)
        print()
