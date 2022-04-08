module utils.speedtestdata;

import std.stdio;

public static class SpeedTestData
{
    public int comb_len = 4;
    public int rand_comb_amount = 10;

    public string d_output_path = "./source/output/";
    public string d_generated_path = "./source/resources/generatedPasswords/";

    public string py_output_path = "./pythonscripts/output/";

    // This dictionary cannot be a class instance variable because it is disallowed in dlang for some reason
    public static string[][string] charDictionary()
    {
        return [
            "numbers": [
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
            "symbols": [
                "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "-", "+",
                "="
            ],
            "lowercase": [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
            ],
            "lowercase_uppercase": [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
            ],
            "lowercase_uppercase_numbers": [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
            ],
            "lowercase_uppercase_symbols": [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "-", "+",
                "="
            ],
            "lowercase_uppercase_numbers_symbols": [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "!", "@", "#",
                "$", "%", "^", "&", "*", "(", ")", "_", "-", "+", "="
            ]
        ];
    }

    public int[][string] outputMap()
    {
        string[][string] dict = this.charDictionary();

        // Dictionary cannot be initialized with no values, so we add a dummy value then delete it after the dictionary has been initialized.
        int[][string] outp = ["a" : []];
        outp.remove("a");
        
        foreach(item; dict.byKeyValue()) {
            outp[item.key] = [];
        }
        return outp;
    }
}
