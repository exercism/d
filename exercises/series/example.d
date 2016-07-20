
module series;

import std.stdio;
import std.exception;
import std.algorithm : equal;
import std.ascii : isDigit;
import std.string;
import std.math : floor;
import std.conv : to;


/*ulong combinationsOfK (ulong n, ulong k)
{
	if (k > n) return 0;
	if (k * 2 > n) k = n-k;
	if (k == 0) return 1;

	ulong result = n;
	for (ulong i = 2; i <= k; ++i )
	{
		result *= (n - i + 1);
		result /= i;
	}

    return result;
}*/

ulong raisingProduct (ulong m, ulong n)
{
	writeln("m: ", m);
	writeln("n: ", n);
	if (n < 1) return 1;
	if (m > n) return 1;
	if (m < 1) m = 1;

	ulong result = m;
	m += 1;
	while (m <= n)
	{
		result *= m;
		m += 1;
	}

	writeln("m: ", m);
	return result;
}

ulong combinationsOfK (ulong n, ulong k)
{
	ulong top = raisingProduct(n - k + 1, n);
	ulong bottom = raisingProduct(1, k);

	writeln("Top: ", top);
	writeln("Bottom: ", bottom);

	return to!ulong(floor(to!float(top)/bottom));
}

ulong numOfConsecutiveSubarrays (ulong len, ulong stride)
{
	size_t i = 0;
	for (size_t j = stride; j <= len; ++j)
	{
		++i;
	}

	return i;
}

int[] digits (string input)
{
	int[] result;
	foreach(c; input.representation)
	{
		if (!isDigit(c)) throw new Exception("Invalid character(non-digit) in input string.");

		result ~= c - '0';
	}

	return result;
}

int[][] slice (string input, uint stride = 1)
{
	if (input.length < stride) throw new Exception("Stride is longer than input.");

	int[] dig = digits(input);

	ulong k = numOfConsecutiveSubarrays(dig.length, stride);
	writefln("Combinations : %s", k);
	int[][] result = new int[][](k, stride);

	writefln("Length %s : ", dig.length);
	for ({size_t i = 0; size_t j = stride;} j <= dig.length;)
	{
		writefln("i %s : ", i);
		writefln("j %s : ", j);
		result[i] = dig[i..j];
		++i;
		++j;
	}
	// output each array element's value
	for ( int i = 0; i < k; i++ )
	{
		for ( int j = 0; j < stride; j++ )
		{
			writeln( "result[" , i , "][" , j , "]: ", result[i][j]);
		}
	}

	return result;
}

unittest
{
immutable int all_tests_enabled = 0;

// short_digits
{
	const int[] expected = [0, 1, 2, 3, 4, 5];
	const int[] actual = digits("012345");

	assert(equal(actual, expected));
}

// long_digits
{
	const int[] expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
	const int[] actual = digits("0123456789");

	assert(equal(actual, expected));
}

// keeps_the_digit_order_if_reversed
{
	const int[] expected = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0];
	const int[] actual = digits("9876543210");

	assert(equal(actual, expected));
}

// keeps_arbitrary_digit_order
{
	const int[] expected = [9, 3, 6, 9, 2, 3, 4, 6, 8];
	const int[] actual = digits("936923468");

	assert(equal(actual, expected));
}

// can_slice_by_1
{
	const int[][] expected = [[0], [1], [2], [3], [4]];
	const int[][] actual = slice("01234", 1);

	// output each array element's value
	for ( int i = 0; i < 5; i++ )
	{
		for ( int j = 0; j < 1; j++ )
		{
			writeln( "actual[" , i , "][" , j , "]: ", actual[i][j]);
		}
	}

	assert(equal(actual, expected));
}

// can_slice_by_2
{
	const int[][] expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]];
	const int[][] actual = slice("98273463", 2);

	writeln("Actual len: ", actual.length);
	// output each array element's value
	for ( int i = 0; i < 7; i++ )
	{
		for ( int j = 0; j < 2; j++ )
		{
			writeln( "actual[" , i , "][" , j , "]: ", actual[i][j]);
		}
	}

	assert(equal(actual, expected));
}

// can_slice_by_3
{
	const int[][] expected = [[0, 1, 2], [1, 2, 3], [2, 3, 4]];
	const int[][] actual = slice("01234", 3);

	assert(equal(actual, expected));
}

// can_slice_by_3_with_duplicate_digits
{
	const int[][] expected = [[3, 1, 0], [1, 0, 0], [0, 0, 1]];
	const int[][] actual = slice("31001", 3);

	assert(equal(actual, expected));
}

// can_slice_by_4
{
	const int[][] expected = [[3, 1, 0], [1, 0, 0], [0, 0, 1]];
	const int[][] actual = slice("31001", 3);

	assert(equal(actual, expected));
}

// can_slice_by_5
{
	const int[][] expected = [[8, 1, 2, 2, 8]];
	const int[][] actual = slice("81228", 5);

	assert(equal(actual, expected));
}

// exception_if_not_enough_digits_to_slice
{
	assertThrown(slice("01032987583", 12));
}

// exception_if_invalid_input
{
	assertThrown(slice("01032i987583", 12));
}

// exception_if_invalid_input_2
{
	assertThrown(digits("01032i987583"));
}

static if (all_tests_enabled)
{
}

}

void main ()
{
}

