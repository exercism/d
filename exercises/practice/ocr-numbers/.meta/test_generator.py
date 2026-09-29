from lib import assert_eq, assert_throws, d_array, d_string, is_error


def gen_case(case):
    prop = case["property"]
    rows = d_array(case["input"]["rows"], d_string)
    call = f"{prop}(rows)"

    lines = [f"immutable string[] rows = {rows};"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        lines.append(assert_eq(call, d_string(case["expected"])))
    return lines
