module triangle;

enum TriangleType
{
    equilateral,
    isosceles,
    scalene
};

/**
 * Return what kind of triagle that is.
 */
TriangleType kind(double a, double b, double c)
{
    // check the triangle inequality
    if (a + b <= c || a + c <= b || c + b <= a)
    {
        throw new Exception("Segment lengths do not satisfy triangle inequality.");
    }

    if (a == b && b == c)
        return TriangleType.equilateral;
    else if (a == b || a == c || b == c)
        return TriangleType.isosceles;
    else
        return TriangleType.scalene;
}
