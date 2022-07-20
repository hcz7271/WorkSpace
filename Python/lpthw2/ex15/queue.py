class Queue:
    class _Node:
        __slots__ = "_value", "_next"

        def __init__(self, value, next):
            self._value = value
            self._next = next

        def __repr__(self):
            nval = self._next and self._next._value or None
            return f"[{self._value}:{repr(nval)}]"

    def __init__(self):
        self._begin = None
        self._end = None
        self._size = 0

    def is_empty(self):
        return self._size == 0

    def enqueue(self, obj):
        newNode = self._Node(obj, None)
        if self.is_empty():
            self._begin = newNode
        else:
            self._end._next = newNode
        self._end = newNode
        self._size += 1

    def dequeue(self):
        if self.is_empty():
            result = None
        else:
            result = self._begin._value
            self._begin = self._begin._next
            self._size -= 1
            if self.is_empty():  # 如果只有一个节点
                self._end = None
        return result

    def first(self):
        if self.is_empty():
            result = None
        else:
            result = self._begin._value
        return result

    def count(self):
        return self._size

    def drop(self):
        if self.is_empty() != True:
            curr = self._begin
            if curr == self._end:
                self._begin = None
                self._end = None
            else:
                while curr._next != self._end:
                    curr = curr._next
                curr._next = None
                self._end = curr
            self._size -= 1

