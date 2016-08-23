import os

def aMethod():
    aha = doSomething()

class Yada:

    def oneMethod(self, argOne, *args, kwargTwo=None, **kwargs):
        print(argOne)

aMethod()

blah = Yada()
blah.oneMethod(4, kwargTwo='aha')
