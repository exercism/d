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
