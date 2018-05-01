using System;

namespace RRDDataGenerator.Common
{
    public static class Identification
    {
        public static string GetGuidId()
        {
            return Guid.NewGuid().ToString();
        }
    }
}
