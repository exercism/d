from lib import assert_eq, d_int


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    radicand = d_int(case["input"]["radicand"])
    expected = d_int(case["expected"])
    return assert_eq(f"{prop}({radicand})", expected)
