from lib import assert_eq, d_string


def describe(case):
    description = case["description"]
    return description[:1].upper() + description[1:]


def gen_case(case):
    prop = case["property"]
    phrase = d_string(case["input"]["phrase"])
    expected = d_string(case["expected"])
    return assert_eq(f"{prop}({phrase})", expected)
