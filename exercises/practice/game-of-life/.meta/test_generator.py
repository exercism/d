from lib import assert_eq, d_array, d_inline_array


def gen_case(case):
    prop = case["property"]
    matrix = d_array(case["input"]["matrix"], d_inline_array)
    expected = d_array(case["expected"], d_inline_array)
    return [
        f"immutable int[][] matrix = {matrix};",
        f"int[][] expected = {expected};",
        assert_eq(f"{prop}(matrix)", "expected"),
    ]
