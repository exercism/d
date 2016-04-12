import std.stdio;

import roman;

void main() {
    assert(1.toRoman == "I");
    assert(2.toRoman == "II");
    assert(3.toRoman == "III");
    assert(4.toRoman == "IV");
    assert(5.toRoman == "V");
    assert(6.toRoman == "VI");
    assert(9.toRoman == "IX");
    assert(27.toRoman == "XXVII");
    assert(48.toRoman == "XLVIII");
    assert(59.toRoman == "LIX");
    assert(93.toRoman == "XCIII");
    assert(141.toRoman == "CXLI");
    assert(163.toRoman == "CLXIII");
    assert(402.toRoman == "CDII");
    assert(575.toRoman == "DLXXV");
    assert(911.toRoman == "CMXI");
    assert(1024.toRoman == "MXXIV");
    assert(3000.toRoman == "MMM");

    writeln("All tests passed!");
}
