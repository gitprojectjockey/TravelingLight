using System;

namespace RRDDataGenerator.Common
{
    public static class RandomValues
    {
        public static DateTime RandomPastDay(int min, int max)
        {

            Random generator = new Random(Guid.NewGuid().GetHashCode());
            DateTime start = new DateTime(1995, 1, 1);
            return start.AddDays(-generator.Next(min, max));
        }

        public static string RandomPastDayString(int min, int max)
        {
            Random generator = new Random(Guid.NewGuid().GetHashCode());
            DateTime start = new DateTime(1980, 1, 1);
            return start.AddDays(-generator.Next(min, max)).ToShortDateString();
        }

        public static int RandomInteger(int min, int max)
        {
            Random generator = new Random(Guid.NewGuid().GetHashCode());
            return generator.Next(min, max);
        }

        public static string RandomIntegerString(int min, int max)
        {
            Random generator = new Random(Guid.NewGuid().GetHashCode());
            return generator.Next(min, max).ToString();
        }

        public static string RandomFormattedPrice(int min, int max)
        {
            Random generator = new Random(Guid.NewGuid().GetHashCode());
            return string.Format("{0:C2}",generator.Next(min, max));
        }

        public static string RandomStreetNumber(int min, int max)
        {
            Random generator = new Random(Guid.NewGuid().GetHashCode());
            return generator.Next(min, max).ToString();
        }

        public static string RandomPhoneNumber()
        {
            Random generator = new Random(Guid.NewGuid().GetHashCode());
            var phoneNumber = string.Empty;
            for (var i = 1; i < 11; i++)
            {
                if (i == 4 || i == 7)
                {
                    phoneNumber += "-";
                }
                phoneNumber += generator.Next(10);
            }
            return phoneNumber;
        }
    }
}
