using System;
using System.Text;

namespace CrashTest
{
    class Program
    {
        static void Main(string[] args)
        {
            switch(args[0].ToLower())
            {
                case "so":
                    StackOverflow();
                    break;
                case "ue":
                    UserException();
                    break;
                case "oom":
                    OutofMemory();
                    break;
                default:
                    StackOverflow();
                    break;
            }
        }

        static void UserException()
        {
            throw new Exception("Crash!!");
        }

        static void StackOverflow()
        {
            StackOverflow();
        }
        public static void OutofMemory()
        {
            StringBuilder sb = new StringBuilder(15, 15);
            sb.Append("Substring #1 ");
            try {
                sb.Insert(0, "Substring #2 ", 1);
            }
            catch (OutOfMemoryException e) {
                Console.WriteLine("Out of Memory: {0}", e.Message);
            }
        }
    }
}
