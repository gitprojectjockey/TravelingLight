using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace Pharmacy.Operation.Data
{
    public static class DataPoints
    {
        public static List<DataPoint> GetOrderDestinations()
        {
            
            int offset = TimeZoneInfo.Local.GetUtcOffset(DateTime.Now).Hours;

            string sqlStmt = string.Format(@"
                            SELECT Zip AS Name, NbrOfShipments AS Count, Latitude, Longitude
                            FROM (SELECT DISTINCT ZipCode, Latitude, Longitude FROM Datasheer.dbo.ZIPCode) zc
                            INNER JOIN (
	                            SELECT 
		                            SUBSTRING(PostalCode, 1, 5) AS Zip, 
		                            COUNT(*) AS NbrOfShipments
	                            FROM 
		                            ShipmentWorkflowStatus wfs
		                            INNER JOIN Shipment s ON wfs.ShipmentUID = s.ShipmentUID
		                            INNER JOIN ShipmentAddress sa ON sa.ShipmentUID = s.ShipmentUID
	                            WHERE 
		                            ShipmentWorkflowUID = 1002
	                            AND 
		                            CONVERT(DATE, DATEADD(hh, {0}, wfs.AddDateUTC)) = CONVERT(DATE, DATEADD(hh, {0}, GETUTCDATE()))
	                            AND 
		                            sa.ShipmentAddressTypeUID = 5
	                            GROUP BY 
		                            SUBSTRING(PostalCode, 1, 5)
                            ) data ON zc.ZipCode = data.Zip
                            ORDER BY Zip
                            ", offset);

            try
            {
                string connString = ConfigurationManager.ConnectionStrings["ShippingManager"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand(sqlStmt, connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    var dataPointList = new List<DataPoint>();
                    while (reader.Read())
                    {
                        DataPoint point = new DataPoint()
                        {
                            Latitude = reader.GetDecimal(2),
                            Longitude = reader.GetDecimal(3)
                        };
                        dataPointList.Add(point);
                    }
                    return dataPointList;
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
