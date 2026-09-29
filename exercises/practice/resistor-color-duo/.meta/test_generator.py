from lib import assert_eq, d_inline_array, d_int, d_string


def gen_case(case):
    prop = case["property"]
    colors = d_inline_array(case["input"]["colors"], d_string)
    expected = d_int(case["expected"])
    return assert_eq(f"ResistorColorDuo.{prop}({colors})", expected)
