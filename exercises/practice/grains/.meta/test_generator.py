from lib import assert_eq, assert_throws, d_grouped_int, d_int, is_error


def describe(case):
    if is_error(case["expected"]):
        description = case["description"].replace("is invalid", "raises an exception")
    else:
        description = " - ".join((*case["parents"], case["description"]))
    return description[:1].upper() + description[1:]


def gen_case(case):
    prop = case["property"]
    arguments = ", ".join(d_int(value) for value in case["input"].values())
    call = f"{prop}({arguments})"
    if is_error(case["expected"]):
        return assert_throws(call)
    return assert_eq(call, d_grouped_int(case["expected"]))
