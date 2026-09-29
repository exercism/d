from lib import assert_eq, d_grouped_int, d_int

PROPERTIES = {
    "squareOfSum": "squareOfSum",
    "sumOfSquares": "sumOfSquares",
    "differenceOfSquares": "difference",
}


def describe(case):
    description = case["description"]
    return description[:1].upper() + description[1:]


def gen_case(case):
    prop = PROPERTIES[case["property"]]
    number = d_int(case["input"]["number"])
    expected = d_grouped_int(case["expected"])
    return assert_eq(f"squares({number}).{prop}", expected)
