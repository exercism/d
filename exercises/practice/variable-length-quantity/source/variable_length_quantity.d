module variable_length_quantity;

pure ubyte[] encode(immutable uint[] integers)
{
    // implement this function
}

pure uint[] decode(immutable ubyte[] integers)
{
    // implement this function
}

unittest
{
    import std.algorithm.comparison : equal;
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Encode - zero
    {
        immutable uint[] integers = [ 0x0 ];
        immutable ubyte[] expected = [ 0x0 ];
        assert(equal(encode(integers), expected));
    }

    static if (allTestsEnabled)
    {
        // Encode - arbitrary single byte
        {
            immutable uint[] integers = [ 0x40 ];
            immutable ubyte[] expected = [ 0x40 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - asymmetric single byte
        {
            immutable uint[] integers = [ 0x53 ];
            immutable ubyte[] expected = [ 0x53 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - largest single byte
        {
            immutable uint[] integers = [ 0x7f ];
            immutable ubyte[] expected = [ 0x7f ];
            assert(equal(encode(integers), expected));
        }

        // Encode - smallest double byte
        {
            immutable uint[] integers = [ 0x80 ];
            immutable ubyte[] expected = [ 0x81, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - arbitrary double byte
        {
            immutable uint[] integers = [ 0x2000 ];
            immutable ubyte[] expected = [ 0xc0, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - asymmetric double byte
        {
            immutable uint[] integers = [ 0xad ];
            immutable ubyte[] expected = [ 0x81, 0x2d ];
            assert(equal(encode(integers), expected));
        }

        // Encode - largest double byte
        {
            immutable uint[] integers = [ 0x3fff ];
            immutable ubyte[] expected = [ 0xff, 0x7f ];
            assert(equal(encode(integers), expected));
        }

        // Encode - smallest triple byte
        {
            immutable uint[] integers = [ 0x4000 ];
            immutable ubyte[] expected = [ 0x81, 0x80, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - arbitrary triple byte
        {
            immutable uint[] integers = [ 0x100000 ];
            immutable ubyte[] expected = [ 0xc0, 0x80, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - asymmetric triple byte
        {
            immutable uint[] integers = [ 0x1d59c ];
            immutable ubyte[] expected = [ 0x87, 0xab, 0x1c ];
            assert(equal(encode(integers), expected));
        }

        // Encode - largest triple byte
        {
            immutable uint[] integers = [ 0x1fffff ];
            immutable ubyte[] expected = [ 0xff, 0xff, 0x7f ];
            assert(equal(encode(integers), expected));
        }

        // Encode - smallest quadruple byte
        {
            immutable uint[] integers = [ 0x200000 ];
            immutable ubyte[] expected = [ 0x81, 0x80, 0x80, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - arbitrary quadruple byte
        {
            immutable uint[] integers = [ 0x8000000 ];
            immutable ubyte[] expected = [ 0xc0, 0x80, 0x80, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - asymmetric quadruple byte
        {
            immutable uint[] integers = [ 0x357704 ];
            immutable ubyte[] expected = [ 0x81, 0xd5, 0xee, 0x4 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - largest quadruple byte
        {
            immutable uint[] integers = [ 0xfffffff ];
            immutable ubyte[] expected = [ 0xff, 0xff, 0xff, 0x7f ];
            assert(equal(encode(integers), expected));
        }

        // Encode - smallest quintuple byte
        {
            immutable uint[] integers = [ 0x10000000 ];
            immutable ubyte[] expected = [ 0x81, 0x80, 0x80, 0x80, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - arbitrary quintuple byte
        {
            immutable uint[] integers = [ 0xff000000 ];
            immutable ubyte[] expected = [ 0x8f, 0xf8, 0x80, 0x80, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - asymmetric quintuple byte
        {
            immutable uint[] integers = [ 0x86656105 ];
            immutable ubyte[] expected = [ 0x88, 0xb3, 0x95, 0xc2, 0x5 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - maximum 32-bit integer input
        {
            immutable uint[] integers = [ 0xffffffff ];
            immutable ubyte[] expected = [ 0x8f, 0xff, 0xff, 0xff, 0x7f ];
            assert(equal(encode(integers), expected));
        }

        // Encode - two single-byte values
        {
            immutable uint[] integers = [ 0x40, 0x7f ];
            immutable ubyte[] expected = [ 0x40, 0x7f ];
            assert(equal(encode(integers), expected));
        }

        // Encode - two multi-byte values
        {
            immutable uint[] integers = [ 0x4000, 0x123456 ];
            immutable ubyte[] expected = [ 0x81, 0x80, 0x0, 0xc8, 0xe8, 0x56 ];
            assert(equal(encode(integers), expected));
        }

        // Encode - many multi-byte values
        {
            immutable uint[] integers = [ 0x2000, 0x123456, 0xfffffff, 0x0, 0x3fff, 0x4000 ];
            immutable ubyte[] expected = [ 0xc0, 0x0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x0, 0xff, 0x7f, 0x81, 0x80, 0x0 ];
            assert(equal(encode(integers), expected));
        }

        // Decode - one byte
        {
            immutable ubyte[] integers = [ 0x7f ];
            immutable uint[] expected = [ 0x7f ];
            assert(equal(decode(integers), expected));
        }

        // Decode - two bytes
        {
            immutable ubyte[] integers = [ 0xc0, 0x0 ];
            immutable uint[] expected = [ 0x2000 ];
            assert(equal(decode(integers), expected));
        }

        // Decode - three bytes
        {
            immutable ubyte[] integers = [ 0xff, 0xff, 0x7f ];
            immutable uint[] expected = [ 0x1fffff ];
            assert(equal(decode(integers), expected));
        }

        // Decode - four bytes
        {
            immutable ubyte[] integers = [ 0x81, 0x80, 0x80, 0x0 ];
            immutable uint[] expected = [ 0x200000 ];
            assert(equal(decode(integers), expected));
        }

        // Decode - maximum 32-bit integer
        {
            immutable ubyte[] integers = [ 0x8f, 0xff, 0xff, 0xff, 0x7f ];
            immutable uint[] expected = [ 0xffffffff ];
            assert(equal(decode(integers), expected));
        }

        // Decode - incomplete sequence causes error
        {
            immutable ubyte[] integers = [ 0xff ];
            assertThrown(decode(integers));
        }

        // Decode - incomplete sequence causes error, even if value is zero
        {
            immutable ubyte[] integers = [ 0x80 ];
            assertThrown(decode(integers));
        }

        // Decode - multiple values
        {
            immutable ubyte[] integers = [ 0xc0, 0x0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0x0, 0xff, 0x7f, 0x81, 0x80, 0x0 ];
            immutable uint[] expected = [ 0x2000, 0x123456, 0xfffffff, 0x0, 0x3fff, 0x4000 ];
            assert(equal(decode(integers), expected));
        }
    }
}
