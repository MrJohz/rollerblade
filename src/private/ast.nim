type
    NodeKind* = enum
        nkConstant,
        nkRoll,
        nkCollapse,
        nkAdd,
        nkSub,
        nkMul,
        nkDiv,

    Node* = ref object
        case kind: NodeKind
            of nkConstant:
                constant: int
            of nkRoll:
                noDice, diceOrd: int
            of nkCollapse:
                collapseNode: Node
            of nkAdd, nkSub, nkMul, nkDiv:
                lhs, rhs: Node

proc `$`*(node: Node): string =
    case node.kind
        of nkConstant:
            return "Node(nkConstant, constant=" & $node.constant & ")"
        else:
            return ""

proc `==`*(lhs: Node, rhs: Node): bool =
    if rhs.kind != lhs.kind:
        return false

    case lhs.kind
        of nkConstant:
            return lhs.constant == rhs.constant
        else:
            return false

proc newConstant*(constant: int): Node =
    return Node(kind: nkConstant, constant: constant)

proc eval*(node: Node): seq[int] =
    case node.kind
        of nkConstant:
            return @[node.constant]
        else:
            return @[]

when defined(unittest):
    {.hints: off.}
    import unittest

    suite "convenience procs":
        test "equality":
            check(newConstant(42) == newConstant(42))
            check(newConstant(41) != newConstant(45))
            check(Node(kind:nkRoll, noDice: 3, diceOrd: 4) != newConstant(34))

        test "newConstant":
            check(Node(kind: nkConstant, constant: 42) == newConstant(42))
            check(Node(kind: nkConstant, constant: 41) != newConstant(45))
