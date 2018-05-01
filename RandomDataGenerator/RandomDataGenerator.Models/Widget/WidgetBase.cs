using System;

namespace RandomDataGenerator.Models.Widget
{
    public interface IWidget
    { 
        string Id { get; set; }
        string  Name { get; set; }
        DateTime ManufactureDate { get; set; }
        DateTime ShipDate { get; set; }
        string Color { get; set; }
    }
}
