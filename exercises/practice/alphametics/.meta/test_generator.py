from lib import assert_eq, assert_throws, d_string


def solution(puzzle, digits):
    """Replace each letter of the puzzle by its digit."""
    return "".join(str(digits.get(char, char)) for char in puzzle)


def gen_case(case):
    prop = case["property"]
    puzzle = case["input"]["puzzle"]
    call = f"{prop}({d_string(puzzle)})"
    if case["expected"] is None:
        return assert_throws(call)
    return assert_eq(call, d_string(solution(puzzle, case["expected"])))
