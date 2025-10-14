module wordy;

import std.array;
import std.conv;

pure long answer(immutable string question)
{
    if (question.length == 0 || question[$ - 1] != '?')
    {
        throw new Exception("syntax error");
    }

    auto words = question[0 .. $ - 1].split();

    if (words.length < 3 || words[0] != "What" || words[1] != "is")
    {
        throw new Exception("unsupported question");
    }

    long first = to!long(words[2]);
    char operation = '+';

    size_t index = 3;
    while (index + 1 < words.length)
    {
        if (words[index] == "plus")
        {
            operation = '+';
        }
        else if (words[index] == "minus")
        {
            operation = '-';
        }
        else if (words[index] == "multiplied" && words[index + 1] == "by")
        {
            operation = '*';
            index++;
        }
        else if (words[index] == "divided" && words[index + 1] == "by")
        {
            operation = '/';
            index++;
        }
        else
        {
            throw new Exception("unsupported question");
        }

        index++;
        if (index == words.length)
        {
            throw new Exception("syntax error");
        }

        long second = to!long(words[index]);
        index++;

        if (operation == '+')
        {
            first += second;
        }
        else if (operation == '-')
        {
            first -= second;
        }
        else if (operation == '*')
        {
            first *= second;
        }
        else if (operation == '/')
        {
            first /= second;
        }
    }

    if (index != words.length)
    {
        throw new Exception("syntax error");
    }

    return first;
}
