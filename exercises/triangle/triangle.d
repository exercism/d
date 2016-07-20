
module triangle;

import std.stdio;
import std.exception;


unittest
{

immutable int all_tests_enabled = 0;

// equilateral_triangles_have_equal_sides
{
	assert(TriangleType.equilateral == kind(2, 2, 2));
}

static if (all_tests_enabled)
{
// larger_equilateral_triangles_also_have_equal_sides
{
	assert(TriangleType.equilateral == kind(10, 10, 10));
}

// isosceles_triangles_have_last_two_sides_equal
{
	assert(TriangleType.isosceles == kind(3, 4, 4));
}

// isosceles_triangles_have_first_and_last_sides_equal
{
	assert(TriangleType.isosceles == kind(4, 3, 4));
}

// isosceles_triangles_have_first_two_sides_equal
{
	assert(TriangleType.isosceles == kind(4, 4, 3));
}

// isosceles_triangles_have_in_fact_exactly_two_sides_equal
{
	assert(TriangleType.isosceles == kind(10, 10, 2));
}

// scalene_triangles_have_no_equal_sides
{
	assert(TriangleType.scalene == kind(3, 4, 5));
}

// scalene_triangles_have_no_equal_sides_at_a_larger_scale_too
{
	assert(TriangleType.scalene == kind(10, 11, 12));
}

// scalene_triangles_have_no_equal_sides_in_descending_order_either
{
	assert(TriangleType.scalene == kind(5, 4, 2));
}

// very_small_triangles_are_legal
{
	assert(TriangleType.scalene == kind(0.4, 0.6, 0.3));
}

// triangles_with_no_size_are_illegal
{
	assertThrown(kind(0, 0, 0));
}

// triangles_with_negative_sides_are_illegal
{
	assertThrown(kind(3, 4, -5));
}

// triangles_violating_triangle_inequality_are_illegal
{
	assertThrown(kind(1, 1, 3));
}

// larger_triangles_violating_triangle_inequality_are_illegal
{
	assertThrown(kind(7, 3, 2));
}

}

}

void main ()
{
}

