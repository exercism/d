from lib import assert_eq, d_int, d_lines


def gen_case(case):
    prop = case["property"]
    start_bottles = d_int(case["input"]["startBottles"])
    take_down = d_int(case["input"]["takeDown"])
    return [
        f"string expected =\n{d_lines(case['expected'])};",
        assert_eq(f"{prop}({start_bottles}, {take_down})", "expected"),
    ]
