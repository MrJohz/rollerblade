import unittest

import rollerblade.lib.ast

suite "test evaluation":
    test "evaluate constant to constant list":
        check(newConstant(4).eval() == @[4])
