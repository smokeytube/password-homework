module utils.SpeedTestData;

public class SpeedTestData
{
    public int comb_len = 4;
    public int rand_comb_amount = 10;

    string path = "./source/resorces/output/";

    public string[] lowercase = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
        "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
    ];
    public string[] uppercase = [
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
        "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
    ];
    public string[] numbers = [
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
    ];
    public string[] symbols = [
        "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "-", "+", "="
    ];
}
