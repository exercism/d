pure int squareRoot(immutable int radicand)
{
    int square = 0;
    while (square * square != radicand)
    {
        square++;
    }

    return square;
}
