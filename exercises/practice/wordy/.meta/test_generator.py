from lib import assert_eq, assert_throws, d_int, d_string, is_error


def gen_case(case):
    prop = case["property"]
    question = d_string(case["input"]["question"])
    call = f"{prop}(question)"

    lines = [f"immutable question = {question};"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        lines.append(assert_eq(call, d_int(case["expected"])))
    return lines
