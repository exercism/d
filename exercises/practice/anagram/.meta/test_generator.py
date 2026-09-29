from lib import assert_eq, d_inline_array, d_string


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    subject = d_string(case["input"]["subject"])
    candidates = d_inline_array(case["input"]["candidates"], d_string)
    expected = d_inline_array(case["expected"], d_string)
    return [
        f"immutable string subject = {subject};",
        f"immutable string[] candidates = {candidates};",
        f"string[] actual = {prop}(subject, candidates);",
        f"string[] expected = {expected};",
        "",
        assert_eq("actual", "expected"),
    ]
