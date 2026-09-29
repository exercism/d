from lib import INDENT, assert_eq, d_inline_array, d_lines, d_string


def gen_case(case):
    prop = case["property"]
    strings = d_inline_array(case["input"]["strings"], d_string)
    expected = d_lines(case["expected"]) or INDENT + '""'
    return [
        f"string expected =\n{expected};",
        assert_eq(f"{prop}({strings})", "expected"),
    ]
