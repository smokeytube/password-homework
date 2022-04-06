module speedtest.SpeedTest;

import std.datetime.stopwatch;
import std.stdio;
import std.digest.sha;
import std.conv;
import std.string;
import std.file;

import source.utils.SpeedTestUtils;
import utils.SpeedTestData;

public class SpeedTest
{
    /** 
     * 
     * Params:
     *   arr = the list of characters to use. It should correspond to filename.
     *   filename = the filename of the generated passwords.
     * Returns: A list of average times to crack a random combination.
     */
    public int test(string[] arr, string filename)
    {

        SpeedTestUtils uti = new SpeedTestUtils();
        SpeedTestData dat = new SpeedTestData();


        ubyte[32][] rand_hashed;
        for (int x = 0; x < dat.rand_comb_amount; x++)
        {
            rand_hashed ~= sha256Of(
                uti.generateRandomPassword(dat.comb_len, arr));
        }

        auto sw = StopWatch(AutoStart.no);
        bool found = false;
        ubyte[32] found_pass;

        File combinations = File(dat.d_generated_path ~ filename, "r");

        sw.start();

        foreach (m; rand_hashed)
        {
            foreach (line; combinations.byLine())
            {
                line = strip(line);
                if (sha256Of(line) == m)
                {
                    found = true;
                    found_pass = m;
                    break;
                }
            }
            combinations.close();
            combinations = File(dat.d_generated_path ~ filename, "r");
            if (!found)
            {
                writeln("Not found: " ~ to!string(m));
            }

            found = false;
            
        }

        sw.stop();

        float average_msec = ((sw.peek.total!"msecs") / dat.rand_comb_amount);

        return to!int(average_msec);
    }
}
