from lib import assert_eq, d_int, d_string


def gen_case(case):
    prop = case["property"]
    word = d_string(case["input"]["word"])
    expected = d_int(case["expected"])
    return assert_eq(f"{prop}({word})", expected)
