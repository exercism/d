
module crypto;

import std.string;
import std.array;
import std.math : sqrt, floor, ceil;
import std.conv : to;

import std.stdio;
import std.algorithm : map, filter;
import std.ascii : isAlphaNum;


class Cipher
{
public:
	this (const string text)
	{
		this.normalized = text.filter!isAlphaNum.map!toLower.to!string;
	}

	string normalizePlainText ()
	{
		return normalized;
	}

	/**
	* Return the number of encrypted segments(that is number of columns for the crypto square).
	*/
	size_t size ()
	{
		size_t root = to!ulong(floor(sqrt(to!float(normalized.length))));

		size_t distance = normalized.length - root * root;
		if (distance == 0)
		{
			return root;
		}
		else
		{
			return to!ulong(root) + 1;
		}
	}

	string[] plainTextSegments ()
	{
		size_t columns = size();
		size_t rem = normalized.length % columns;
		string[] result;

		size_t len = normalized.length;
		for (size_t j = 0; j <= (len - columns); j += columns)
		{
			result ~= normalized[j..j + columns];
		}

		// we need to handle the leftovers
		if (rem)
		{
			result ~= normalized[len - rem .. len];
		}

		return result;
	}

	Cipher normalize ()
	{
		delimiter = " ";

		return this;
	}

	string cipherText ()
	{
		string result;
		string[] segments = plainTextSegments();
		size_t columns = size();

		for (size_t i = 0; i < columns; ++i)
		{
			string cryptoSegment;
			foreach (s; segments)
			{
				if (i < s.length) cryptoSegment ~= s[i];
			}

			result ~= cryptoSegment;
			result ~= delimiter;
		}

		return strip(result);

	}

private:
	const string normalized;
	string delimiter = "";
}
