/*Practice number sizes and ranges*/
public class understandingTypes
{
    public static void Main()
    {
        /*1-Create a console application project named /02UnderstandingTypes/ that outputs the
number of bytes in memory that each of the following number types uses, and the
minimum and maximum values they can have: sbyte, byte, short, ushort, int, uint, long,
ulong, float, double, and decimal*/

        Console.WriteLine($"Sbyte: Byte={1}, MinValue={-127}, MaxValue={128}");
        Console.WriteLine($"Byte: Byte={1}, MinValue={0}, MaxValue={255}");
        Console.WriteLine($"Short: Byte={2}, MinValue={-32768}, MaxValue={32767}");
        Console.WriteLine($"Ushort: Byte={1}, MinValue={0}, MaxValue={65535}");
        Console.WriteLine($"int: Byte={4}, MinValue={-2147483648}, MaxValue={2147483647}");
        Console.WriteLine($"Uint: Byte={4}, MinValue={0}, MaxValue={4294967295}");
        Console.WriteLine($"Long: Byte={8}, MinValue={-9223372036854775808}, MaxValue={9223372036854775807}");
        Console.WriteLine($"Ulong: Byte={8}, MinValue={0}, MaxValue={18446744073709551615}");
        Console.WriteLine($"Float: Byte={4}, MinValue={-3.40282347E+38F}, MaxValue={3.40282347E+38F}");
        Console.WriteLine($"Double: Byte={8}, MinValue={-1.7976931348623157E+308}, MaxValue={1.7976931348623157E+308}");
        Console.WriteLine($"Decimal: Byte={16}, MinValue={-79228162514264337593543950335M}, MaxValue={79228162514264337593543950335M}");

        /*2-Write program to enter an integer number of centuries and convert it to years, days, hours,
        minutes, seconds, milliseconds, microseconds, nanoseconds. Use an appropriate data
        type for every data conversion. Beware of overflows!*/

        Console.WriteLine("Enter an integer:");
        String value = Console.ReadLine();
        int newValue = Convert.ToInt32(value);
        int centuries = newValue;
        int years = 100 * newValue;
        int days = newValue * 36524;
        int hours = days * 24;
        float minutes = hours * 60;
        float seconds = minutes * 60;
        float milliseconds = seconds * 1000;
        float microseconds = milliseconds * 1000;
        float nanoseconds = microseconds * 1000;
        Console.WriteLine($"{centuries} centuries = {years} Years = {days} days = {hours} hours = {minutes} minutes = " +
            $"{seconds} seconds = {milliseconds} milliseconds = {microseconds} microseconds = {nanoseconds} nanoseconds");

    }
}

/*Practice loops and operators*/

/*1-Create a console application in Chapter03 named Exercise03 that outputs a simulated
FizzBuzz game counting up to 100*/
public class Exercise1_part1
{
    public static void Main()
    {
        for (int i = 1; i <= 100; ++i)
        {
            if (i % 3 == 0 && i % 5 == 0)
            {
                Console.WriteLine(i + " FizzBuzz");
            }
            else if (i % 5 == 0)
            {
                Console.WriteLine(i + " Buzz");
            }
            else if (i % 3 == 0)
            {
                Console.WriteLine(i + " Fizz");
            }
        }
    }
}

/*What code could you add (don’t change any of the preceding code) to warn us about the
problem?*/
public class Exercise1_part2
{
    public static void Main()
    {
        int max = 500;
        for (byte i = 0; i < max; i++)
        {
            // WriteLine(i);
        }
    }
}
/*The program will not run because there is a syntax error. In order to fix the problem,
 we must add the "Console."to the WriteLine(i) statement*/


