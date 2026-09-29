from lib import assert_eq, d_array, d_int, d_string


def gen_case(case):
    prop = case["property"]
    strings = d_array(case["input"]["strings"], d_string)
    expected = d_int(case["expected"])
    return [
        f"immutable string[] strings = {strings};",
        assert_eq(f"{prop}(strings)", expected),
    ]
