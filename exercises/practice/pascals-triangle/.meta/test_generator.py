from lib import assert_eq, d_array, d_inline_array, d_int


def gen_case(case):
    prop = case["property"]
    count = d_int(case["input"]["count"])
    expected = d_array(case["expected"], d_inline_array)
    return [
        f"int[][] expected = {expected};",
        assert_eq(f"{prop}({count})", "expected"),
    ]
