from lib import assert_eq, d_inline_array, d_int


def gen_case(case):
    factors = d_inline_array(case["input"]["factors"])
    limit = d_int(case["input"]["limit"])
    expected = d_int(case["expected"])
    return assert_eq(f"calculateSum({factors}, {limit})", expected)
