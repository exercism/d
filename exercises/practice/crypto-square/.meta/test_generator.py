from lib import assert_equal, d_string


def gen_case(case):
    plaintext = d_string(case["input"]["plaintext"])
    expected = d_string(case["expected"])
    return [
        f"auto theCipher = Cipher({plaintext});",
        assert_equal(expected, "theCipher.cipherText()"),
    ]
