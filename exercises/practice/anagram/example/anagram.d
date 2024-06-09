import std.array;
import std.string;
import std.algorithm;

pure string[] findAnagrams(immutable string subject, immutable string[] candidates)
{
    string[] results = [];

    string loweredSubject = subject.toLower();
    auto subjectLetters = loweredSubject.split("").sort();

    foreach (candidate; candidates)
    {
        string loweredCandidate = candidate.toLower();
        auto candidateLetters = loweredCandidate.split("").sort();

        if (subjectLetters == candidateLetters && loweredSubject != loweredCandidate)
        {
            results ~= candidate;
        }
    }
    return results;
}

