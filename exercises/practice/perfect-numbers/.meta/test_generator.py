from lib import assert_eq, assert_throws, d_grouped_int, is_error


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    number = d_grouped_int(case["input"]["number"])
    call = f"{prop}({number})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_eq(call, f"Classification.{case['expected'].upper()}")
