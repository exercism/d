from lib import assert_eq, d_array, d_string


def gen_case(case):
    prop = case["property"]
    letter = case["input"]["letter"]
    expected = d_array(case["expected"], d_string)
    return [
        f"string[] expected = {expected};",
        assert_eq(f"{prop}('{letter}')", "expected"),
    ]
