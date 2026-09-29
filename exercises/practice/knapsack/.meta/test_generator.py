from lib import assert_eq, d_array, d_int


def d_item(item):
    return f"Item({item['weight']}, {item['value']})"


def gen_case(case):
    prop = case["property"]
    items = d_array(case["input"]["items"], d_item)
    maximum_weight = d_int(case["input"]["maximumWeight"])
    expected = d_int(case["expected"])
    return [
        f"Item[] items = {items};",
        assert_eq(f"{prop}(items, {maximum_weight})", expected),
    ]
