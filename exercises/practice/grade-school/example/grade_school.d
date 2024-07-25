module grade_school;

import std.algorithm;
import std.array;

struct GradeSchool
{
    bool add(immutable string student, immutable int grade)
    {
        if (student in students)
        {
            return false;
        }

        students[student] = grade;
        return true;
    }

    string[] grade(int grade)
    {
        return students
               .byKeyValue
               .filter!(kvp => kvp.value == grade)
               .map!(kvp => kvp.key)
               .array
               .sort
               .array;
    }

    string[] roster()
    {
        return students
                .byKeyValue
                .array
                .sort!((a, b) => a.value < b.value || (a.value == b.value && a.key < b.key))
                .map!(kvp => kvp.key)
                .array;
    }

    private:
        int[string] students;
}
