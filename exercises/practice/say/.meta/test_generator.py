from lib import assert_equal, assert_throws, d_int, d_string, is_error


def gen_case(case):
    prop = case["property"]
    number = d_int(case["input"]["number"]) + "L"
    call = f"{prop}({number})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_equal(d_string(case["expected"]), call, wrap=True)
