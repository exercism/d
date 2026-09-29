from lib import assert_eq, assert_throws, d_inline_array, is_error


def gen_case(case):
    prop = case["property"]
    message = d_inline_array(case["input"]["message"], str)
    call = f"{prop}(message)"

    lines = [f"immutable ubyte[] message = {message};"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        expected = d_inline_array(case["expected"], str)
        lines.append(f"ubyte[] expected = {expected};")
        lines.append(assert_eq(call, "expected"))
    return lines
