from lib import assert_eq, d_int, d_string


def describe(case):
    return " ".join((*case["parents"], case["description"]))


def gen_case(case):
    inp = case["input"]
    x = d_int(inp["position"]["x"])
    y = d_int(inp["position"]["y"])
    direction = d_string(inp["direction"])
    expected = case["expected"]

    lines = [f"RobotSimulator robot = new RobotSimulator({x}, {y}, {direction});"]
    if case["property"] == "move":
        lines.append(f"robot.move({d_string(inp['instructions'])});")
    lines.append(assert_eq("robot.x", d_int(expected["position"]["x"])))
    lines.append(assert_eq("robot.y", d_int(expected["position"]["y"])))
    lines.append(assert_eq("robot.direction", d_string(expected["direction"])))
    return lines
