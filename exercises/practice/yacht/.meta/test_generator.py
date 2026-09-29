from lib import assert_eq, d_inline_array, d_int


def camel(words):
    """Convert words such as "full house" to an identifier such as fullHouse."""
    first, *rest = words.split()
    return first + "".join(word.capitalize() for word in rest)


def gen_case(case):
    prop = case["property"]
    dice = d_inline_array(case["input"]["dice"])
    category = camel(case["input"]["category"])
    expected = d_int(case["expected"])
    return assert_eq(f"{prop}({dice}, Category.{category})", expected)
