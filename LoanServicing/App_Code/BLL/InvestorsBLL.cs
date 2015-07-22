using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for InvestorsBLL
/// </summary>
public class InvestorsBLL
{
	public InvestorsBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Search is a method to search for Investors records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search()
    {
        // Call DataLayer method
        return InvestorsDAL.Search();
    }

    /// <summary>
    /// SearchByIndividualID is a method to search for Investors records
    /// <param name="IndividualID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByIndividualID(int IndividualID)
    {
        // Call DataLayer method
        return InvestorsDAL.SearchByIndividualID(IndividualID);
    }

    /// <summary>
    /// Get is a method to search for Investors records
    /// <param name="InvestorID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int InvestorID)
    {
        // Call DataLayer method
        return InvestorsDAL.Get(InvestorID);
    }

    /// <summary>
    /// Update is a method to insert/update a Investors record
    /// <param name="InvestorID">int?</param>
    /// <param name="IndividualID">int?</param>
    /// <param name="FirstName">string</param>
    /// <param name="LastName">string</param>
    /// <param name="Email">string</param>
    /// <param name="PhoneNumber">string</param>
    /// <param name="Address">string</param>
    /// <param name="City">string</param>
    /// <param name="State">string</param>
    /// <param name="Zip">string</param>
    /// <param name="SSN">string</param>
    /// <param name="BankName">string</param>
    /// <param name="AccountNumber">string</param>
    /// <param name="RoutingNumber">string</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? Update(int? InvestorID, int? IndividualID, string FirstName, string LastName, string Email, string PhoneNumber, string Address, string City, string State, string Zip, string SSN, string BankName, string AccountNumber, string RoutingNumber)
    {
        // Call DataLayer method
        return InvestorsDAL.Update(InvestorID, IndividualID, FirstName, LastName, Email, PhoneNumber, Address, City, State, Zip, SSN, BankName, AccountNumber, RoutingNumber);
    }
}