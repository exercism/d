from lib import assert_eq, d_string


def gen_case(case):
    prop = case["property"]
    dna = d_string(case["input"]["dna"])
    expected = d_string(case["expected"])
    return assert_eq(f"{prop}({dna})", expected)
