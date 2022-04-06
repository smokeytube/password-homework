import std.stdio;
import std.digest.sha;
import std.conv;
import std.process;

import source.utils.speedtestutils;
import utils.speedtestdata;
import speedtest.speedtest;

void main()
{
	SpeedTestUtils uti = new SpeedTestUtils();
	SpeedTestData dat = new SpeedTestData();
	SpeedTest tes = new SpeedTest();

	bool generate_passwords = false;
	int rep = 5;

	string[][string] d = dat.charDictionary();

	if (generate_passwords)
	{
		// Generate all combinations
		uti.differentFlagPermutations(dat.comb_len, d["numbers"], "numbers.txt");
		uti.differentFlagPermutations(dat.comb_len, d["symbols"], "symbols.txt");
		uti.differentFlagPermutations(dat.comb_len, d["lowercase"], "lowercase.txt");
		uti.differentFlagPermutations(dat.comb_len, (
				d["lowercase"] ~ d["uppercase"]), "lowercase_uppercase.txt");
		uti.differentFlagPermutations(dat.comb_len, (
				d["lowercase"] ~ d["uppercase"] ~ d["numbers"]), "lowercase_uppercase_numbers.txt");
		uti.differentFlagPermutations(dat.comb_len, (
				d["lowercase"] ~ d["uppercase"] ~ d["symbols"]), "lowercase_uppercase_symbols.txt");
		uti.differentFlagPermutations(dat.comb_len, (
				d["lowercase"] ~ d["uppercase"] ~ d["numbers"] ~ d["symbols"]), "lowercase_uppercase_numbers_symbols.txt");
	}

	int[] numbers;
	for (int x = 0; x < rep; x++)
	{
		numbers ~= tes.test(d["numbers"], "numbers.txt");
	}

	writeln(numbers);

	int[] symbols;
	for (int x = 0; x < rep; x++)
	{
		symbols ~= tes.test(d["symbols"], "symbols.txt");
	}

	writeln(symbols);

	int[] lowercase;
	for (int x = 0; x < rep; x++)
	{
		lowercase ~= tes.test(d["lowercase"], "lowercase.txt");
	}

	writeln(lowercase);

	int[] lowercase_uppercase;
	for (int x = 0; x < rep; x++)
	{
		lowercase_uppercase ~= tes.test((
				d["lowercase"] ~ d["uppercase"]), "lowercase_uppercase.txt");
	}

	writeln(lowercase_uppercase);

	int[] lowercase_uppercase_numbers;
	for (int x = 0; x < rep; x++)
	{
		lowercase_uppercase_numbers ~= tes.test((
				d["lowercase"] ~ d["uppercase"] ~ d["numbers"]), "lowercase_uppercase_numbers.txt");
	}

	writeln(lowercase_uppercase_numbers);

	int[] lowercase_uppercase_symbols;
	for (int x = 0; x < rep; x++)
	{
		lowercase_uppercase_symbols ~= tes.test((
				d["lowercase"] ~ d["uppercase"] ~ d["symbols"]), "lowercase_uppercase_symbols.txt");
	}

	writeln(lowercase_uppercase_symbols);

	int[] lowercase_uppercase_numbers_symbols;
	for (int x = 0; x < rep; x++)
	{
		lowercase_uppercase_numbers_symbols ~= tes.test((
				d["lowercase"] ~ d["uppercase"] ~ d["numbers"] ~ d["symbols"]), "lowercase_uppercase_numbers_symbols.txt");
	}

	writeln(lowercase_uppercase_numbers_symbols);


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

	// Algorithm to sort 7 lists of 5 numbers to 5 lists of 7 numbers
	for (int i = 0; i < all[0].length; i++)
	{
		sorted = [];
		for (int j = 0; j < all.length; j++)
		{
			sorted ~= all[j][i];
		}
		all_sorted ~= sorted;
		sorted = [];
	}

	File output = File(dat.d_output_path ~ "output.txt", "a+");
	output.write(all_sorted);
	output.write("\n");
	output.close();

	auto dmd = execute(["python", "./pythonscripts/graphgenerator.py"]);
}