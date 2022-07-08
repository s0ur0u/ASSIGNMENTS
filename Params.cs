using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment3_C_Sharp
{
    /*1*/
    public class Reversing
    {
        public int[] GenerateNumbers()
        {
            Console.WriteLine("Please enter numbers separated by commas");
            int[] numbs = new int[10];
            string numbers = Console.ReadLine();
            string[] number = numbers.Split(',');
            for(int i=0; i < number.Length; ++i)
            {
                numbs[i] = Convert.ToInt32(number[i]);
            }
            return numbs;

        }
        public int[] Reverse(int[] arr)
        {
            int temp;
            for (int i=1; i<arr.Length; i++)
            {
                temp = arr[i-1];
                arr[i-1] = arr[i];
                arr[i] = temp;
            }
            return arr;

        }
        public void PrintNumbers(int[]array)
        {
            foreach(int i in array)
            {
                Console.Write(i+", ");
            }
        }
    }
    public class Fibonacci
    {
        public void Sequence(int number)
        {
            int value = 11;
            int[]arr = new int[value];
            for(int i = 2; i < value; i++)
            {
                arr[0] = 1;
                arr[1] = 1;
                arr[i] = arr[i - 1] + arr[i-2];
            }
            Console.WriteLine(arr[number-1]);
        }
    }
}

/*Designing and Building Classes using object-oriented principles*/

//2-
public abstract class Person
{
    public abstract string Name();
}

public class Student : Person
{
    public override string Name()
    {
        return "Mikey";
    }
    public string Greet()
    {
        return "Hi my name is " + Name + " I am a student.";
    }
}

public class Instructor : Person
{
    public override string Name()
    {
        return "Jason";
    }

    public string Greet2()
    {
        return "Hi I am " + Name + " and I am an instructor";
    }
}