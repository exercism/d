from lib import assert_eq, d_inline_array, d_string


def gen_case(case):
    colors = d_inline_array(case["input"]["colors"], d_string)
    expected = case["expected"]
    label = f"{expected['value']} {expected['unit']}"
    if "tolerance" in expected:
        label += f" {expected['tolerance']}"
    return assert_eq(f"ResistorColorTolerance.label({colors})", d_string(label))