/*Write a program that generates a random number between 1 and 3 and asks the user to
guess what the number is. Tell the user if they guess low, high, or get the correct answer.
Also, tell the user if their answer is outside of the range of numbers that are valid guesses
(less than 1 or more than 3).*/
public class Exercise1_part3
{
    public static void Main()
    {
        int correctNumber = new Random().Next(3) + 1;
        int guessedNumber = int.Parse(Console.ReadLine());

        if (guessedNumber < 1 || guessedNumber > 3)
        {
            Console.WriteLine("You are outside of the range");
        }

        else if (correctNumber == guessedNumber)
        {
            Console.WriteLine("You got it!");
        }
        else if (correctNumber < guessedNumber)
        {
            Console.WriteLine("You guessed high");
        }
        else if (correctNumber > guessedNumber)
        {
            Console.WriteLine("You guessed low");
        }
    }
}


/*2- Print a Pyramid*/
public class Assignment2
{
    public static void Main()
    {
        int n = 5;
        for (int i = 0; i < n; i++)
        {
            for (int j = 1; j <= n - i; j++)
                Console.Write(" ");
            for (int j = 1; j <= 2 * i - 1; j++)
                Console.Write("*");
            Console.Write("\n");
        }
    }
}


/*3- Write a program that generates a random number between 1 and 3 and asks the user to
guess what the number is. Tell the user if they guess low, high, or get the correct answer.
Also, tell the user if their answer is outside of the range of numbers that are valid guesses
(less than 1 or more than 3).*/

public class Exercise3
{
    public static void Main()
    {
        int correctNumber = new Random().Next(3) + 1;
        int guessedNumber = int.Parse(Console.ReadLine());

        if (guessedNumber < 1 || guessedNumber > 3)
        {
            Console.WriteLine("You are outside of the range");
        }

        else if (correctNumber == guessedNumber)
        {
            Console.WriteLine("You got it!");
        }
        else if (correctNumber < guessedNumber)
        {
            Console.WriteLine("You guessed high");
        }
        else if (correctNumber > guessedNumber)
        {
            Console.WriteLine("You guessed low");
        }
    }
}


/*4-Write a simple program that defines a variable representing a birth date and calculates
how many days old the person with that birth date is currently*/
class GFG
{
    static void findAge(int current_date,
        int current_month,
        int current_year,
        int birth_date,
        int birth_month,
        int birth_year)
    {
        int[] month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

        if (birth_date > current_date)
        {
            current_month = current_month - 1;

            current_date = current_date + month[birth_month - 1];
        }

        if (birth_month > current_month)
        {
            current_year = current_year - 1;
            current_month = current_month + 12;
        }

        int calculated_date = current_date - birth_date;

        int calculated_month = current_month - birth_month;

        int calculated_year = current_year - birth_year;

        Console.WriteLine("Present Age");
        Console.WriteLine("Years: " + calculated_year + " Months: " + calculated_month
               + " Days: " + calculated_date);
    }
    public static void Main()
    {
        int current_date = 6;
        int current_month = 7;
        int current_year = 2022;
        int birth_date = 16;
        int birth_month = 12;
        int birth_year = 2009;

        findAge(current_date, current_month, current_year, birth_date, birth_month, birth_year);
    }
}


/*5-Write a program that greets the user using the appropriate greeting for the time of day.
Use only if , not else or switch , statements to do so*/

public class greeting
{
    public static void Main()
    {

        DateTime timing = DateTime.Now;
        int hour = DateTime.Now.Hour;
        Console.WriteLine(timing);
        if (hour > 21)
        {
            Console.WriteLine("Good Night");
        }
        if (hour > 18 && hour < 21)
        {
            Console.WriteLine("Good Evening");
        }
        if (hour >= 12 && hour < 17)
        {
            Console.WriteLine("Good Afternoon");
        }
        if (hour < 12)
        {
            Console.WriteLine("Good Morning");
        }
    }
}


/*6-Write a program that prints the result of counting up to 24 using four different increments.
First, count by 1s, then by 2s, by 3s, and finally by 4s.*/

public class counting
{
    public static void Main()
    {
        for(int i = 1; i <= 24; i++)
        {
            for(int j = 0; j <= 24; j+=i)
            {
                Console.Write(j.ToString().PadLeft(4));
            }
            Console.WriteLine();
          
        }
    }
}