from lib import assert_eq, d_string


def gen_case(case):
    prop = case["property"]
    name = case["input"]["name"]
    argument = "" if name is None else d_string(name)
    expected = d_string(case["expected"])
    return assert_eq(f"{prop}({argument})", expected)
