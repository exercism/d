from lib import assert_eq, assert_throws, d_int, d_string, is_error


def gen_case(case):
    prop = case["property"]
    strand1 = d_string(case["input"]["strand1"])
    strand2 = d_string(case["input"]["strand2"])
    call = f"{prop}({strand1}, {strand2})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_eq(call, d_int(case["expected"]))
