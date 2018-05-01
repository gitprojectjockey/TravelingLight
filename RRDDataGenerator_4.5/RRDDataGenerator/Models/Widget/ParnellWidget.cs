﻿using System;

namespace RRDDataGenerator.Models.Widget
{
    public class ParnellWidget : WidgetBase
    {
        public override string Color { get; set; }

        public override string Id { get; set; }

        public override DateTime ManufactureDate { get; set; }

        public override string Name { get; set; }

        public override DateTime ShipDate { get; set; }

        public override string GetDescription()
        {
            return $"{Id}-{Name} was manufactured on {ManufactureDate} by (Parnell Widget Specialists) and will be ready to ship on {ShipDate}.";
        }

        public override string ToString()
        {
            return GetDescription();
        }
    }
}