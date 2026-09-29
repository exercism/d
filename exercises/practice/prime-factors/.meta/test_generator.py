from lib import assert_eq, d_grouped_int, d_inline_array


def gen_case(case):
    prop = case["property"]
    value = d_grouped_int(case["input"]["value"])
    expected = d_inline_array(case["expected"], d_grouped_int)
    return assert_eq(f"{prop}({value})", expected)
