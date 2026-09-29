from lib import assert_eq, d_string


def gen_case(case):
    text = d_string(case["input"]["heyBob"])
    expected = d_string(case["expected"])
    return assert_eq(f"hey({text})", expected)
