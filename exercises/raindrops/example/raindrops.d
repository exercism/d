module raindrops;

import std.array : appender;
import std.format : formattedWrite;

string convert(int n) {
    auto builder = appender!string();
    if (isPling(n) || isPlang(n) || isPlong(n)) {
        if (isPling(n)) {
            builder.put("Pling");
        }
        if (isPlang(n)) {
            builder.put("Plang");
        }
        if (isPlong(n)) {
            builder.put("Plong");
        }
    } else {
        builder.formattedWrite("%s", n);
    }

    return builder.data;
}

private bool isPling(int n) {
    return n % 3 == 0;
}

private bool isPlang(int n) {
    return n % 5 == 0;
}

private bool isPlong(int n) {
    return n % 7 == 0;
}

unittest {
    assert(convert(1) == "1");
    assert(convert(3) == "Pling");
    assert(convert(5) == "Plang");
    assert(convert(7) == "Plong");
    assert(convert(6) == "Pling");
    assert(convert(9) == "Pling");
    assert(convert(10) == "Plang");
    assert(convert(14) == "Plong");
    assert(convert(15) == "PlingPlang");
    assert(convert(21) == "PlingPlong");
    assert(convert(25) == "Plang");
    assert(convert(35) == "PlangPlong");
    assert(convert(49) == "Plong");
    assert(convert(52) == "52");
    assert(convert(105) == "PlingPlangPlong");
}

void main () {}
