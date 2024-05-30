# public class IntegerNode {
#   public int value;
#   public IntegerNode(int value) {
#     this.value = value;
#   }
# }

class IntegerNode:
    def __init__(self, value):
        self.value = value

class PlusNode:
    def __init__(self, left, right):
        self.left = left
        self.right = right

class MultiplyNode:
    def __init__(self, left, right):
        self.left = left
        self.right = right

class MinusNode:
    def __init__(self, left, right):
        self.left = left
        self.right = right

# 5
five = IntegerNode(5)

# 2 + 3
two_plus_three = PlusNode(IntegerNode(2),
                          IntegerNode(3))

# (1 * 2) + (3 + 4)
big = PlusNode(MultiplyNode(IntegerNode(1),
                            IntegerNode(2)),
               PlusNode(IntegerNode(3),
                        IntegerNode(4)))

def evaluate(node):
    # node instanceof IntegerNode
    if isinstance(node, IntegerNode):
        return node.value
    elif isinstance(node, PlusNode):
        left_result = evaluate(node.left)
        right_result = evaluate(node.right)
        return left_result + right_result
    elif isinstance(node, MultiplyNode):
        left_result = evaluate(node.left)
        right_result = evaluate(node.right)
        return left_result * right_result
    elif isinstance(node, MinusNode):
        return evaluate(node.left) - evaluate(node.right)
    else:
        assert False
        
