from lib import assert_eq, d_string


def gen_case(case):
    prop = case["property"]
    phrase = d_string(case["input"]["phrase"])
    expected = d_string(case["expected"])
    return [
        f"string phrase = {phrase};",
        assert_eq(f"{prop}(phrase)", expected),
    ]
