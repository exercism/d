module rectangles;

import std.range;

// Returns the number of rectangles in the ASCII diagram `strings`.
pure int rectangles(immutable string[] strings)
{
    if (strings.length == 0 || strings[0].length == 0)
    {
        return 0;
    }

    size_t rows = strings.length;
    size_t columns = strings[0].length;
    int count = 0;
    foreach (top; iota(rows))
    {
        foreach (left; iota(columns))
        {
            auto top_left = strings[top][left];
            if (top_left != '+')
            {
                continue;
            }

            foreach (bottom; iota(top + 1, rows))
            {
                auto bottom_left = strings[bottom][left];
                if (bottom_left != '+')
                {
                    if (bottom_left != '|')
                    {
                        break;
                    }

                    continue;
                }

                foreach (right; iota(left + 1, columns))
                {
                    auto top_right = strings[top][right];
                    auto bottom_right = strings[bottom][right];
                    if (top_right != '+' || bottom_right != '+') {
                        if ((top_right != '+' && top_right != '-') || (bottom_right != '+' && bottom_right != '-'))
                        {
                            break;
                        }

                        continue;
                    }

                    count += 1;
                    foreach (row; iota(top + 1, bottom))
                    {
                        auto row_right = strings[row][right];
                        if (row_right != '+' && row_right != '|')
                        {
                            count -= 1;
                            break;
                        }
                    }
                }
            }
        }
    }
    return count;
}
