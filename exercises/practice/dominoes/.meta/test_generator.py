from lib import assert_false, assert_true, d_inline_array


def d_stone(stone):
    left, right = stone
    return f"Stone({left}, {right})"


def gen_case(case):
    prop = case["property"]
    dominoes = case["input"]["dominoes"]
    declaration = "immutable Stone[] dominoes"
    if dominoes:
        declaration += f" = {d_inline_array(dominoes, d_stone)}"
    call = f"{prop}(dominoes)"
    return [
        f"{declaration};",
        assert_true(call) if case["expected"] else assert_false(call),
    ]
