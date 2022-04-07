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
	int[][string] o = dat.outputMap();

	if (generate_passwords)
	{
		foreach(item; d.byKeyValue()) {
            uti.differentFlagPermutations(dat.comb_len, d[item.key], item.key ~ ".txt");
        }
	}

	foreach (item; d.byKeyValue())
	{
		for (int i = 0; i < rep; i++) {
			o[item.key] ~= tes.test(d[item.key], item.key ~ ".txt");
		}
	}

	int[][] all;

	foreach (item; o.byKeyValue()) {
		all ~= item.value;
	}

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

	execute(["python", "./pythonscripts/graphgenerator.py"]);
}