module triangle;

enum TriangleType
{
    equilateral,
    isosceles,
    scalene
}

TriangleType kind(double a, double b, double c)
{
    // Implement this function
}

unittest
{
    import std.exception : assertThrown;

    immutable int allTestsEnabled = 0;

    // equilateral triangle - all sides are equal
    {
        assert(TriangleType.equilateral == kind(2, 2, 2));
    }

    static if (allTestsEnabled)
    {
        // equilateral triangle - any side is uneven
        {
            assert(TriangleType.equilateral != kind(2, 3, 2));
        }

        // equilateral triangle - no sides are equal
        {
            assert(TriangleType.equilateral != kind(5, 4, 6));
        }
        
        // equilateral triangle - all zero sides is not a triangle
        {
            assertThrown(kind(0, 0, 0));
        }
        
        // equilateral triangle - sides may be floats
        {
            assert(TriangleType.equilateral == kind(0.5, 0.5, 0.5));
        }

        // isosceles triangle - last two sides are equal
        {
            assert(TriangleType.isosceles == kind(3, 4, 4));
        }

        // isosceles triangle - first and last sides are equal
        {
            assert(TriangleType.isosceles == kind(4, 3, 4));
        }

        //  isosceles triangle - no sides are equal
        {
            assert(TriangleType.isosceles != kind(2, 3, 4));
        }

        // isosceles triangle - first triangle inequality violation
        {
            assertThrown(kind(1, 1, 3));
        }

        // isosceles triangle - second triangle inequality violation
        {
            assertThrown(kind(1, 3, 1));
        }

        // isosceles triangle - third triangle inequality violation
        {
            assertThrown(kind(3, 1, 1));
        }

        // isosceles triangle - sides may be floats
        {
            assert(TriangleType.isosceles == kind(0.5, 0.4, 0.5));
        }

        // scalene triangle - no sides are equal
        {
            assert(TriangleType.scalene == kind(5, 4, 6));
        }

        // scalene triangle - all sides are equal
        {
            assert(TriangleType.scalene != kind(4, 4, 4));
        }

        // scalene triangle - first and second sides are equal
        {
            assert(TriangleType.scalene != kind(4, 4, 3));
        }

        // scalene triangle - first and third sides are equal
        {
            assert(TriangleType.scalene != kind(3, 4, 3));
        }

        // scalene triangle - second and third sides are equal
        {
            assert(TriangleType.scalene != kind(4, 3, 3));
        }

        // scalene triangle - may not volate triangle inequality
        {
            assertThrown(kind(7, 3, 2));
        }

        // scalene triangle - sides may be floats
        {
            assert(TriangleType.scalene == kind(0.5, 0.4, 0.6));
        }
    }

}
