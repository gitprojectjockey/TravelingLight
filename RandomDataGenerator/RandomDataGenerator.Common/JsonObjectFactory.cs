using Newtonsoft.Json;

namespace RandomDataGenerator.Common
{
    public class JsonObjectFactory<TEntity> where TEntity : class, new()
    {
        public string GetJsonObjectString(TEntity entity)
        {
            JsonConvert.DefaultSettings = () => new JsonSerializerSettings
            {
                Formatting = Formatting.Indented,
                NullValueHandling = NullValueHandling.Ignore,
                DateFormatHandling = DateFormatHandling.IsoDateFormat,
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };

            return JsonConvert.SerializeObject(entity);
        }
    }
}
