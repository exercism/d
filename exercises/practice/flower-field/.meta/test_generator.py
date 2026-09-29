from lib import assert_eq, d_array, d_string


def gen_case(case):
    prop = case["property"]
    garden = d_array(case["input"]["garden"], d_string)
    expected = d_array(case["expected"], d_string)
    return [
        f"immutable string[] garden = {garden};",
        f"string[] expected = {expected};",
        assert_eq(f"{prop}(garden)", "expected"),
    ]
