from lib import assert_eq, d_int, d_string


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    text = d_string(case["input"]["text"])
    shift_key = d_int(case["input"]["shiftKey"])
    expected = d_string(case["expected"])
    return [assert_eq(expected, f"{prop}({text}, {shift_key})")]
