from lib import assert_false, assert_true, d_string


def gen_case(case):
    prop = case["property"]
    value = d_string(case["input"]["value"])
    call = f"{prop}({value})"
    if case["expected"]:
        return assert_true(call)
    return assert_false(call)
