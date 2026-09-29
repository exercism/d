from lib import assert_eq, d_array, d_string


def gen_case(case):
    prop = case["property"]
    board = d_array(case["input"]["board"], d_string)
    expected = d_string(case["expected"])
    return [
        f"immutable string[] board = {board};",
        assert_eq(f"{prop}(board)", expected),
    ]
