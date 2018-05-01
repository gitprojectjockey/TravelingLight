namespace RandomDataGenerator.Data.Entities
{
    public abstract class EntityBase
    {
        public int Id { get; set; }
        public virtual string Name { get; set; }
    }
}
