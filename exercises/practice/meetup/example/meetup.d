module meetup;

import std.format;

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

pure bool isLeap(ushort year)
{
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
}

pure int daysInMonth(ushort year, Month month)
{
    switch (month)
    {
        case Month.january: return 31;
        case Month.february: return isLeap(year) ? 29 : 28;
        case Month.march: return 31;
        case Month.april: return 30;
        case Month.may: return 31;
        case Month.june: return 30;
        case Month.july: return 31;
        case Month.august: return 31;
        case Month.september: return 30;
        case Month.october: return 31;
        case Month.november: return 30;
        case Month.december: return 31;
        default: assert(0);
    }
}

pure int weekConcludes(ushort year, Month month, Week week)
{
    switch (week)
    {
        case Week.first: return 7;
        case Week.second: return 14;
        case Week.third: return 21;
        case Week.fourth: return 28;
        case Week.teenth: return 19;
        case Week.last: return daysInMonth(year, month);
        default: assert(0);
    }
}

pure int monthOffset(Month month)
{
    switch (month)
    {
        case Month.january: return 307; // offset from the end of February of previous year
        case Month.february: return 338;
        case Month.march: return 1;
        case Month.april: return 32;
        case Month.may: return 62;
        case Month.june: return 93;
        case Month.july: return 123;
        case Month.august: return 154;
        case Month.september: return 185;
        case Month.october: return 215;
        case Month.november: return 246;
        case Month.december: return 276;
        default: assert(0);
    }
}

pure Day dayOfWeek(ushort year, Month month, int dayOfMonth)
{
    int y = (month == Month.january || month == Month.february) ? year - 1 : year;
    return cast(Day)((y + (y / 4) - (y / 100) + (y / 400) + monthOffset(month) + dayOfMonth) % 7);
}

pure int meetupDayOfMonth(ushort year, Month month, Week week, Day day)
{
    auto dayOfMonth = weekConcludes(year, month, week);
    auto last = cast(int)dayOfWeek(year, month, dayOfMonth);
    auto required = cast(int)day;
    auto adjustment = (last < required) ? 7 : 0;
    return dayOfMonth + required - (last + adjustment);
}

pure string meetup(ushort year, Month month, Week week, Day day)
{
    auto dayOfMonth = meetupDayOfMonth(year, month, week, day);
    return format("%04d-%02d-%02d", year, cast(int)month + 1, dayOfMonth);
}
