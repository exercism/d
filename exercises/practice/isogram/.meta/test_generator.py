from lib import assert_false, assert_true, d_string


def gen_case(case):
    prop = case["property"]
    phrase = d_string(case["input"]["phrase"])
    call = f"{prop}({phrase})"
    if case["expected"]:
        return assert_true(call)
    return assert_false(call)
