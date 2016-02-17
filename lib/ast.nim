type
    NodeKind = enum
        nkConstant,
        nkRoll,
        nkCollapse,
        nkAdd,
        nkSub,
        nkMul,
        nkDiv,

    Node = ref object
        case kind: NodeKind
            of nkConstant:
                constant: int
            of nkRoll:
                noDice, diceOrd: int
            of nkCollapse:
                collapseNode: Node
            of nkAdd, nkSub, nkMul, nkDiv:
                lhs, rhs: Node

proc eval(node: Node): seq[int] =
    case node.kind
        of nkConstant:
            return @[node.constant]
        else:
            return @[]
