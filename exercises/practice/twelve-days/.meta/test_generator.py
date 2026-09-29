from lib import assert_eq, d_int, d_lines


def gen_case(case):
    prop = case["property"]
    start_verse = d_int(case["input"]["startVerse"])
    end_verse = d_int(case["input"]["endVerse"])
    return [
        f"string expected =\n{d_lines(case['expected'])};",
        assert_eq(f"{prop}({start_verse}, {end_verse})", "expected"),
    ]
