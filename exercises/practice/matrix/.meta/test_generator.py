from lib import assert_eq, d_inline_array, d_int, d_string


def gen_case(case):
    prop = case["property"]
    numbers = d_string(case["input"]["string"])
    index = d_int(case["input"]["index"])
    expected = d_inline_array(case["expected"])
    return "\n".join(
        [
            f"immutable string numbers = {numbers};",
            f"int[] expected = {expected};",
            assert_eq(f"{prop}(numbers, {index})", "expected"),
        ]
    )
