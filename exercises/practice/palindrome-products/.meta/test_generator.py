from lib import assert_eq, assert_throws, d_inline_array, d_int, is_error


def gen_case(case):
    prop = case["property"]
    minimum = d_int(case["input"]["min"])
    maximum = d_int(case["input"]["max"])
    call = f"{prop}({minimum}, {maximum})"
    expected = case["expected"]
    if is_error(expected):
        return assert_throws(call)

    lines = [f"auto result = {call};"]
    if expected["value"] is None:
        lines.append(assert_eq("result.value", "0"))
        lines.append(assert_eq("result.factors.length", "0"))
    else:
        factors = d_inline_array(expected["factors"], d_inline_array)
        lines.append(assert_eq("result.value", d_int(expected["value"])))
        lines.append(assert_eq("result.factors", factors))
    return lines
