from lib import assert_false, assert_true, d_string


def gen_case(case):
    prop = case["property"]
    isbn = d_string(case["input"]["isbn"])
    call = f"{prop}({isbn})"
    if case["expected"]:
        return assert_true(call)
    return assert_false(call)
