from lib import assert_eq, d_array, d_int


def d_triplet(triplet):
    a, b, c = triplet
    return f"Triplet({a}, {b}, {c})"


def gen_case(case):
    prop = case["property"]
    n = d_int(case["input"]["n"])
    expected = d_array(case["expected"], d_triplet)
    return [
        f"Triplet[] expected = {expected};",
        assert_eq(f"{prop}({n})", "expected"),
    ]
