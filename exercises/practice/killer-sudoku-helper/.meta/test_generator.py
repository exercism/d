from lib import assert_eq, d_inline_array, d_int


def bitset(digits):
    """Represent a set of digits as an integer, with bit 0 for the digit 1."""
    return sum(1 << (digit - 1) for digit in digits)


def gen_case(case):
    prop = case["property"]
    cage = case["input"]["cage"]
    total = d_int(cage["sum"])
    size = d_int(cage["size"])
    exclude = d_int(bitset(cage["exclude"]))
    expected = d_inline_array(sorted(bitset(digits) for digits in case["expected"]))
    return [
        f"ushort[] expected = {expected};",
        assert_eq(f"{prop}({total}, {size}, {exclude})", "expected"),
    ]
