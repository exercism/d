module intergalactic_transmission;

pure ubyte[] transmitSequence(immutable ubyte[] message)
{
    // implement this function
}

pure ubyte[] decodeMessage(immutable ubyte[] message)
{
    // implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // Calculate transmit sequences - empty message
    {
        immutable ubyte[] message = [];
        ubyte[] expected = [];
        assert(transmitSequence(message) == expected);
    }

    static if (allTestsEnabled)
    {
        // Calculate transmit sequences - 0x00 is transmitted as 0x0000
        {
            immutable ubyte[] message = [0x00];
            ubyte[] expected = [0x00, 0x00];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - 0x02 is transmitted as 0x0300
        {
            immutable ubyte[] message = [0x02];
            ubyte[] expected = [0x03, 0x00];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - 0x06 is transmitted as 0x0600
        {
            immutable ubyte[] message = [0x06];
            ubyte[] expected = [0x06, 0x00];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - 0x05 is transmitted as 0x0581
        {
            immutable ubyte[] message = [0x05];
            ubyte[] expected = [0x05, 0x81];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - 0x29 is transmitted as 0x2881
        {
            immutable ubyte[] message = [0x29];
            ubyte[] expected = [0x28, 0x81];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - 0xc001c0de is transmitted as 0xc000711be1
        {
            immutable ubyte[] message = [0xc0, 0x01, 0xc0, 0xde];
            ubyte[] expected = [0xc0, 0x00, 0x71, 0x1b, 0xe1];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - six byte message
        {
            immutable ubyte[] message = [0x47, 0x72, 0x65, 0x61, 0x74, 0x21];
            ubyte[] expected = [0x47, 0xb8, 0x99, 0xac, 0x17, 0xa0, 0x84];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - seven byte message
        {
            immutable ubyte[] message = [0x47, 0x72, 0x65, 0x61, 0x74, 0x31, 0x21];
            ubyte[] expected = [0x47, 0xb8, 0x99, 0xac, 0x17, 0xa0, 0xc5, 0x42];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - eight byte message
        {
            immutable ubyte[] message = [0xc0, 0x01, 0x13, 0x37, 0xc0, 0xde, 0x21, 0x21];
            ubyte[] expected = [0xc0, 0x00, 0x44, 0x66, 0x7d, 0x06, 0x78, 0x42, 0x21, 0x81];
            assert(transmitSequence(message) == expected);
        }

        // Calculate transmit sequences - twenty byte message
        {
            immutable ubyte[] message = [0x45, 0x78, 0x65, 0x72, 0x63, 0x69, 0x73, 0x6d, 0x20, 0x69, 0x73, 0x20, 0x61, 0x77, 0x65, 0x73, 0x6f, 0x6d, 0x65, 0x21];
            ubyte[] expected = [0x44, 0xbd, 0x18, 0xaf, 0x27, 0x1b, 0xa5, 0xe7, 0x6c, 0x90, 0x1b, 0x2e, 0x33, 0x03, 0x84, 0xee, 0x65, 0xb8, 0xdb, 0xed, 0xd7, 0x28, 0x84];
            assert(transmitSequence(message) == expected);
        }

        // Decode received messages - empty message
        {
            immutable ubyte[] message = [];
            ubyte[] expected = [];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - zero message
        {
            immutable ubyte[] message = [0x00, 0x00];
            ubyte[] expected = [0x00];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - 0x0300 is decoded to 0x02
        {
            immutable ubyte[] message = [0x03, 0x00];
            ubyte[] expected = [0x02];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - 0x0581 is decoded to 0x05
        {
            immutable ubyte[] message = [0x05, 0x81];
            ubyte[] expected = [0x05];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - 0x2881 is decoded to 0x29
        {
            immutable ubyte[] message = [0x28, 0x81];
            ubyte[] expected = [0x29];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - first byte has wrong parity
        {
            immutable ubyte[] message = [0x07, 0x00];
            assertThrown(decodeMessage(message));
        }

        // Decode received messages - second byte has wrong parity
        {
            immutable ubyte[] message = [0x03, 0x68];
            assertThrown(decodeMessage(message));
        }

        // Decode received messages - 0xcf4b00 is decoded to 0xce94
        {
            immutable ubyte[] message = [0xcf, 0x4b, 0x00];
            ubyte[] expected = [0xce, 0x94];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - 0xe2566500 is decoded to 0xe2ad90
        {
            immutable ubyte[] message = [0xe2, 0x56, 0x65, 0x00];
            ubyte[] expected = [0xe2, 0xad, 0x90];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - six byte message
        {
            immutable ubyte[] message = [0x47, 0xb8, 0x99, 0xac, 0x17, 0xa0, 0x84];
            ubyte[] expected = [0x47, 0x72, 0x65, 0x61, 0x74, 0x21];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - seven byte message
        {
            immutable ubyte[] message = [0x47, 0xb8, 0x99, 0xac, 0x17, 0xa0, 0xc5, 0x42];
            ubyte[] expected = [0x47, 0x72, 0x65, 0x61, 0x74, 0x31, 0x21];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - last byte has wrong parity
        {
            immutable ubyte[] message = [0x47, 0xb8, 0x99, 0xac, 0x17, 0xa0, 0xc5, 0x43];
            assertThrown(decodeMessage(message));
        }

        // Decode received messages - eight byte message
        {
            immutable ubyte[] message = [0xc0, 0x00, 0x44, 0x66, 0x7d, 0x06, 0x78, 0x42, 0x21, 0x81];
            ubyte[] expected = [0xc0, 0x01, 0x13, 0x37, 0xc0, 0xde, 0x21, 0x21];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - twenty byte message
        {
            immutable ubyte[] message = [0x44, 0xbd, 0x18, 0xaf, 0x27, 0x1b, 0xa5, 0xe7, 0x6c, 0x90, 0x1b, 0x2e, 0x33, 0x03, 0x84, 0xee, 0x65, 0xb8, 0xdb, 0xed, 0xd7, 0x28, 0x84];
            ubyte[] expected = [0x45, 0x78, 0x65, 0x72, 0x63, 0x69, 0x73, 0x6d, 0x20, 0x69, 0x73, 0x20, 0x61, 0x77, 0x65, 0x73, 0x6f, 0x6d, 0x65, 0x21];
            assert(decodeMessage(message) == expected);
        }

        // Decode received messages - wrong parity on 16th byte
        {
            immutable ubyte[] message = [0x44, 0xbd, 0x18, 0xaf, 0x27, 0x1b, 0xa5, 0xe7, 0x6c, 0x90, 0x1b, 0x2e, 0x33, 0x03, 0x84, 0xef, 0x65, 0xb8, 0xdb, 0xed, 0xd7, 0x28, 0x84];
            assertThrown(decodeMessage(message));
        }
    }
}
