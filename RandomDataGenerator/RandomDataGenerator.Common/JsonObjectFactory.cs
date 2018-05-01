using Newtonsoft.Json;
using System;

namespace RandomDataGenerator.Common
{
    public class JsonObjectFactory<TEntity> where TEntity : class, new()
    {
        Type _type = null;
        public JsonObjectFactory()
        {
            _type = typeof(TEntity);
        }

        public string GetJsonObjectString(TEntity entity)
        {
            //Eric Was here
            return JsonConvert.SerializeObject(entity, Formatting.Indented);
        }
    }
}
