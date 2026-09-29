from lib import assert_eq, d_inline_array, d_int, d_string


def gen_case(case):
    prop = case["property"]
    number = d_int(case["input"]["number"])
    expected = d_inline_array(case["expected"], d_string)
    return assert_eq(f"{prop}({number})", expected)
