from lib import assert_eq, d_string


def gen_case(case):
    prop = case["property"]
    expected = d_string(case["expected"])
    return assert_eq(f"{prop}()", expected)
