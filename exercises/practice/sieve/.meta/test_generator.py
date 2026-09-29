from lib import INDENT, assert_eq, d_inline_array, d_int

COLUMNS = 14


def d_table(values):
    """Render an array literal as aligned rows of values."""
    rows = []
    for start in range(0, len(values), COLUMNS):
        row = values[start : start + COLUMNS]
        cells = [f"{value},".ljust(5) for value in row]
        rows.append(INDENT + "".join(cells).rstrip())
    rows[-1] = rows[-1].rstrip(",")
    return "\n".join(["[", *rows, "]"])


def describe(case):
    return case["description"]


def gen_case(case):
    prop = case["property"]
    limit = d_int(case["input"]["limit"])
    expected = case["expected"]
    call = f"{prop}({limit})"
    if len(expected) <= COLUMNS:
        return [assert_eq(call, d_inline_array(expected))]
    return [
        f"const int[] expected = {d_table(expected)};",
        "",
        assert_eq(call, "expected"),
    ]
