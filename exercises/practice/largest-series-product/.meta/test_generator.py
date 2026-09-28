from lib import assert_eq, assert_throws, d_int, d_string, is_error


def gen_case(case):
    prop = case["property"]
    digits = d_string(case["input"]["digits"])
    span = d_int(case["input"]["span"])
    call = f"{prop}({digits}, {span})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_eq(call, d_int(case["expected"]))
