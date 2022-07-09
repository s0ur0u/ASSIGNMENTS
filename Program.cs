namespace Assignment4_C_Sharp;
/*1-Create a custom Stack class MyStack<T> that can be used with any data type which
has following method*/
public class Stack
{
    public static void Main(string[] args)
    {
        int capacity;
        Console.WriteLine("Enter the capacity of your Stack: ");
        capacity = int.Parse(Console.ReadLine());

        MyStack<string> stack = new MyStack<string>(capacity);

        while (true)
        {
            Console.WriteLine("1.Push");
            Console.WriteLine("2.Pop");
            Console.WriteLine("3.Print Stack Elements");
            Console.WriteLine("4.Exit");

            Console.WriteLine("Enter your choice: ");
            int choice = int.Parse(Console.ReadLine());

            switch (choice)
            {
                case 1:
                    {
                        Console.WriteLine("Enter the string to push: ");
                        string temp = Console.ReadLine();
                        int result = stack.Push(temp);

                        if(result != -1)
                        {
                            Console.WriteLine("Element pushed into the Stack !");
                        }
                        else
                        {
                            Console.WriteLine("Stack Overflow !");
                        }
                        break;
                    }
                    case 2:
                    {
                        string Result = stack.Pop();
                        if(Result != null)
                        {
                            Console.WriteLine("Delete Element: "+Result);
                        }
                        else
                        {
                            Console.WriteLine("Stack Underflow !");
                        }
                        break ;
                    }
                    case 3:
                    {
                        string[] elements = stack.Count();
                        Console.WriteLine("STACK CONTENT: ");
                        foreach(string element in elements)
                        {
                            Console.WriteLine(element);
                        }
                        break;
                    }
                case 4:
                    {
                        System.Diagnostics.Process.GetCurrentProcess().Kill();
                        break ;
                    }
                default:
                    {
                        Console.WriteLine("You have entered the wrong choice ");
                        break;
                    }
            }
        }

    }

}
/*2-Create a Generic List data structure MyList<T> that can store any data type.
Implement the following methods.*/
 