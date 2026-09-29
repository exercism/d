from lib import assert_eq, d_string


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    phrase = d_string(case["input"]["phrase"])
    expected = d_string(case["expected"])
    return assert_eq(f"{prop}({phrase})", expected)
