from lib import assert_eq, d_int

EMPTY = "Empty buffer should throw exception if popped!"
FULL = "Full buffer should throw exception if new element pushed!"

# The element type used to instantiate the template in each test case.
TYPES = {
    "reading empty buffer should fail": "int",
    "each item may only be read once": "short",
    "full buffer can't be written to": "long",
    "read position is maintained even across multiple writes": "int",
    "clear frees up capacity for another write": "short",
    "overwrite acts like write on non-full buffer": "long",
    "overwrite replaces the oldest item remaining in buffer following a read": "int",
}


def d_item(item, kind):
    return f"'{item}'" if kind == "char" else d_int(item)


def gen_operation(operation, kind):
    name = operation["operation"]
    if name == "clear":
        return "myBuffer.clear();"
    if name == "overwrite":
        return f"myBuffer.forcePush({d_item(operation['item'], kind)});"
    if name == "write":
        call = f"myBuffer.push({d_item(operation['item'], kind)})"
        if operation["should_succeed"]:
            return f"{call};"
        return f'assertThrown({call}, "{FULL}");'
    if operation["should_succeed"]:
        return assert_eq("myBuffer.pop()", d_item(operation["expected"], kind))
    return f'assertThrown(myBuffer.pop(), "{EMPTY}");'


def gen_case(case):
    kind = TYPES.get(case["description"], "char")
    capacity = d_int(case["input"]["capacity"])
    operations = case["input"]["operations"]
    return [
        f"auto myBuffer = new Buffer!({kind})({capacity});",
        *(gen_operation(operation, kind) for operation in operations),
    ]
