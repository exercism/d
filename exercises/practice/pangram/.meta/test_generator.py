from lib import assert_false, assert_true, d_string


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    sentence = d_string(case["input"]["sentence"])
    call = f"{prop}({sentence})"
    if case["expected"]:
        return assert_true(call)
    return assert_false(call)
