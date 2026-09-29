from lib import assert_eq, d_int


def gen_case(case):
    prop = case["property"]
    x = case["input"]["x"]
    y = case["input"]["y"]
    expected = d_int(case["expected"])
    return assert_eq(f"{prop}({x}, {y})", expected)
