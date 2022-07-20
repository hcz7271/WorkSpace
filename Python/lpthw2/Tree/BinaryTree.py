import Tree


class BinaryTree(Tree):
    """二叉树的抽象基类 Abstract base class representing a binary tree structure."""

    # -------- additional abstract methods --------
    def left(self, p):
        """Return a Position representing p's left child.

        Return None if p does not have a left child.
        """
        raise NotImplementedError("must be implemented by subclass")

    def right(self, p):
        """Return a Position representing p's right child.

        Return None if p does not have a right child.
        """
        raise NotImplementedError("must be implemented by subclass")

    # -------- concrete methods implemented in this class --------
    def sibling(self, p):
        """Return a Position representing p's sibling (or None if no sibling)."""
        parent = self.parent(p)
        if parent is None:  # root p has no sibling
            return None
        else:
            if p == self.left(parent):
                return self.right(parent)  # possibly None
            else:
                return self.left(parent)  # possibly None

    def children(self, p):
        """Generate an iteration of Positions representing p's children."""
        if self.left(p) is not None:
            yield self.left(p)  # 迭代生成器
        if self.right(p) is not None:
            yield self.right(p)