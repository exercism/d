from lib import assert_eq, d_string


def gen_case(case):
    value = d_string(case["input"]["value"])
    expected = d_string(case["expected"])
    return assert_eq(f"reverseString({value})", expected)
