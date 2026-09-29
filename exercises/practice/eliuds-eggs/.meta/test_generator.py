from lib import assert_eq, d_grouped_int, d_int


def gen_case(case):
    prop = case["property"]
    number = d_grouped_int(case["input"]["number"])
    expected = d_int(case["expected"])
    return assert_eq(f"{prop}({number})", expected)
