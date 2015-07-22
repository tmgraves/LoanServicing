using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for ServicersBLL
/// </summary>
public class ServicersBLL
{
	public ServicersBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Get is a method to search for Servicers records
    /// <param name="ServicerID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int? ServicerID)
    {
        // Call DataLayer method
        return ServicersDAL.Get(ServicerID);
    }

    /// <summary>
    /// Search is a method to search for Servicers records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search()
    {
        // Call DataLayer method
        return ServicersDAL.Search();
    }

    /// <summary>
    /// Update is a method to insert/update a Servicers record
    /// <param name="ServicerID">int?</param>
    /// <param name="IndividualID">int?</param>
    /// <param name="IndividualFirstName">string</param>
    /// <param name="IndividualLastName">string</param>
    /// <param name="IndividualEmail">string</param>
    /// <param name="IndividualPhoneNumber">string</param>
    /// <param name="IndividualPassword">string</param>
    /// <param name="IndividualAddress">string</param>
    /// <param name="IndividualCity">string</param>
    /// <param name="IndividualState">string</param>
    /// <param name="IndividualZip">string</param>
    /// <param name="IndividualSSN">string</param>
    /// <param name="IndividualBankName">string</param>
    /// <param name="IndividualAccountNumber">string</param>
    /// <param name="IndividualRoutingNumber">string</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? Update(int? ServicerID, int? IndividualID, string IndividualFirstName, string IndividualLastName, string IndividualEmail, string IndividualPhoneNumber, string IndividualPassword, string IndividualAddress, string IndividualCity, string IndividualState, string IndividualZip, string IndividualSSN, string IndividualBankName, string IndividualAccountNumber, string IndividualRoutingNumber)
    {
        // Call DataLayer method
        return ServicersDAL.Update(ServicerID, IndividualID, IndividualFirstName, IndividualLastName, IndividualEmail, IndividualPhoneNumber, IndividualPassword, IndividualAddress, IndividualCity, IndividualState, IndividualZip, IndividualSSN, IndividualBankName, IndividualAccountNumber, IndividualRoutingNumber);
    }

    /// <summary>
    /// Delete is a method to delete a Servicer record
    /// <param name="ServicerID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void Delete(int ServicerID)
    {
        // Call DataLayer method
        ServicersDAL.Delete(ServicerID);
    }
}