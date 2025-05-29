module intergalactic_transmission;

pure ubyte parity(ubyte data)
{
    ubyte result = 0;
    while (data != 0) {
        data ^= (data & (-data));
        result = cast(ubyte)(1 - result);
    }
    return result;
}

pure ubyte[] transmitSequence(immutable ubyte[] message)
{
    auto result = new ubyte[ (message.length * 8 + 6) / 7 ];
    int messageIndex = 0;
    int resultIndex = 0;
    int pendingCount = 0;
    uint pendingData = 0;

    while (resultIndex < result.length) {
        if (pendingCount != 7) {
            if (messageIndex < message.length) {
                pendingData = (pendingData << 8) | message[messageIndex++];
                pendingCount += 8;
            } else {
                pendingData <<= (7 - pendingCount);
                pendingCount = 7;
            }
        }

        pendingCount -= 7;
        ubyte data = (pendingData >> pendingCount) & 127;
        result[resultIndex++] = cast(ubyte)((data << 1) | parity(data));
    }

    return result;
}

pure ubyte[] decodeMessage(immutable ubyte[] message)
{
    auto result = new ubyte[ message.length * 7 / 8 ];
    int resultIndex = 0;
    int pendingCount = 0;
    uint pendingData = 0;

    foreach (ubyte data; message) {
        if (parity(data)) {
            throw new Exception("wrong parity");
        }

        pendingData = (pendingData << 7) | (data >> 1);
        pendingCount += 7;

        if (pendingCount >= 8) {
            pendingCount -= 8;
            result[resultIndex++] = cast(ubyte)(pendingData >> pendingCount);
        }
    }

    return result;
}
