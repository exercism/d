from lib import assert_eq, assert_throws, d_array, d_string, is_error


def gen_case(case):
    prop = case["property"]
    board = d_array(case["input"]["board"], d_string)
    call = f"{prop}(board)"

    lines = [f"immutable string[] board = {board};"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        lines.append(assert_eq(call, f"State.{case['expected']}"))
    return lines
