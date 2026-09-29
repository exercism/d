from lib import assert_eq, d_inline_array, d_string


def gen_case(case):
    prop = case["property"]
    colors = d_inline_array(case["input"]["colors"], d_string)
    expected = case["expected"]
    label = d_string(f"{expected['value']} {expected['unit']}")
    return assert_eq(f"ResistorColorTrio.{prop}({colors})", label)
