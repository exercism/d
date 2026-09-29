from lib import assert_eq, d_string


def describe(case):
    description = case["description"]
    return description[:1].upper() + description[1:]


def gen_case(case):
    prop = case["property"]
    string = d_string(case["input"]["string"])
    expected = d_string(case["expected"])
    if prop == "consistency":
        return assert_eq(f"{string}.encode.decode", expected)
    return assert_eq(f"{prop}({string})", expected)
