from lib import (
    assert_eq,
    assert_false,
    assert_true,
    d_array,
    d_inline_array,
    d_int,
    d_string,
)


def describe(case):
    (parent,) = case["parents"]
    return f"{parent.rstrip(':')}: {case['description']}"


def gen_case(case):
    score = d_int(case["input"]["score"])
    lines = [f"scope Allergies allergies = new Allergies({score});"]
    if case["property"] == "allergicTo":
        call = f"allergies.allergicTo({d_string(case['input']['item'])})"
        lines.append(assert_true(call) if case["expected"] else assert_false(call))
        return lines

    allergens = case["expected"]
    render = d_array if len(allergens) > 2 else d_inline_array
    expected = render(allergens, d_string)
    lines.append("string[] result = allergies.list();")
    lines.append(f"string[] expected = {expected};")
    lines.append(assert_eq("result", "expected"))
    return lines
