from lib import assert_false, assert_true, d_int


def gen_case(case):
    year = d_int(case["input"]["year"])
    call = f"isLeap({year})"
    if case["expected"]:
        return assert_true(call)
    return assert_false(call)
