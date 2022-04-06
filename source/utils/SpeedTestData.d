module utils.speedtestdata;

public static class SpeedTestData
{
    public int comb_len = 4;
    public int rand_comb_amount = 10;

    string d_output_path = "./source/output/";
    string d_generated_path = "./source/resources/generatedPasswords/";

    string py_output_path = "./pythonscripts/output/";

    public immutable string[] lowercase = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
        "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
    ];
    public immutable string[] uppercase = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
        "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
    ];
    public immutable string[] numbers = [
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
    ];
    public immutable string[] symbols = [
        "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "-", "+", "="
    ];

    // This dictionary cannot be a class instance variable because dlang does not like 
    static string[][string] charDictionary()
    {
        return [
            "numbers": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
            "symbols": [
                "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "-", "+",
                "="
            ],
            "lowercase": [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
            ],
            "uppercase": [
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
            ]
        ];
    }

}
