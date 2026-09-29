from lib import assert_eq, d_int, d_string


def gen_case(case):
    prop = case["property"]
    number = d_int(case["input"]["number"])
    expected = d_string(case["expected"])
    return assert_eq(f"{prop}({number})", expected)
