from lib import assert_equal, assert_throws, d_inline_array, is_error

TYPES = {
    "encode": ("uint", "ubyte"),
    "decode": ("ubyte", "uint"),
}


def describe(case):
    return f"{case['property'].capitalize()} - {case['description']}"


def gen_case(case):
    prop = case["property"]
    input_type, expected_type = TYPES[prop]
    integers = d_inline_array(case["input"]["integers"], hex)
    call = f"{prop}(integers)"

    lines = [f"immutable {input_type}[] integers = {integers};"]
    if is_error(case["expected"]):
        lines.append(assert_throws(call))
    else:
        expected = d_inline_array(case["expected"], hex)
        lines.append(f"immutable {expected_type}[] expected = {expected};")
        lines.append(assert_equal(call, "expected"))
    return lines
