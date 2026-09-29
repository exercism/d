from lib import assert_eq, assert_throws, d_int, d_string, is_error


def gen_case(case):
    prop = case["property"]
    inp = case["input"]
    size1 = d_int(inp["bucketOne"])
    size2 = d_int(inp["bucketTwo"])
    goal = d_int(inp["goal"])
    start_bucket = d_string(inp["startBucket"])
    call = f"{prop}(TwoBucketInput({size1}, {size2}, {goal}, {start_bucket}))"
    expected = case["expected"]
    if is_error(expected):
        return [assert_throws(call)]

    moves = d_int(expected["moves"])
    goal_bucket = d_string(expected["goalBucket"])
    other_amount = d_int(expected["otherBucket"])
    return [
        f"auto result = {call};",
        assert_eq("result", f"TwoBucketResult({moves}, {goal_bucket}, {other_amount})"),
    ]
