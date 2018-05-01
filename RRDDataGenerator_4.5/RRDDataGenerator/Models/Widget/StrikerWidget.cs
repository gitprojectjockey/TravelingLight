using System;

namespace RRDDataGenerator.Models.Widget
{
    public class StrikerWidget : WidgetBase
    {
        public override string Color { get; set; }

        public override string Id { get; set; }

        public override DateTime ManufactureDate { get; set; }

        public override string Name { get; set; }

        public override DateTime ShipDate { get; set; }

        public override string GetDescription()
        {
            return $"{Id}-{Name} was manufactured on {ManufactureDate} by (Striker Widget Group) and will be ready to ship on {ShipDate}.";
        }

        public override string ToString()
        {
            return GetDescription();
        }
    }
}
