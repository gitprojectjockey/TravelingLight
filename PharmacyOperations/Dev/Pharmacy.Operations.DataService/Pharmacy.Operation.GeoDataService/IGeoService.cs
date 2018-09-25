using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;

namespace Pharmacy.Operation.GeoDataService
{
    [ServiceContract]
    public interface IGeoService
    {
        [OperationContract]
        [FaultContract(typeof(DataServiceFault))]
        List<OrderGeoDataPoint> GetOrderDataPoints();

        [OperationContract]
        string KnockKnock(string whoIsThere);
    }
  
    [DataContract]
    public class OrderGeoDataPoint
    {
        [DataMember]
        public decimal Latitude { get; set; }
        [DataMember]
        public decimal Longitude { get; set; }
    }
}
