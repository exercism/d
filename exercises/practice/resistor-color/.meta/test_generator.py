from lib import assert_eq, d_inline_array, d_int, d_string


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    if prop == "colors":
        expected = d_inline_array(case["expected"], d_string)
        return assert_eq(f"ResistorColor.{prop}", expected)

    color = d_string(case["input"]["color"])
    expected = d_int(case["expected"])
    return assert_eq(f"ResistorColor.{prop}({color})", expected)
