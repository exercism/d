from lib import assert_eq, d_int, d_string

MONTHS = [
    "jan",
    "feb",
    "mar",
    "apr",
    "may",
    "jun",
    "jul",
    "aug",
    "sep",
    "oct",
    "nov",
    "dec",
]


def gen_case(case):
    prop = case["property"]
    inp = case["input"]
    year = d_int(inp["year"])
    month = MONTHS[inp["month"] - 1]
    week = inp["week"]
    day = inp["dayofweek"][:3].lower()
    call = f"{prop}({year}, Month.{month}, Week.{week}, DayOfWeek.{day})"
    return assert_eq(call, d_string(case["expected"]))
