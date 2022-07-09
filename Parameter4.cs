using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment4_C_Sharp
{
    /*1-*/
    public class MyStack<T>
    {
        int capacity;
        T[] stack;
        int top;

        public MyStack(int maxElements)
        {
            capacity = maxElements;
            stack = new T[capacity];

        }

        public int Push(T element)
        {
            if (top == capacity - 1)
            {
                return -1;
            }
            else
            {
                top = top + 1;
                stack[top] = element;
            }
            return 0;
        }

        public T Pop()
        {
            T removedElement;
            T temp = default(T);

            if (!(top <= 0))
            {
                removedElement = stack[top];
                top = top - 1;
                return removedElement;
            }
            return temp;
        }

        public T[] Count()
        {
            T[] elements = new T[top + 1];
            Array.Copy(stack, 0, elements, 0, top+1);
            return elements;
        }
    }
    /*2-*/
    public class MyList<T>
    {
        

    }
}
