using System;

namespace RandomDataGenerator.Common
{
    public class Identification
    {
        public static string GetGuidId()
        {
            return Guid.NewGuid().ToString();
        }
    }
}
