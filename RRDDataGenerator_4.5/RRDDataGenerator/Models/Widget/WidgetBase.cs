using System;

namespace RRDDataGenerator.Models.Widget
{
    public abstract class WidgetBase
    { 
        public abstract string Id { get; set; }
        public abstract string  Name { get; set; }
        public abstract DateTime ManufactureDate { get; set; }
        public abstract DateTime ShipDate { get; set; }
        public abstract string Color { get; set; }

        public virtual string GetDescription()
        {
            return $"{Id}-{Name} was manufactured on {ManufactureDate} and will be ready to ship on {ShipDate}.";
        }
    }
}
