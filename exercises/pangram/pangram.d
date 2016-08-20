module pangram;

unittest
{
    immutable bool all_test_enabled = false;

    assert(!isPangram(""));

    static if (all_tests_enabled) {
    assert(isPangram("the quick brown fox jumps over the lazy dog"));
    // missing x
    assert(!isPangram("a quick movement of the enemy will jeopardize five gunboats"));
    assert(!isPangram("the quick brown fish jumps over the lazy dog"));
    // test underscores
    assert(isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"));
    // test pangram with numbers
    assert(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"));
    // test missing letters replaced by numbers
    assert(!isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));
    // test pangram with mixed case and punctuation
    assert(isPangram("\"Five quacking Zephyrs jolt my wax bed\""));
    // pangram with non-ascii characters
    assert(isPangram("Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich"));
    }
}

void main () {}
