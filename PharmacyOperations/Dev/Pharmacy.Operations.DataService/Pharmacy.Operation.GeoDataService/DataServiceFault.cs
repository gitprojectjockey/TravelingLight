using System.Runtime.Serialization;

namespace Pharmacy.Operation.GeoDataService
{
    [DataContract]
    public class DataServiceFault
    {
        [DataMember]
        public bool Result { get; set; }
        [DataMember]
        public string FaultMessage { get; set; }
        [DataMember]
        public string FaultDescription { get; set; }
    }
}