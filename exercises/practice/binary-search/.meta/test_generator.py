from lib import assert_eq, assert_throws, d_inline_array, d_int, is_error


def gen_case(case):
    prop = case["property"]
    array = d_inline_array(case["input"]["array"])
    value = d_int(case["input"]["value"])
    call = f"bs.{prop}({value})"

    lines = [f"BinarySearch bs = new BinarySearch({array});"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        lines.append(assert_eq(call, d_int(case["expected"])))
    return lines
