module knapsack;

struct Item {
    uint weight;
    uint value;
}

uint maximumValue(Item[] items, uint maximumWeight)
{
    // implement this function
}

unittest
{
    immutable int allTestsEnabled = 0;

    // No items
    {
        Item[] items = [
        ];
        assert(maximumValue(items, 100) == 0);
    }

    static if (allTestsEnabled)
    {
        // One item, too heavy
        {
            Item[] items = [
                Item(weight: 100, value: 1),
            ];
            assert(maximumValue(items, 10) == 0);
        }

        // Five items (cannot be greedy by weight)
        {
            Item[] items = [
                Item(weight: 2, value: 5),
                Item(weight: 2, value: 5),
                Item(weight: 2, value: 5),
                Item(weight: 2, value: 5),
                Item(weight: 10, value: 21),
            ];
            assert(maximumValue(items, 10) == 21);
        }

        // Five items (cannot be greedy by value)
        {
            Item[] items = [
                Item(weight: 2, value: 20),
                Item(weight: 2, value: 20),
                Item(weight: 2, value: 20),
                Item(weight: 2, value: 20),
                Item(weight: 10, value: 50),
            ];
            assert(maximumValue(items, 10) == 80);
        }

        // Example knapsack
        {
            Item[] items = [
                Item(weight: 5, value: 10),
                Item(weight: 4, value: 40),
                Item(weight: 6, value: 30),
                Item(weight: 4, value: 50),
            ];
            assert(maximumValue(items, 10) == 90);
        }

        // 8 items
        {
            Item[] items = [
                Item(weight: 25, value: 350),
                Item(weight: 35, value: 400),
                Item(weight: 45, value: 450),
                Item(weight: 5, value: 20),
                Item(weight: 25, value: 70),
                Item(weight: 3, value: 8),
                Item(weight: 2, value: 5),
                Item(weight: 2, value: 5),
            ];
            assert(maximumValue(items, 104) == 900);
        }

        // 15 items
        {
            Item[] items = [
                Item(weight: 70, value: 135),
                Item(weight: 73, value: 139),
                Item(weight: 77, value: 149),
                Item(weight: 80, value: 150),
                Item(weight: 82, value: 156),
                Item(weight: 87, value: 163),
                Item(weight: 90, value: 173),
                Item(weight: 94, value: 184),
                Item(weight: 98, value: 192),
                Item(weight: 106, value: 201),
                Item(weight: 110, value: 210),
                Item(weight: 113, value: 214),
                Item(weight: 115, value: 221),
                Item(weight: 118, value: 229),
                Item(weight: 120, value: 240),
            ];
            assert(maximumValue(items, 750) == 1458);
        }
    }
}
