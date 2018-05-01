using System;
namespace RandomDataGenerator.Models.Widget
{
    public class ExpertDesignWidget : IWidget
    {
        public string Color { get; set; }
        public string Id { get; set; }
        public DateTime ManufactureDate { get; set; }
        public string Name { get; set; }
        public DateTime ShipDate { get; set; }
    }
}
