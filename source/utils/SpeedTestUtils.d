module source.utils.speedtestutils;

import utils.speedtestdata;

import std.stdio;
import std.string;
import std.conv;
import std.random;
import std.datetime.systime;
import core.time;
import core.thread;
import std.digest.sha;
import std.file;

public static class SpeedTestUtils
{
    /** 
     * Get the current time in microseconds. Used for generating pseudo-random passwords.
     * Returns: current time in usecs
     */
    protected static int currentUsecs()
    {
        SysTime currentTime = Clock.currTime();
        auto frac = currentTime.fracSecs();
        immutable usec = cast(int) frac.total!"usecs";
        return usec;
    }

    /*
    * Params:
    *      X    =     maximum combination length
    *      arr  =     list of characters to be used in the combinations
    *      dat.d_output_path =   dat.d_output_path of the file to be written to
    *      output   =   name of the output file where the combinations will be stored.
    *
    * Algorithm to create every combination of a list of characters to a certian length.
    * This is not handled in-memory for two reasons:
    * 1. The program will run out of memory quickly for combination lengths longer than 3 or 4
    * 2. The program will have to freshly generate the combinations every time the program runs, wasting a lot of time and resources.
    *
    * Take the last file, repeat the contents by integer X times, then append another character to the end of it, creating a new combination
    *
    * Example
    * --------------
    * File 1:
    * 1
    * 2
    * 3
    * --------------
    * Repeat the contents X times, in this case 3 times, then append a new character to the end of it, creating a new combination.
    * --------------
    * File 2:
    * 11
    * 21
    * 31
    * 12
    * 22
    * 32
    * 13
    * 23
    * 33
    * --------------
    * Repeat X number of times, then combine all files together.
    */
    public static void differentFlagPermutations(int X, string[] arr, string output = "fin.txt")
    {
        SpeedTestData dat = new SpeedTestData();

        int arr_len = to!int(arr.length);
        File file;
        File previous;
        File fin;

        fin = File(dat.d_output_path ~ output, "w");
        fin.write();
        fin.close();

        for (int j = 0; j < X; j++)
        {
            file = File(dat.d_output_path ~ to!string(j) ~ ".txt", "w");
            if (j == 0)
            {
                for (int i = 0; i < arr_len; i++)
                {
                    fin = File(dat.d_output_path ~ output, "a+");
                    file.write(arr[i] ~ "\n");
                    fin.write(arr[i] ~ "\n");
                    fin.close();
                }
            }
            else
            {
                for (int i = 0; i < arr_len; i++)
                {
                    file = File(dat.d_output_path ~ to!string(j) ~ ".txt", "a+");
                    previous = File(dat.d_output_path ~ to!string(j - 1) ~ ".txt", "r");
                    fin = File(dat.d_output_path ~ output, "a+");
                    foreach (line; previous.byLine())
                    {
                        file.write(line ~ arr[i] ~ "\n");
                        fin.write(line ~ arr[i] ~ "\n");
                    }
                    previous.close();
                    file.close();
                    fin.close();
                }
            }
        }

        // Cleanup
        for (int j = 0; j < X; j++)
        {
            remove(dat.d_output_path ~ to!string(j) ~ ".txt");
        }
    }


    /** 
     * 
     * Params:
     *   leng = Length of the password to be generated
     *   characters = the list of characters to be used in the password
     * Returns: A random password of length leng
     */
    public string generateRandomPassword(int leng, string[] characters)
    {
        string pass;
        Random rnd;

        for (int x = 0; x < leng; x++)
        {
            rnd = Random(currentUsecs());
            Thread.sleep(dur!("usecs")(uniform(0, 1000, rnd)));
            pass ~= characters.choice(rnd);

        }
        return pass;
    }
}
