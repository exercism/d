from lib import assert_eq, assert_throws, d_array, d_int, is_error


def gen_case(case):
    prop = case["property"]
    inp = case["input"]
    input_base = d_int(inp["inputBase"])
    output_base = d_int(inp["outputBase"])
    call = f"{prop}({input_base}, digits, {output_base})"

    lines = [f"immutable int[] digits = {d_array(inp['digits'])};"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        lines.append(f"int[] expected = {d_array(case['expected'])};")
        lines.append(assert_eq(call, "expected"))
    return "\n".join(lines)
