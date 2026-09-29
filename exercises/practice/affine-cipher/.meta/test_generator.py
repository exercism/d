from lib import assert_equal, assert_throws, d_int, d_string, is_error


def gen_case(case):
    prop = case["property"]
    phrase = d_string(case["input"]["phrase"])
    a = d_int(case["input"]["key"]["a"])
    b = d_int(case["input"]["key"]["b"])
    call = f"{prop}({phrase}, {a}, {b})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_equal(d_string(case["expected"]), call)
