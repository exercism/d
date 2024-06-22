module knapack;

struct Item {
    uint weight;
    uint value;
}

uint maximumValue(Item[] items, uint maximumWeight)
{
    auto table = new uint[](maximumWeight + 1);
    foreach (item; items) {
        uint index = maximumWeight + 1;
        while (index > item.weight) {
            --index;
            auto value = item.value + table[index - item.weight];
            if (table[index] < value) {
                table[index] = value;
            }
        }
    }
    return table[maximumWeight];
}
