from lib import assert_equal, d_int, d_string


def gen_case(case):
    prop = case["property"]
    name = d_string(case["input"]["name"])
    number = d_int(case["input"]["number"])
    expected = d_string(case["expected"])
    return assert_equal(expected, f"{prop}({name}, {number})", wrap=True)
