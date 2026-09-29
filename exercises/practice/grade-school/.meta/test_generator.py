from lib import assert_eq, assert_false, assert_true, d_inline_array, d_string


def gen_case(case):
    prop = case["property"]
    expected = case["expected"]
    lines = ["GradeSchool school;"]
    for index, (student, grade) in enumerate(case["input"]["students"]):
        call = f"school.add({d_string(student)}, {grade})"
        if prop != "add":
            lines.append(f"{call};")
        elif expected[index]:
            lines.append(assert_true(call))
        else:
            lines.append(assert_false(call))

    if prop == "roster":
        lines.append(assert_eq("school.roster()", d_inline_array(expected, d_string)))
    elif prop == "grade":
        call = f"school.grade({case['input']['desiredGrade']})"
        lines.append(assert_eq(call, d_inline_array(expected, d_string)))
    return lines
