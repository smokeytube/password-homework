import std.stdio;
import std.digest.sha;
import std.conv;
import std.json;

import source.utils.SpeedTestUtils;
import utils.SpeedTestData;
import speedtest.SpeedTest;

void main()
{
	// SpeedTestUtils uti = new SpeedTestUtils();
	// SpeedTestData dat = new SpeedTestData();
	// SpeedTest tes = new SpeedTest();

	// bool generate_passwords = false;
	// int rep = 5;

	// if (generate_passwords)
	// {
	// 	// Generate all combinations
	// 	uti.differentFlagPermutations(dat.comb_len, dat.numbers, "numbers.txt");
	// 	uti.differentFlagPermutations(dat.comb_len, dat.symbols, "symbols.txt");
	// 	uti.differentFlagPermutations(dat.comb_len, dat.lowercase, "lowercase.txt");
	// 	uti.differentFlagPermutations(dat.comb_len, (
	// 			dat.lowercase ~ dat.uppercase), "lowercase_uppercase.txt");
	// 	uti.differentFlagPermutations(dat.comb_len, (
	// 			dat.lowercase ~ dat.uppercase ~ dat.numbers), "lowercase_uppercase_numbers.txt");
	// 	uti.differentFlagPermutations(dat.comb_len, (
	// 			dat.lowercase ~ dat.uppercase ~ dat.symbols), "lowercase_uppercase_symbols.txt");
	// 	uti.differentFlagPermutations(dat.comb_len, (
	// 			dat.lowercase ~ dat.uppercase ~ dat.numbers ~ dat.symbols), "lowercase_uppercase_numbers_symbols.txt");
	// }

	// int[] numbers;
	// for (int x = 0; x < rep; x++)
	// {
	// 	numbers ~= tes.test(dat.numbers, "numbers.txt");
	// }

	// writeln(numbers);

	// int[] symbols;
	// for (int x = 0; x < rep; x++)
	// {
	// 	symbols ~= tes.test(dat.symbols, "symbols.txt");
	// }

	// writeln(symbols);

	// int[] lowercase;
	// for (int x = 0; x < rep; x++)
	// {
	// 	lowercase ~= tes.test(dat.lowercase, "lowercase.txt");
	// }

	// writeln(lowercase);

	// int[] lowercase_uppercase;
	// for (int x = 0; x < rep; x++)
	// {
	// 	lowercase_uppercase ~= tes.test((
	// 			dat.lowercase ~ dat.uppercase), "lowercase_uppercase.txt");
	// }

	// writeln(lowercase_uppercase);

	// int[] lowercase_uppercase_numbers;
	// for (int x = 0; x < rep; x++)
	// {
	// 	lowercase_uppercase_numbers ~= tes.test((
	// 			dat.lowercase ~ dat.uppercase ~ dat.numbers), "lowercase_uppercase_numbers.txt");
	// }

	// writeln(lowercase_uppercase_numbers);

	// int[] lowercase_uppercase_symbols;
	// for (int x = 0; x < rep; x++)
	// {
	// 	lowercase_uppercase_symbols ~= tes.test((
	// 			dat.lowercase ~ dat.uppercase ~ dat.symbols), "lowercase_uppercase_symbols.txt");
	// }

	// writeln(lowercase_uppercase_symbols);

	// int[] lowercase_uppercase_numbers_symbols;
	// for (int x = 0; x < rep; x++)
	// {
	// 	lowercase_uppercase_numbers_symbols ~= tes.test((
	// 			dat.lowercase ~ dat.uppercase ~ dat.numbers ~ dat.symbols), "lowercase_uppercase_numbers_symbols.txt");
	// }

	// writeln(lowercase_uppercase_numbers_symbols);


	int[][] all = [
		numbers,
		symbols,
		lowercase,
		lowercase_uppercase,
		lowercase_uppercase_numbers,
		lowercase_uppercase_symbols,
		lowercase_uppercase_numbers_symbols
	];


	int[][] all_sorted = [];
	int[] sorted;

	for (int i = 0; i < all[0].length; i++) {
		sorted = [];
		for (int j = 0; j < all.length; j++)
		{
			sorted ~= all[j][i];
		}
		all_sorted ~= sorted;
		sorted = [];
	}
}

void writeOutput(int[][] arr, path="C:/Users/zacha/code/python/thomasprograms/hashing/source/resorces/output/") {
	File output = File(path ~ "output.json", "a+");
	lines = output.byLine();
	string tekst = "";
	foreach (line; lines) {
		tekst ~= line;
	}
	JSONValue j = parseJSON(teskst);

}