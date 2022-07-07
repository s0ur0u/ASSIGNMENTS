using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment2
{
    public class Parameters
    {
        /*4*/
        public void RightRotate(int[] a, int n, int k)
        {

            k = k % n;

            for (int i = 0; i < n; i++)
            {
                if (i < k)
                {

                    Console.Write(a[n + i - k] + " ");
                }
                else
                {

                    Console.Write(a[i - k] + " ");
                }
            }
            Console.WriteLine();
        }
        /*5-*/
        public void Sequence(int[] arr)
        {
            int[]r=new int[1];
            for(int i=1; i < arr.Length; i++)
            {
                if (arr[i] == arr[i-1]) {
                    int[] result = new int[r.Length + 1];
                    result[r.Length-1] = arr[i];
                    for (int j= 0; j < result.Length;++j)
                    {
                        Console.WriteLine(result[j]);
                    }
                }
            }
            
        }
        /*Practice Strings*/

    /*1-*/
        public void Reverse(string str)
        {
            char[] chars = str.ToCharArray();
            Array.Reverse(chars);
            Console.WriteLine(chars);
        }

        /*2-*/
        public void Reverse2(string str)
        {
            string[]sent = str.Split(' ');
            Array.Reverse(sent);
            for(int i=0; i<sent.Length; i++)
            {
                Console.Write(sent[i]+" ");
            }
        }

        /*3-*/
        public void Palindrome(string str)
        {
            string[]tense = str.Split(' ');
   
            for (int i=0; i < tense.Length; i++)
            {
                Console.WriteLine(tense[i]);
                string[] tense2 = tense[i].Split("");
             
                //for ( int j=0; j < tense2.Length; j++)
                //{
                //    Console.WriteLine(tense2[j]);
                //}
            }
        }

        /*4-*/
        public void Protocol(string str)
        {
            string[] prot = str.Split("/");
            Console.WriteLine("[Protocol] = " + prot[0]);
            Console.WriteLine("[Server] = " + prot[2]);
            Console.WriteLine("[Ressource] = " + prot[3]);
        }
    }
}
