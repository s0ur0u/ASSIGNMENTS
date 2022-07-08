/*1-Let’s make a program that uses methods to accomplish a task. Let’s take an array and
reverse the contents of it. */

namespace Assignment3_C_Sharp;
//public class Reverse
//{
//    public static void Main(string[] args)
//    {
//        Reversing p = new Reversing();
//        int[] numbers = p.GenerateNumbers();
//        int[] number = p.Reverse(numbers);
//        p.PrintNumbers(number);
//    }
//}

///*2-Fibonacci Sequence*/
//public class FibonacciSequence
//{
//    public static void Main(string[] args)
//    {
//        Console.WriteLine("Please enter the nth element out of the 10 Fibonacci Sequence: ");
//        int element = int.Parse(Console.ReadLine());
//        Fibonacci f = new Fibonacci();
//        f.Sequence(element);
//    }
//}


/*Designing and Building Classes using object-oriented principles*/

/*1-Write a program that that demonstrates use of four basic principles of
object-oriented programming /Abstraction/, /Encapsulation/, /Inheritance/ and
/Polymorphism/.*/

//Ecapsulation
public class Encap
{
    public int Example1 { get; set; }

}

//Inheritance
public class Employee
{
    public int EmployeeID { get; set; }
    public string Name { get; set; }
}
public class FullTime : Employee
{
    public FullTime(int id, string name)
    {
        EmployeeID = id;
        Name = name;
    }
}

//Abstraction
public abstract class Shape
{
    public abstract int Area();
}

public class Square : Shape
{
    private int side;
    public Square(int x = 0)
    {
         x = side;
    }
    public override int Area()
    {
        return side * side;
    }
}


/*2-Use /Abstraction/ to define different classes for each person type such as Student
and Instructor. These classes should have behavior for that type of person*/

public class Abstraction
{
    public static void Main(string[] args)
    {
        Student s = new Student();
        Console.WriteLine(s.Greet());
        Console.WriteLine();
        Instructor i = new Instructor();
        Console.WriteLine(i.Greet2);
    }
}