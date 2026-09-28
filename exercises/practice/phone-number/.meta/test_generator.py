from lib import assert_eq, assert_throws, d_string, is_error


def gen_case(case):
    prop = case["property"]
    phrase = d_string(case["input"]["phrase"])
    call = f"{prop}({phrase})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_eq(call, d_string(case["expected"]))
