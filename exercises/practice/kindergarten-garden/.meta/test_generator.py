from lib import assert_eq, d_array, d_string


def gen_case(case):
    prop = case["property"]
    diagram = d_string(case["input"]["diagram"])
    student = d_string(case["input"]["student"])
    expected = d_array(case["expected"], d_string)
    return [
        f"immutable string diagram = {diagram};",
        f"string[4] expected = {expected};",
        assert_eq(f"{prop}(diagram, {student})", "expected"),
    ]
