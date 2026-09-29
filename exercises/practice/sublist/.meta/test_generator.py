from lib import assert_eq, d_inline_array

# The element type used to instantiate the template in each test case.
TYPES = {
    "empty lists": "float",
    "empty list within non empty list": "double",
    "non empty list contains empty list": "uint",
    "list equals itself": "ushort",
    "different lists": "long",
    "false start": "int",
    "consecutive": "double",
    "sublist at start": "double",
    "sublist in middle": "ulong",
    "sublist at end": "int",
    "at start of superlist": "long",
    "in middle of superlist": "float",
    "at end of superlist": "ushort",
    "first list missing element from second list": "short",
    "second list missing element from first list": "ulong",
    "first list missing additional digits from second list": "long",
    "order matters to a list": "short",
    "same digits but different numbers": "uint",
}


def gen_case(case):
    kind = TYPES.get(case["description"], "int")
    list_one = d_inline_array(case["input"]["listOne"])
    list_two = d_inline_array(case["input"]["listTwo"])
    return [
        f"immutable {kind}[] listOne = {list_one};",
        f"immutable {kind}[] listTwo = {list_two};",
        assert_eq(
            f"compare!({kind})(listOne, listTwo)", f"Relation.{case['expected']}"
        ),
    ]
