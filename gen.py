def example():
    print("first")
    yield "foo"
    print("second")
    yield "bar"
    print("third")
    yield "baz"
    print("fourth")


def myNumber():
    yield 0
    yield 1
    yield 2
        
def myNumberPlusFive():
    for y in myNumber():
        yield y + 5

def makePair():
    for a in myNumber():
        for b in myNumber():
            yield (a, b)

# variable(x)
# Variable("x")
#
# variable(y)
# Variable("y")
#
# call(variable(x), variable(y))
# Call(Variable("x"), Variable("y"))

class Variable:
    def __init__(self, name):
        self.name = name

    def __str__(self):
        return "Variable({})".format(self.name)
    
class Call:
    def __init__(self, e1, e2):
        self.e1 = e1
        self.e2 = e2

    def __str__(self):
        return "Call({}, {})".format(str(self.e1),
                                     str(self.e2))
    
def gen(depth):
    yield Variable("x")
    yield Variable("y")

    if depth > 0:
        for e1 in gen(depth - 1):
            for e2 in gen(depth - 1):
                yield Call(e1, e2)

# for e in gen(2):
#     print(str(e))
    
