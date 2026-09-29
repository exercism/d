from lib import assert_eq, assert_throws, d_inline_array, d_string, is_error


def gen_case(case):
    prop = case["property"]
    strand = d_string(case["input"]["strand"])
    call = f"{prop}({strand})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_eq(call, d_inline_array(case["expected"], d_string))
