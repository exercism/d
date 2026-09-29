from lib import assert_true, d_grouped_int


def gen_case(case):
    planet = case["input"]["planet"].lower()
    seconds = d_grouped_int(case["input"]["seconds"])
    expected = case["expected"]
    return [
        f"scope SpaceAge age = new SpaceAge({seconds});",
        assert_true(f"age.on_{planet}().isClose({expected}, 0.01)"),
    ]
