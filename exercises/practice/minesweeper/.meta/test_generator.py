from lib import assert_eq, d_array, d_string


def gen_case(case):
    prop = case["property"]
    minefield = d_array(case["input"]["minefield"], d_string)
    expected = d_array(case["expected"], d_string)
    return [
        f"immutable string[] minefield = {minefield};",
        f"string[] expected = {expected};",
        assert_eq(f"{prop}(minefield)", "expected"),
    ]
