module matching_brackets;

unittest
{
    immutable int allTestsEnabled = 0;

    // paired square brackets
    assert(isPaired("[]"));

    static if (allTestsEnabled)
    {
        // empty string
        assert(isPaired(""));

        // unpaired brackets
        assert(!isPaired("[["));

        // wrong ordered brackets
        assert(!isPaired("}{"));

        // wrong closing bracket
        assert(!isPaired("{]"));

        // paired with whitespace
        assert(isPaired("{ }"));

        // partially paired brackets
        assert(!isPaired("{[])"));

        // simple nested brackets
        assert(isPaired("{[]}"));

        // several paired brackets
        assert(isPaired("{}[]"));

        // paired and nested brackets
        assert(isPaired("([{}({}[])])"));

        // unopened closing brackets
        assert(!isPaired("{[)][]}"));

        // unpaired and nested brackets
        assert(!isPaired("([{])"));

        // paired and wrong nested brackets
        assert(!isPaired("[({]})"));

        // paired and incomplete brackets
        assert(!isPaired("{}["));

        // too many closing brackets
        assert(!isPaired("[]]"));

        // math expression
        assert(isPaired("(((185 + 223.85) * 15) - 543)/2"));

        // complex latex expression
        assert(isPaired(
                "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"));
    }
}
