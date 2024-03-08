module scrabble_scores;

import std.string;

pure int score(immutable string word)
{
    int points = 0;
    string upper = toUpper(word);
    foreach (char letter; upper) {
        switch (letter) {
            case 'A':
            case 'E':
            case 'I':
            case 'O':
            case 'U':
            case 'L':
            case 'N':
            case 'R':
            case 'S':
            case 'T':
                points += 1;
                break;
            case 'D': 
            case 'G':
                points += 2;
                break;
            case 'B':
            case 'C':
            case 'M':
            case 'P':
                points += 3;
                break;
            case 'F':
            case 'H':
            case 'V':
            case 'W': 
            case 'Y':
                points += 4;
                break;
            case 'K':
                points += 5;
                break;
            case 'J':
            case 'X':
                points += 8;
                break;
            case 'Q':
            case 'Z':
                points += 10;
                break;
            default:
                break;
        }
    }

    return points;
}
