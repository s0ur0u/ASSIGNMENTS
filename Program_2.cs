using Assignment2;
//int[] array1 = {1,2,3,4,5,6,7,8,9,10};

//int[] array2 = new int[array1.Length];

//for (int i = 0; i < array1.Length; i++)
//{
//    array2[i] = array1[i];

//}
//foreach (int i in array2)
//{
//    Console.WriteLine(i);
//}
//foreach(int j in array1)
//{
//    Console.WriteLine(j);
//}



//string[] list = { "Milk", "Bread", "Eggs", "Bacon", "Fruits"};
//Console.WriteLine("Here is your list:");
//foreach (var item in list)
//{
//    Console.WriteLine(item);
//}
//Console.WriteLine("Enter command (+ item, - item, or -- to clear)");
//string input= Console.ReadLine();
//if(input == "+")
//{
//    Console.Write("What do you want to add? ");
//    string add= Console.ReadLine();

//    string[] result = new string[list.Length + 1];
//    list.CopyTo(result, 0);
//    result[list.Length] = add;
//    for(int l=0; l<result.Length;l++)
//    {
//        Console.WriteLine("Here is your updated list: ");
//        Console.WriteLine(result[l]);
//    }
//}
//else if(input == "-")
//{
//    Console.WriteLine("What do you want to remove from the list: ");
//    string removed = Console.ReadLine();
//    for(int m=0; m < list.Length; m++)
//    {
//        if (removed == list[m])
//        {
//            int indexToRemove= Array.IndexOf(list,removed);
//            list = list.Where((source, index) => index != indexToRemove).ToArray();
//        }
//    }
//    Console.WriteLine("Here is your updated list: ");
//    for (int n = 0; n < list.Length; n++)
//    {
//        Console.WriteLine(list[n]);
//    }

//}
//else if (input == "--")
//{
//    Array.Clear(list, 0, list.Length);
//    Console.WriteLine("Here is your updated list: ");
//    for (int o = 0; o < list.Length; o++)
//    {
//        Console.WriteLine(list[o]);
//    }
//    Console.WriteLine("ALL Clear!!");
//}


//of integers*/
//class PrimeNumbers
//{

//    public static void Main(string[] args)
//    {

//        int a, b, p;

//        Console.WriteLine("Enter lower bound of the interval: ");

//        a = int.Parse(Console.ReadLine());

//        Console.WriteLine("Enter upper bound of the interval: ");

//        b = int.Parse(Console.ReadLine());

//        Console.WriteLine("\nPrime numbers between {0} and {1} are: ", a, b);

//        for (int i = a; i <= b; i++)
//        {

//            if (i == 1 || i == 0)
//                continue;

//            p = 1;

//            for (int j = 2; j <= i / 2; ++j)
//            {
//                if (i % j == 0)
//                {
//                    p = 0;
//                    break;
//                }
//            }

//            if (p == 1)
//                Console.WriteLine(i);
//        }
//    }
//}


///*4-Write a program to read an array of n integers (space separated on a single line) and an
//integer k, rotate the array right k times and sum the obtained arrays after each rotation as
//shown below.*/
//public class Try
//{
//    public static void Main(String[] args)
//    {
//        int[] Array = { 1, 2, 3, 4, 5 };
//        int N = Array.Length;
//        int K = 2;

//        Parameters p = new Parameters();
//        p.RightRotate(Array, N, K);
//    }
//}


///*5-Write a program that finds the longest sequence of equal elements in an array of integers.
//If several longest sequences exist, print the leftmost one.*/
//Parameters p = new Parameters();
//int[] Array = { 2, 1, 1, 2, 3, 3, 2, 2, 2, 1 };
//p.Sequence(Array);


///*Practice Strings*/

///*1-Write a program that reads a string from the console, reverses its letters and prints the
//    result back at the console.*/
//Console.WriteLine("Please enter a string");
//string word = Console.ReadLine();
//Parameters p = new Parameters();
//p.Reverse(word);


///*2-Write a program that reverses the words in a given sentence without changing the
//punctuation and spaces*/
//Console.WriteLine("Enter a sentence");
//string sentence = Console.ReadLine();
//Parameters p = new Parameters();
//p.Reverse2(sentence);

///*3-Write a program that extracts from a given text all palindromes, e.g. “ABBA”, “lamal”, “exe”
//and prints them on the console on a single line, separated by comma and space.*/
//Console.WriteLine("Enter a sentence");
//string phrase = Console.ReadLine();
//Parameters p = new Parameters();
//p.Palindrome(phrase);


/*4-Write a program that parses an URL given in the following format:
[protocol]://[server]/[resource]*/
Console.WriteLine("Enter your URL");
string url = Console.ReadLine();
Parameters p = new Parameters();
p.Protocol(url);