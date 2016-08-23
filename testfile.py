import os

SOME_DATA = [1,2,3]

def aMethod():
    aha = doSomething()

class Yada:

    def oneMethod(self, argOne, *args, kwargTwo=None, **kwargs):
        print(argOne)

aMethod()
print(SOME_DATA[0])
blah = Yada()
blah.oneMethod(4, kwargTwo='aha')
