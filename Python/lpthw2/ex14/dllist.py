class _DoubleLinkedListBase:
    """A base class providing a doubly linked list representation."""

    class _Node:
        __slots__ = "_value", "_prev", "_next"

        def __init__(self, _value, _prev, _next):
            self._value = _value
            self._prev = _prev
            self._next = _next

        def __repr__(self):
            pval = self._prev and self._prev._value or None
            nval = self._next and self._next._value or None
            return f"[{repr(pval)}|{self._value}|{repr(nval)}]"

    def __init__(self):
        """Sentinel. Create an empty list."""
        self._header = self._Node(None, None, None)
        self._trailer = self._Node(None, None, None)
        self._header._next = self._trailer  # trailer is after header
        self._trailer._prev = self._header  # header is before trailer
        self._size = 0  # number of elements

    def __len__(self):
        """Return the number of elements in the list."""
        return self._size

    def is_empty(self):
        """Return True if list is empty."""
        return self._size == 0

    def _insert_between(self, obj, predecessor, successor):
        """Add value obj between two existing nodes."""
        newNode = self._Node(obj, predecessor, successor)  # linked to neighbors
        predecessor._next = newNode
        successor._prev = newNode
        self._size += 1

    def _delete_node(self, node):
        """Delete nonsentinel node from the lis and return its value."""
        predecessor = node._prev
        successor = node._next
        predecessor._next = successor
        successor._prev = predecessor
        self._size -= 1
        value = node._value  # record deleted element
        node._prev = node._next = node._value = None  # deprecate node
        return value  # return deleted element


class DoubleLinkedDeque(_DoubleLinkedListBase):  # note the use of interitance
    """Double-ended queue implementation based on a doubly linked list."""

    def _invariant(self):
        # the value of header sentinel and trailer sentinel must be None here
        # prev of header sentinel and next of trailer sentinel must also be None here
        assert (self._header._prev == None) and (self._header._value == None)
        assert (self._trailer._next == None) and (self._trailer._value == None)
        if self.is_empty():
            assert (self._header._next == self._trailer) and (
                self._trailer._prev == self._header
            )
        else:
            if self.__len__() == 1:
                assert self._header._next == self._trailer._prev

    def push(self, obj):
        """Insert_last. Add an element to the back of the deque."""
        self._insert_between(obj, self._trailer._prev, self._trailer)  # before trailer

    def pop(self):
        """Delete last. Remove and return the element from the back of the deque."""
        if self.is_empty():
            result = None
        else:
            result = self._delete_node(self._trailer._prev)
        return result

    def shift(self, obj):
        """Insert first. Add an element to the front of the deque."""
        self._insert_between(obj, self._header, self._header._next)

    def unshift(self):
        """Delete first. Remove and return the element from the front of the deque."""
        if self.is_empty():
            result = None
        else:
            result = self._delete_node(self._header._next)
        return result

    def detach_node(self, node):
        self._delete_node(node)
        return None

    def remove(self, obj):
        if self.is_empty():
            return -1
        else:
            node = self._header._next
            count = 0

            while node != self._trailer:
                if node._value == obj:
                    self._delete_node(node)
                    return count
                else:
                    count += 1
                    node = node._next

    def first(self):
        """Return (but do not remove) the element at the front of the deque."""
        if self.is_empty():
            result = None
        else:
            result = self._header._next._value
        return result

    def last(self):
        """Return (but do not remove) the element at the back of the deque."""
        if self.is_empty():
            result = None
        else:
            result = self._trailer._prev._value
        return result

    def get(self, index):
        """Get the value at index."""
        node = self._header._next
        i = 0
        while node:
            if i == index:
                return node._value
            else:
                i += 1
                node = node._next

        return None

    def dump(self, mark="----"):
        """Debugging function that dumps the contents of the list."""
        node = self._header._next
        print(mark)
        while node != self._trailer:
            print(node, " ", end="")
            node = node._next
        print()

    def show_in_list(self):
        ls = []
        node = self._header._next
        while node != self._trailer:
            ls.append(node._value)
            node = node._next
        print(ls)
