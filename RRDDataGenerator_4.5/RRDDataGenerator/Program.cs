using RRDDataGenerator.Common;
using System;

namespace RRDDataGenerator
{
    class Program
    {
        static void Main(string[] args)
        {
            for (var i = 1; i < 100; i++)
            {
                DateTime pastDay = RandomValues.RandomPastDay(1, 10000);

                var birthDay = RandomValues.RandomPastDayString(1, 10000);

                var productPrice = RandomValues.RandomFormattedPrice(100, 10000);

                var streetNumber = RandomValues.RandomStreetNumber(100, 900);

                var phoneNumber = RandomValues.RandomPhoneNumber();

                var guidId =Identification.GetGuidId();

                Console.WriteLine(guidId);
            }

            Console.ReadKey();
        }
    }
}
