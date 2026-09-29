from lib import assert_eq


def gen_case(case):
    prop = case["property"]
    expected = case["expected"].lower()
    return [
        "ZebraPuzzle zebraPuzzle = new ZebraPuzzle();",
        assert_eq(f"zebraPuzzle.{prop}()", f"Nationality.{expected}"),
    ]
