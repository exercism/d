module meetup;

enum Month {
    january,
    february,
    march,
    april,
    may,
    june,
    july,
    august,
    september,
    october,
    november,
    december,
}

enum Week {
    first,
    second,
    third,
    fourth,
    teenth,
    last,
}

enum Day {
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
}

pure string meetup(ushort year, Month month, Week week, Day day)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // When teenth Monday is the 13th, the first day of the teenth week
    assert(meetup(2013, Month.may, Week.teenth, Day.monday) == "2013-05-13");

    static if (allTestsEnabled)
    {
        // When teenth Monday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.august, Week.teenth, Day.monday) == "2013-08-19");

        // When teenth Monday is some day in the middle of the teenth week
        assert(meetup(2013, Month.september, Week.teenth, Day.monday) == "2013-09-16");

        // When teenth Tuesday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.march, Week.teenth, Day.tuesday) == "2013-03-19");

        // When teenth Tuesday is some day in the middle of the teenth week
        assert(meetup(2013, Month.april, Week.teenth, Day.tuesday) == "2013-04-16");

        // When teenth Tuesday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.august, Week.teenth, Day.tuesday) == "2013-08-13");

        // When teenth Wednesday is some day in the middle of the teenth week
        assert(meetup(2013, Month.january, Week.teenth, Day.wednesday) == "2013-01-16");

        // When teenth Wednesday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.february, Week.teenth, Day.wednesday) == "2013-02-13");

        // When teenth Wednesday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.june, Week.teenth, Day.wednesday) == "2013-06-19");

        // When teenth Thursday is some day in the middle of the teenth week
        assert(meetup(2013, Month.may, Week.teenth, Day.thursday) == "2013-05-16");

        // When teenth Thursday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.june, Week.teenth, Day.thursday) == "2013-06-13");

        // When teenth Thursday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.september, Week.teenth, Day.thursday) == "2013-09-19");

        // When teenth Friday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.april, Week.teenth, Day.friday) == "2013-04-19");

        // When teenth Friday is some day in the middle of the teenth week
        assert(meetup(2013, Month.august, Week.teenth, Day.friday) == "2013-08-16");

        // When teenth Friday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.september, Week.teenth, Day.friday) == "2013-09-13");

        // When teenth Saturday is some day in the middle of the teenth week
        assert(meetup(2013, Month.february, Week.teenth, Day.saturday) == "2013-02-16");

        // When teenth Saturday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.april, Week.teenth, Day.saturday) == "2013-04-13");

        // When teenth Saturday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.october, Week.teenth, Day.saturday) == "2013-10-19");

        // When teenth Sunday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.may, Week.teenth, Day.sunday) == "2013-05-19");

        // When teenth Sunday is some day in the middle of the teenth week
        assert(meetup(2013, Month.june, Week.teenth, Day.sunday) == "2013-06-16");

        // When teenth Sunday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.october, Week.teenth, Day.sunday) == "2013-10-13");

        // When first Monday is some day in the middle of the first week
        assert(meetup(2013, Month.march, Week.first, Day.monday) == "2013-03-04");

        // When first Monday is the 1st, the first day of the first week
        assert(meetup(2013, Month.april, Week.first, Day.monday) == "2013-04-01");

        // When first Tuesday is the 7th, the last day of the first week
        assert(meetup(2013, Month.may, Week.first, Day.tuesday) == "2013-05-07");

        // When first Tuesday is some day in the middle of the first week
        assert(meetup(2013, Month.june, Week.first, Day.tuesday) == "2013-06-04");

        // When first Wednesday is some day in the middle of the first week
        assert(meetup(2013, Month.july, Week.first, Day.wednesday) == "2013-07-03");

        // When first Wednesday is the 7th, the last day of the first week
        assert(meetup(2013, Month.august, Week.first, Day.wednesday) == "2013-08-07");

        // When first Thursday is some day in the middle of the first week
        assert(meetup(2013, Month.september, Week.first, Day.thursday) == "2013-09-05");

        // When first Thursday is another day in the middle of the first week
        assert(meetup(2013, Month.october, Week.first, Day.thursday) == "2013-10-03");

        // When first Friday is the 1st, the first day of the first week
        assert(meetup(2013, Month.november, Week.first, Day.friday) == "2013-11-01");

        // When first Friday is some day in the middle of the first week
        assert(meetup(2013, Month.december, Week.first, Day.friday) == "2013-12-06");

        // When first Saturday is some day in the middle of the first week
        assert(meetup(2013, Month.january, Week.first, Day.saturday) == "2013-01-05");

        // When first Saturday is another day in the middle of the first week
        assert(meetup(2013, Month.february, Week.first, Day.saturday) == "2013-02-02");

        // When first Sunday is some day in the middle of the first week
        assert(meetup(2013, Month.march, Week.first, Day.sunday) == "2013-03-03");

        // When first Sunday is the 7th, the last day of the first week
        assert(meetup(2013, Month.april, Week.first, Day.sunday) == "2013-04-07");

        // When second Monday is some day in the middle of the second week
        assert(meetup(2013, Month.march, Week.second, Day.monday) == "2013-03-11");

        // When second Monday is the 8th, the first day of the second week
        assert(meetup(2013, Month.april, Week.second, Day.monday) == "2013-04-08");

        // When second Tuesday is the 14th, the last day of the second week
        assert(meetup(2013, Month.may, Week.second, Day.tuesday) == "2013-05-14");

        // When second Tuesday is some day in the middle of the second week
        assert(meetup(2013, Month.june, Week.second, Day.tuesday) == "2013-06-11");

        // When second Wednesday is some day in the middle of the second week
        assert(meetup(2013, Month.july, Week.second, Day.wednesday) == "2013-07-10");

        // When second Wednesday is the 14th, the last day of the second week
        assert(meetup(2013, Month.august, Week.second, Day.wednesday) == "2013-08-14");

        // When second Thursday is some day in the middle of the second week
        assert(meetup(2013, Month.september, Week.second, Day.thursday) == "2013-09-12");

        // When second Thursday is another day in the middle of the second week
        assert(meetup(2013, Month.october, Week.second, Day.thursday) == "2013-10-10");

        // When second Friday is the 8th, the first day of the second week
        assert(meetup(2013, Month.november, Week.second, Day.friday) == "2013-11-08");

        // When second Friday is some day in the middle of the second week
        assert(meetup(2013, Month.december, Week.second, Day.friday) == "2013-12-13");

        // When second Saturday is some day in the middle of the second week
        assert(meetup(2013, Month.january, Week.second, Day.saturday) == "2013-01-12");

        // When second Saturday is another day in the middle of the second week
        assert(meetup(2013, Month.february, Week.second, Day.saturday) == "2013-02-09");

        // When second Sunday is some day in the middle of the second week
        assert(meetup(2013, Month.march, Week.second, Day.sunday) == "2013-03-10");

        // When second Sunday is the 14th, the last day of the second week
        assert(meetup(2013, Month.april, Week.second, Day.sunday) == "2013-04-14");

        // When third Monday is some day in the middle of the third week
        assert(meetup(2013, Month.march, Week.third, Day.monday) == "2013-03-18");

        // When third Monday is the 15th, the first day of the third week
        assert(meetup(2013, Month.april, Week.third, Day.monday) == "2013-04-15");

        // When third Tuesday is the 21st, the last day of the third week
        assert(meetup(2013, Month.may, Week.third, Day.tuesday) == "2013-05-21");

        // When third Tuesday is some day in the middle of the third week
        assert(meetup(2013, Month.june, Week.third, Day.tuesday) == "2013-06-18");

        // When third Wednesday is some day in the middle of the third week
        assert(meetup(2013, Month.july, Week.third, Day.wednesday) == "2013-07-17");

        // When third Wednesday is the 21st, the last day of the third week
        assert(meetup(2013, Month.august, Week.third, Day.wednesday) == "2013-08-21");

        // When third Thursday is some day in the middle of the third week
        assert(meetup(2013, Month.september, Week.third, Day.thursday) == "2013-09-19");

        // When third Thursday is another day in the middle of the third week
        assert(meetup(2013, Month.october, Week.third, Day.thursday) == "2013-10-17");

        // When third Friday is the 15th, the first day of the third week
        assert(meetup(2013, Month.november, Week.third, Day.friday) == "2013-11-15");

        // When third Friday is some day in the middle of the third week
        assert(meetup(2013, Month.december, Week.third, Day.friday) == "2013-12-20");

        // When third Saturday is some day in the middle of the third week
        assert(meetup(2013, Month.january, Week.third, Day.saturday) == "2013-01-19");

        // When third Saturday is another day in the middle of the third week
        assert(meetup(2013, Month.february, Week.third, Day.saturday) == "2013-02-16");

        // When third Sunday is some day in the middle of the third week
        assert(meetup(2013, Month.march, Week.third, Day.sunday) == "2013-03-17");

        // When third Sunday is the 21st, the last day of the third week
        assert(meetup(2013, Month.april, Week.third, Day.sunday) == "2013-04-21");

        // When fourth Monday is some day in the middle of the fourth week
        assert(meetup(2013, Month.march, Week.fourth, Day.monday) == "2013-03-25");

        // When fourth Monday is the 22nd, the first day of the fourth week
        assert(meetup(2013, Month.april, Week.fourth, Day.monday) == "2013-04-22");

        // When fourth Tuesday is the 28th, the last day of the fourth week
        assert(meetup(2013, Month.may, Week.fourth, Day.tuesday) == "2013-05-28");

        // When fourth Tuesday is some day in the middle of the fourth week
        assert(meetup(2013, Month.june, Week.fourth, Day.tuesday) == "2013-06-25");

        // When fourth Wednesday is some day in the middle of the fourth week
        assert(meetup(2013, Month.july, Week.fourth, Day.wednesday) == "2013-07-24");

        // When fourth Wednesday is the 28th, the last day of the fourth week
        assert(meetup(2013, Month.august, Week.fourth, Day.wednesday) == "2013-08-28");

        // When fourth Thursday is some day in the middle of the fourth week
        assert(meetup(2013, Month.september, Week.fourth, Day.thursday) == "2013-09-26");

        // When fourth Thursday is another day in the middle of the fourth week
        assert(meetup(2013, Month.october, Week.fourth, Day.thursday) == "2013-10-24");

        // When fourth Friday is the 22nd, the first day of the fourth week
        assert(meetup(2013, Month.november, Week.fourth, Day.friday) == "2013-11-22");

        // When fourth Friday is some day in the middle of the fourth week
        assert(meetup(2013, Month.december, Week.fourth, Day.friday) == "2013-12-27");

        // When fourth Saturday is some day in the middle of the fourth week
        assert(meetup(2013, Month.january, Week.fourth, Day.saturday) == "2013-01-26");

        // When fourth Saturday is another day in the middle of the fourth week
        assert(meetup(2013, Month.february, Week.fourth, Day.saturday) == "2013-02-23");

        // When fourth Sunday is some day in the middle of the fourth week
        assert(meetup(2013, Month.march, Week.fourth, Day.sunday) == "2013-03-24");

        // When fourth Sunday is the 28th, the last day of the fourth week
        assert(meetup(2013, Month.april, Week.fourth, Day.sunday) == "2013-04-28");

        // Last Monday in a month with four Mondays
        assert(meetup(2013, Month.march, Week.last, Day.monday) == "2013-03-25");

        // Last Monday in a month with five Mondays
        assert(meetup(2013, Month.april, Week.last, Day.monday) == "2013-04-29");

        // Last Tuesday in a month with four Tuesdays
        assert(meetup(2013, Month.may, Week.last, Day.tuesday) == "2013-05-28");

        // Last Tuesday in another month with four Tuesdays
        assert(meetup(2013, Month.june, Week.last, Day.tuesday) == "2013-06-25");

        // Last Wednesday in a month with five Wednesdays
        assert(meetup(2013, Month.july, Week.last, Day.wednesday) == "2013-07-31");

        // Last Wednesday in a month with four Wednesdays
        assert(meetup(2013, Month.august, Week.last, Day.wednesday) == "2013-08-28");

        // Last Thursday in a month with four Thursdays
        assert(meetup(2013, Month.september, Week.last, Day.thursday) == "2013-09-26");

        // Last Thursday in a month with five Thursdays
        assert(meetup(2013, Month.october, Week.last, Day.thursday) == "2013-10-31");

        // Last Friday in a month with five Fridays
        assert(meetup(2013, Month.november, Week.last, Day.friday) == "2013-11-29");

        // Last Friday in a month with four Fridays
        assert(meetup(2013, Month.december, Week.last, Day.friday) == "2013-12-27");

        // Last Saturday in a month with four Saturdays
        assert(meetup(2013, Month.january, Week.last, Day.saturday) == "2013-01-26");

        // Last Saturday in another month with four Saturdays
        assert(meetup(2013, Month.february, Week.last, Day.saturday) == "2013-02-23");

        // Last Sunday in a month with five Sundays
        assert(meetup(2013, Month.march, Week.last, Day.sunday) == "2013-03-31");

        // Last Sunday in a month with four Sundays
        assert(meetup(2013, Month.april, Week.last, Day.sunday) == "2013-04-28");

        // When last Wednesday in February in a leap year is the 29th
        assert(meetup(2012, Month.february, Week.last, Day.wednesday) == "2012-02-29");

        // Last Wednesday in December that is also the last day of the year
        assert(meetup(2014, Month.december, Week.last, Day.wednesday) == "2014-12-31");

        // When last Sunday in February in a non-leap year is not the 29th
        assert(meetup(2015, Month.february, Week.last, Day.sunday) == "2015-02-22");

        // When first Friday is the 7th, the last day of the first week
        assert(meetup(2012, Month.december, Week.first, Day.friday) == "2012-12-07");
    }
}
