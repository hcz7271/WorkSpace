package LinkedList.src.DLL;

public class DoublyLinkedList<Anytype> implements Iterable<Anytype> {

    private static class Node<Anytype> {
        public Node(Anytype d, Node<Anytype> p, Node<Anytype> n) {
            data = d;
            prev = p;
            next = n;
        }

        public Anytype data;
        public Node<Anytype> prev;
        public Node<Anytype> next;

        /**
         * return a string represents the information of the node, just like __repr__ in
         * python.
         * 
         * @return String
         */
        @Override
        public String toString() {

            return super.toString();
        }
    }

    public DoublyLinkedList() {
        doClear();
    }

    public void clear() {
        doClear();
    }

    private void doClear() {

    }

    public int count() {
        return theSize;
    }

    /**
     * 
     * @param data
     */
    public void push(Anytype data) {
        Node<Anytype> newNode = new Node<Anytype>(data, end, null);
        newNode.prev.next = newNode;
        end = newNode;
        theSize++;
    }

    /**
     * 
     * @return
     */
    public Node<Anytype> pop() {
        return null;
    }

    /**
     * 
     * @param data
     */
    public void shift(Anytype data) {
        Node<Anytype> newNode = new Node<Anytype>(data, begin.prev, begin);
        begin.prev = newNode;
        begin = newNode;
        theSize++;
    }

    /**
     * 
     * @return
     */
    public Node<Anytype> unshift() {
        return null;
    }

    /**
     * Get the value at index.
     * 
     * @param index index to search at
     * @return internal node corresponding to index
     * @throws IndexOutOfBoundsException if index is not between 0 and count() - 1,
     *                                   inclusive.
     */
    private Node<Anytype> get(int index) {
        Node<Anytype> curr;
        if (index < 0 || index >= count() - 1)
            throw new IndexOutOfBoundsException();

        // 二分法 如果index在左边 从起点开始遍历 如果在右边则从终点开始遍历
        if (index < count() / 2) {
            curr = begin.next;
            for (int i = 0; i < index; i++) {
                curr = curr.next;
            }
        } else {
            curr = end;
            for (int i = count(); i > index; i--) {
                curr = curr.prev;
            }
        }

        return curr;
    }

    /**
     * @return Iterator<Anytype>
     * 
     */
    public java.util.Iterator<Anytype> iterator() {
        return new LinkedListIterator();
    }

    private class LinkedListIterator implements java.util.Iterator<Anytype> {
        private Node<Anytype> current = begin.next;
        private int expectedModCount = modCount;
        private boolean okToRemove = false;

        public boolean hasNext() {
            return current != end;
        }

        public Anytype next() {
            if (modCount != expectedModCount)
                throw new java.util.ConcurrentModificationException();
            if (!hasNext())
                throw new java.util.NoSuchElementException();

            Anytype nextItem = current.data;
            current = current.next;
            okToRemove = true;
            return nextItem;
        }

        public void remove() {
            if (modCount != expectedModCount)
                throw new java.util.ConcurrentModificationException();
            if (!hasNext())
                throw new java.util.NoSuchElementException();

            DoublyLinkedList.false.remove(current.prev);
            expectedModCount++;
            okToRemove=false;
        }
    }

    private int theSize;
    private int modCount = 0;
    private Node<Anytype> begin = null;
    private Node<Anytype> end = null;
}