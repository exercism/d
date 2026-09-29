from lib import assert_false, assert_true, d_int


def gen_case(case):
    prop = case["property"]
    number = d_int(case["input"]["number"])
    call = f"{prop}({number})"
    if case["expected"]:
        return assert_true(call)
    return assert_false(call)
