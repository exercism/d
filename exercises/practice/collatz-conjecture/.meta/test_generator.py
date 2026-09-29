from lib import assert_eq, assert_throws, d_int, is_error


def gen_case(case):
    prop = case["property"]
    number = d_int(case["input"]["number"])
    call = f"{prop}({number})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_eq(call, d_int(case["expected"]))
