from lib import assert_eq, d_inline_array, d_int


def gen_case(case):
    prop = case["property"]
    basket = d_inline_array(case["input"]["basket"])
    expected = d_int(case["expected"])
    return [
        f"immutable int[] basket = {basket};",
        assert_eq(f"{prop}(basket)", expected),
    ]
