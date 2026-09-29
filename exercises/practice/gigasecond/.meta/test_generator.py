import re

from lib import assert_eq


def d_date_time(moment):
    """Render a moment such as 2015-01-24T22:00:00 as a DateTime."""
    fields = [str(int(field)) for field in re.split("[-T:]", moment)]
    return f"DateTime({', '.join(fields)})"


def gen_case(case):
    prop = case["property"]
    moment = d_date_time(case["input"]["moment"])
    expected = d_date_time(case["expected"])
    return assert_eq(f"{prop}({moment})", expected)
