using System;
namespace RandomDataGenerator.Models.Widget
{
    public class BigWidget : IWidget
    {
        public string Color { get; set; }
        public string Id { get; set; }
        public DateTime ManufactureDate { get; set; }
        public string Name { get; set; }
        public DateTime ShipDate { get; set; }
    }
}
