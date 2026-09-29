from lib import assert_equal, assert_throws, d_array, d_int, is_error


def gen_case(case):
    prop = case["property"]
    coins = d_array(case["input"]["coins"])
    target = d_int(case["input"]["target"])
    call = f"{prop}(coins, {target})"

    lines = [f"immutable ushort[] coins = {coins};"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        lines.append(f"ushort[] expected = {d_array(case['expected'])};")
        lines.append(assert_equal(call, "expected"))
    return lines
