module grade_school;

struct GradeSchool
{
    bool add(immutable string student, immutable int grade)
    {
        // implement this function
    }

    string[] grade(int grade)
    {
        // implement this function
    }

    string[] roster()
    {
        // implement this function
    }
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Roster is empty when no student is added
    {
        GradeSchool school;
        assert(school.roster() == []);
    }

    static if (allTestsEnabled)
    {
        // Add a student
        {
            GradeSchool school;
            assert(school.add("Aimee", 2));
        }

        // Student is added to the roster
        {
            GradeSchool school;
            school.add("Aimee", 2);
            assert(school.roster() == ["Aimee"]);
        }

        // Adding multiple students in the same grade in the roster
        {
            GradeSchool school;
            assert(school.add("Blair", 2));
            assert(school.add("James", 2));
            assert(school.add("Paul", 2));
        }

        // Multiple students in the same grade are added to the roster
        {
            GradeSchool school;
            school.add("Blair", 2);
            school.add("James", 2);
            school.add("Paul", 2);
            assert(school.roster() == ["Blair", "James", "Paul"]);
        }

        // Cannot add student to same grade in the roster more than once
        {
            GradeSchool school;
            school.add("Blair", 2);
            assert(school.add("James", 2));
            assert(!school.add("James", 2));
            school.add("Paul", 2);
        }

        // Student not added to same grade in the roster more than once
        {
            GradeSchool school;
            school.add("Blair", 2);
            school.add("James", 2);
            school.add("James", 2);
            school.add("Paul", 2);
            assert(school.roster() == ["Blair", "James", "Paul"]);
        }

        // Adding students in multiple grades
        {
            GradeSchool school;
            assert(school.add("Chelsea", 3));
            assert(school.add("Logan", 7));
        }

        // Students in multiple grades are added to the roster
        {
            GradeSchool school;
            school.add("Chelsea", 3);
            school.add("Logan", 7);
            assert(school.roster() == ["Chelsea", "Logan"]);
        }

        // Cannot add same student to multiple grades in the roster
        {
            GradeSchool school;
            school.add("Blair", 2);
            assert(school.add("James", 2));
            assert(!school.add("James", 3));
            school.add("Paul", 3);
        }

        // Student not added to multiple grades in the roster
        {
            GradeSchool school;
            school.add("Blair", 2);
            school.add("James", 2);
            school.add("James", 3);
            school.add("Paul", 3);
            assert(school.roster() == ["Blair", "James", "Paul"]);
        }

        // Students are sorted by grades in the roster
        {
            GradeSchool school;
            school.add("Jim", 3);
            school.add("Peter", 2);
            school.add("Anna", 1);
            assert(school.roster() == ["Anna", "Peter", "Jim"]);
        }

        // Students are sorted by name in the roster
        {
            GradeSchool school;
            school.add("Peter", 2);
            school.add("Zoe", 2);
            school.add("Alex", 2);
            assert(school.roster() == ["Alex", "Peter", "Zoe"]);
        }

        // Students are sorted by grades and then by name in the roster
        {
            GradeSchool school;
            school.add("Peter", 2);
            school.add("Anna", 1);
            school.add("Barb", 1);
            school.add("Zoe", 2);
            school.add("Alex", 2);
            school.add("Jim", 3);
            school.add("Charlie", 1);
            assert(school.roster() == ["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]);
        }

        // Grade is empty if no students in the roster
        {
            GradeSchool school;
            assert(school.grade(1) == []);
        }

        // Grade is empty if no students in that grade
        {
            GradeSchool school;
            school.add("Peter", 2);
            school.add("Zoe", 2);
            school.add("Alex", 2);
            school.add("Jim", 3);
            assert(school.grade(1) == []);
        }

        // Student not added to same grade more than once
        {
            GradeSchool school;
            school.add("Blair", 2);
            school.add("James", 2);
            school.add("James", 2);
            school.add("Paul", 2);
            assert(school.grade(2) == ["Blair", "James", "Paul"]);
        }

        // Student not added to multiple grades
        {
            GradeSchool school;
            school.add("Blair", 2);
            school.add("James", 2);
            school.add("James", 3);
            school.add("Paul", 3);
            assert(school.grade(2) == ["Blair", "James"]);
        }

        // Student not added to other grade for multiple grades
        {
            GradeSchool school;
            school.add("Blair", 2);
            school.add("James", 2);
            school.add("James", 3);
            school.add("Paul", 3);
            assert(school.grade(3) == ["Paul"]);
        }

        // Students are sorted by name in a grade
        {
            GradeSchool school;
            school.add("Franklin", 5);
            school.add("Bradley", 5);
            school.add("Jeff", 1);
            assert(school.grade(5) == ["Bradley", "Franklin"]);
        }
    }
}
