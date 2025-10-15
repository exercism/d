module meetup;

import std.datetime.date;

enum Week {
    first,
    second,
    third,
    fourth,
    teenth,
    last,
}

pure string meetup(ushort year, Month month, Week week, DayOfWeek day)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // When teenth Monday is the 13th, the first day of the teenth week
    assert(meetup(2013, Month.may, Week.teenth, DayOfWeek.mon) == "2013-05-13");

    static if (allTestsEnabled)
    {
        // When teenth Monday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.aug, Week.teenth, DayOfWeek.mon) == "2013-08-19");

        // When teenth Monday is some day in the middle of the teenth week
        assert(meetup(2013, Month.sep, Week.teenth, DayOfWeek.mon) == "2013-09-16");

        // When teenth Tuesday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.mar, Week.teenth, DayOfWeek.tue) == "2013-03-19");

        // When teenth Tuesday is some day in the middle of the teenth week
        assert(meetup(2013, Month.apr, Week.teenth, DayOfWeek.tue) == "2013-04-16");

        // When teenth Tuesday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.aug, Week.teenth, DayOfWeek.tue) == "2013-08-13");

        // When teenth Wednesday is some day in the middle of the teenth week
        assert(meetup(2013, Month.jan, Week.teenth, DayOfWeek.wed) == "2013-01-16");

        // When teenth Wednesday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.feb, Week.teenth, DayOfWeek.wed) == "2013-02-13");

        // When teenth Wednesday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.jun, Week.teenth, DayOfWeek.wed) == "2013-06-19");

        // When teenth Thursday is some day in the middle of the teenth week
        assert(meetup(2013, Month.may, Week.teenth, DayOfWeek.thu) == "2013-05-16");

        // When teenth Thursday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.jun, Week.teenth, DayOfWeek.thu) == "2013-06-13");

        // When teenth Thursday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.sep, Week.teenth, DayOfWeek.thu) == "2013-09-19");

        // When teenth Friday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.apr, Week.teenth, DayOfWeek.fri) == "2013-04-19");

        // When teenth Friday is some day in the middle of the teenth week
        assert(meetup(2013, Month.aug, Week.teenth, DayOfWeek.fri) == "2013-08-16");

        // When teenth Friday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.sep, Week.teenth, DayOfWeek.fri) == "2013-09-13");

        // When teenth Saturday is some day in the middle of the teenth week
        assert(meetup(2013, Month.feb, Week.teenth, DayOfWeek.sat) == "2013-02-16");

        // When teenth Saturday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.apr, Week.teenth, DayOfWeek.sat) == "2013-04-13");

        // When teenth Saturday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.oct, Week.teenth, DayOfWeek.sat) == "2013-10-19");

        // When teenth Sunday is the 19th, the last day of the teenth week
        assert(meetup(2013, Month.may, Week.teenth, DayOfWeek.sun) == "2013-05-19");

        // When teenth Sunday is some day in the middle of the teenth week
        assert(meetup(2013, Month.jun, Week.teenth, DayOfWeek.sun) == "2013-06-16");

        // When teenth Sunday is the 13th, the first day of the teenth week
        assert(meetup(2013, Month.oct, Week.teenth, DayOfWeek.sun) == "2013-10-13");

        // When first Monday is some day in the middle of the first week
        assert(meetup(2013, Month.mar, Week.first, DayOfWeek.mon) == "2013-03-04");

        // When first Monday is the 1st, the first day of the first week
        assert(meetup(2013, Month.apr, Week.first, DayOfWeek.mon) == "2013-04-01");

        // When first Tuesday is the 7th, the last day of the first week
        assert(meetup(2013, Month.may, Week.first, DayOfWeek.tue) == "2013-05-07");

        // When first Tuesday is some day in the middle of the first week
        assert(meetup(2013, Month.jun, Week.first, DayOfWeek.tue) == "2013-06-04");

        // When first Wednesday is some day in the middle of the first week
        assert(meetup(2013, Month.jul, Week.first, DayOfWeek.wed) == "2013-07-03");

        // When first Wednesday is the 7th, the last day of the first week
        assert(meetup(2013, Month.aug, Week.first, DayOfWeek.wed) == "2013-08-07");

        // When first Thursday is some day in the middle of the first week
        assert(meetup(2013, Month.sep, Week.first, DayOfWeek.thu) == "2013-09-05");

        // When first Thursday is another day in the middle of the first week
        assert(meetup(2013, Month.oct, Week.first, DayOfWeek.thu) == "2013-10-03");

        // When first Friday is the 1st, the first day of the first week
        assert(meetup(2013, Month.nov, Week.first, DayOfWeek.fri) == "2013-11-01");

        // When first Friday is some day in the middle of the first week
        assert(meetup(2013, Month.dec, Week.first, DayOfWeek.fri) == "2013-12-06");

        // When first Saturday is some day in the middle of the first week
        assert(meetup(2013, Month.jan, Week.first, DayOfWeek.sat) == "2013-01-05");

        // When first Saturday is another day in the middle of the first week
        assert(meetup(2013, Month.feb, Week.first, DayOfWeek.sat) == "2013-02-02");

        // When first Sunday is some day in the middle of the first week
        assert(meetup(2013, Month.mar, Week.first, DayOfWeek.sun) == "2013-03-03");

        // When first Sunday is the 7th, the last day of the first week
        assert(meetup(2013, Month.apr, Week.first, DayOfWeek.sun) == "2013-04-07");

        // When second Monday is some day in the middle of the second week
        assert(meetup(2013, Month.mar, Week.second, DayOfWeek.mon) == "2013-03-11");

        // When second Monday is the 8th, the first day of the second week
        assert(meetup(2013, Month.apr, Week.second, DayOfWeek.mon) == "2013-04-08");

        // When second Tuesday is the 14th, the last day of the second week
        assert(meetup(2013, Month.may, Week.second, DayOfWeek.tue) == "2013-05-14");

        // When second Tuesday is some day in the middle of the second week
        assert(meetup(2013, Month.jun, Week.second, DayOfWeek.tue) == "2013-06-11");

        // When second Wednesday is some day in the middle of the second week
        assert(meetup(2013, Month.jul, Week.second, DayOfWeek.wed) == "2013-07-10");

        // When second Wednesday is the 14th, the last day of the second week
        assert(meetup(2013, Month.aug, Week.second, DayOfWeek.wed) == "2013-08-14");

        // When second Thursday is some day in the middle of the second week
        assert(meetup(2013, Month.sep, Week.second, DayOfWeek.thu) == "2013-09-12");

        // When second Thursday is another day in the middle of the second week
        assert(meetup(2013, Month.oct, Week.second, DayOfWeek.thu) == "2013-10-10");

        // When second Friday is the 8th, the first day of the second week
        assert(meetup(2013, Month.nov, Week.second, DayOfWeek.fri) == "2013-11-08");

        // When second Friday is some day in the middle of the second week
        assert(meetup(2013, Month.dec, Week.second, DayOfWeek.fri) == "2013-12-13");

        // When second Saturday is some day in the middle of the second week
        assert(meetup(2013, Month.jan, Week.second, DayOfWeek.sat) == "2013-01-12");

        // When second Saturday is another day in the middle of the second week
        assert(meetup(2013, Month.feb, Week.second, DayOfWeek.sat) == "2013-02-09");

        // When second Sunday is some day in the middle of the second week
        assert(meetup(2013, Month.mar, Week.second, DayOfWeek.sun) == "2013-03-10");

        // When second Sunday is the 14th, the last day of the second week
        assert(meetup(2013, Month.apr, Week.second, DayOfWeek.sun) == "2013-04-14");

        // When third Monday is some day in the middle of the third week
        assert(meetup(2013, Month.mar, Week.third, DayOfWeek.mon) == "2013-03-18");

        // When third Monday is the 15th, the first day of the third week
        assert(meetup(2013, Month.apr, Week.third, DayOfWeek.mon) == "2013-04-15");

        // When third Tuesday is the 21st, the last day of the third week
        assert(meetup(2013, Month.may, Week.third, DayOfWeek.tue) == "2013-05-21");

        // When third Tuesday is some day in the middle of the third week
        assert(meetup(2013, Month.jun, Week.third, DayOfWeek.tue) == "2013-06-18");

        // When third Wednesday is some day in the middle of the third week
        assert(meetup(2013, Month.jul, Week.third, DayOfWeek.wed) == "2013-07-17");

        // When third Wednesday is the 21st, the last day of the third week
        assert(meetup(2013, Month.aug, Week.third, DayOfWeek.wed) == "2013-08-21");

        // When third Thursday is some day in the middle of the third week
        assert(meetup(2013, Month.sep, Week.third, DayOfWeek.thu) == "2013-09-19");

        // When third Thursday is another day in the middle of the third week
        assert(meetup(2013, Month.oct, Week.third, DayOfWeek.thu) == "2013-10-17");

        // When third Friday is the 15th, the first day of the third week
        assert(meetup(2013, Month.nov, Week.third, DayOfWeek.fri) == "2013-11-15");

        // When third Friday is some day in the middle of the third week
        assert(meetup(2013, Month.dec, Week.third, DayOfWeek.fri) == "2013-12-20");

        // When third Saturday is some day in the middle of the third week
        assert(meetup(2013, Month.jan, Week.third, DayOfWeek.sat) == "2013-01-19");

        // When third Saturday is another day in the middle of the third week
        assert(meetup(2013, Month.feb, Week.third, DayOfWeek.sat) == "2013-02-16");

        // When third Sunday is some day in the middle of the third week
        assert(meetup(2013, Month.mar, Week.third, DayOfWeek.sun) == "2013-03-17");

        // When third Sunday is the 21st, the last day of the third week
        assert(meetup(2013, Month.apr, Week.third, DayOfWeek.sun) == "2013-04-21");

        // When fourth Monday is some day in the middle of the fourth week
        assert(meetup(2013, Month.mar, Week.fourth, DayOfWeek.mon) == "2013-03-25");

        // When fourth Monday is the 22nd, the first day of the fourth week
        assert(meetup(2013, Month.apr, Week.fourth, DayOfWeek.mon) == "2013-04-22");

        // When fourth Tuesday is the 28th, the last day of the fourth week
        assert(meetup(2013, Month.may, Week.fourth, DayOfWeek.tue) == "2013-05-28");

        // When fourth Tuesday is some day in the middle of the fourth week
        assert(meetup(2013, Month.jun, Week.fourth, DayOfWeek.tue) == "2013-06-25");

        // When fourth Wednesday is some day in the middle of the fourth week
        assert(meetup(2013, Month.jul, Week.fourth, DayOfWeek.wed) == "2013-07-24");

        // When fourth Wednesday is the 28th, the last day of the fourth week
        assert(meetup(2013, Month.aug, Week.fourth, DayOfWeek.wed) == "2013-08-28");

        // When fourth Thursday is some day in the middle of the fourth week
        assert(meetup(2013, Month.sep, Week.fourth, DayOfWeek.thu) == "2013-09-26");

        // When fourth Thursday is another day in the middle of the fourth week
        assert(meetup(2013, Month.oct, Week.fourth, DayOfWeek.thu) == "2013-10-24");

        // When fourth Friday is the 22nd, the first day of the fourth week
        assert(meetup(2013, Month.nov, Week.fourth, DayOfWeek.fri) == "2013-11-22");

        // When fourth Friday is some day in the middle of the fourth week
        assert(meetup(2013, Month.dec, Week.fourth, DayOfWeek.fri) == "2013-12-27");

        // When fourth Saturday is some day in the middle of the fourth week
        assert(meetup(2013, Month.jan, Week.fourth, DayOfWeek.sat) == "2013-01-26");

        // When fourth Saturday is another day in the middle of the fourth week
        assert(meetup(2013, Month.feb, Week.fourth, DayOfWeek.sat) == "2013-02-23");

        // When fourth Sunday is some day in the middle of the fourth week
        assert(meetup(2013, Month.mar, Week.fourth, DayOfWeek.sun) == "2013-03-24");

        // When fourth Sunday is the 28th, the last day of the fourth week
        assert(meetup(2013, Month.apr, Week.fourth, DayOfWeek.sun) == "2013-04-28");

        // Last Monday in a month with four Mondays
        assert(meetup(2013, Month.mar, Week.last, DayOfWeek.mon) == "2013-03-25");

        // Last Monday in a month with five Mondays
        assert(meetup(2013, Month.apr, Week.last, DayOfWeek.mon) == "2013-04-29");

        // Last Tuesday in a month with four Tuesdays
        assert(meetup(2013, Month.may, Week.last, DayOfWeek.tue) == "2013-05-28");

        // Last Tuesday in another month with four Tuesdays
        assert(meetup(2013, Month.jun, Week.last, DayOfWeek.tue) == "2013-06-25");

        // Last Wednesday in a month with five Wednesdays
        assert(meetup(2013, Month.jul, Week.last, DayOfWeek.wed) == "2013-07-31");

        // Last Wednesday in a month with four Wednesdays
        assert(meetup(2013, Month.aug, Week.last, DayOfWeek.wed) == "2013-08-28");

        // Last Thursday in a month with four Thursdays
        assert(meetup(2013, Month.sep, Week.last, DayOfWeek.thu) == "2013-09-26");

        // Last Thursday in a month with five Thursdays
        assert(meetup(2013, Month.oct, Week.last, DayOfWeek.thu) == "2013-10-31");

        // Last Friday in a month with five Fridays
        assert(meetup(2013, Month.nov, Week.last, DayOfWeek.fri) == "2013-11-29");

        // Last Friday in a month with four Fridays
        assert(meetup(2013, Month.dec, Week.last, DayOfWeek.fri) == "2013-12-27");

        // Last Saturday in a month with four Saturdays
        assert(meetup(2013, Month.jan, Week.last, DayOfWeek.sat) == "2013-01-26");

        // Last Saturday in another month with four Saturdays
        assert(meetup(2013, Month.feb, Week.last, DayOfWeek.sat) == "2013-02-23");

        // Last Sunday in a month with five Sundays
        assert(meetup(2013, Month.mar, Week.last, DayOfWeek.sun) == "2013-03-31");

        // Last Sunday in a month with four Sundays
        assert(meetup(2013, Month.apr, Week.last, DayOfWeek.sun) == "2013-04-28");

        // When last Wednesday in February in a leap year is the 29th
        assert(meetup(2012, Month.feb, Week.last, DayOfWeek.wed) == "2012-02-29");

        // Last Wednesday in December that is also the last day of the year
        assert(meetup(2014, Month.dec, Week.last, DayOfWeek.wed) == "2014-12-31");

        // When last Sunday in February in a non-leap year is not the 29th
        assert(meetup(2015, Month.feb, Week.last, DayOfWeek.sun) == "2015-02-22");

        // When first Friday is the 7th, the last day of the first week
        assert(meetup(2012, Month.dec, Week.first, DayOfWeek.fri) == "2012-12-07");
    }
}
