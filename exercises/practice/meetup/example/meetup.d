module meetup;

import std.datetime.date;
import std.format;

enum Week {
    first,
    second,
    third,
    fourth,
    teenth,
    last,
}

pure bool isLeap(ushort year)
{
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
}

pure int daysInMonth(ushort year, Month month)
{
    switch (month)
    {
        case Month.jan: return 31;
        case Month.feb: return isLeap(year) ? 29 : 28;
        case Month.mar: return 31;
        case Month.apr: return 30;
        case Month.may: return 31;
        case Month.jun: return 30;
        case Month.jul: return 31;
        case Month.aug: return 31;
        case Month.sep: return 30;
        case Month.oct: return 31;
        case Month.nov: return 30;
        case Month.dec: return 31;
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
        case Month.jan: return 307; // offset from the end of February of previous year
        case Month.feb: return 338;
        case Month.mar: return 1;
        case Month.apr: return 32;
        case Month.may: return 62;
        case Month.jun: return 93;
        case Month.jul: return 123;
        case Month.aug: return 154;
        case Month.sep: return 185;
        case Month.oct: return 215;
        case Month.nov: return 246;
        case Month.dec: return 276;
        default: assert(0);
    }
}

pure DayOfWeek dayOfWeek(ushort year, Month month, int dayOfMonth)
{
    int y = (month == Month.jan || month == Month.feb) ? year - 1 : year;
    return cast(DayOfWeek)((y + (y / 4) - (y / 100) + (y / 400) + monthOffset(month) + dayOfMonth + 1) % 7);
}

pure int meetupDayOfMonth(ushort year, Month month, Week week, DayOfWeek day)
{
    auto dayOfMonth = weekConcludes(year, month, week);
    auto last = cast(int)dayOfWeek(year, month, dayOfMonth);
    auto required = cast(int)day;
    auto adjustment = (last < required) ? 7 : 0;
    return dayOfMonth + required - (last + adjustment);
}

pure string meetup(ushort year, Month month, Week week, DayOfWeek day)
{
    auto dayOfMonth = meetupDayOfMonth(year, month, week, day);
    return format("%04d-%02d-%02d", year, cast(int)month, dayOfMonth);
}
