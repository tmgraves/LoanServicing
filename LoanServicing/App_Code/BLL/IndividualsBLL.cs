using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for IndividualsBLL
/// </summary>
public class IndividualsBLL
{
	public IndividualsBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Get is a method to search for Individuals records
    /// <param name="IndividualID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int IndividualID)
    {
        // Call DataLayer method
        return IndividualsDAL.Get(IndividualID);
    }

    /// <summary>
    /// SearchByEmailPassword is a method to search for Individuals records
    /// <param name="Email">string</param>
    /// <param name="Password">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByEmailPassword(string Email, string Password)
    {
        // Call DataLayer method
        return IndividualsDAL.SearchByEmailPassword(Email, Password);
    }

    /// <summary>
    /// Update is a method to insert/update a Individuals record
    /// <param name="IndividualID">int?</param>
    /// <param name="FirstName">string</param>
    /// <param name="LastName">string</param>
    /// <param name="Email">string</param>
    /// <param name="PhoneNumber">string</param>
    /// <param name="Password">string</param>
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
    public static int? Update(int? IndividualID, string FirstName, string LastName, string Email, string PhoneNumber, string Password, string Address, string City, string State, string Zip, string SSN, string BankName, string AccountNumber, string RoutingNumber)
    {
        // Call DataLayer method
        return IndividualsDAL.Update(IndividualID, FirstName, LastName, Email, PhoneNumber, Password, Address, City, State, Zip, SSN, BankName, AccountNumber, RoutingNumber);
    }

    /// <summary>
    /// UpdatePassword is a method to insert/update a Individuals record
    /// <param name="IndividualID">int?</param>
    /// <param name="Password">string</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdatePassword(int? IndividualID, string Password)
    {
        // Call DataLayer method
        return IndividualsDAL.Update(IndividualID, null, null, null, null, Password, null, null, null, null, null, null, null, null);
    }

    /// <summary>
    /// ValidateUser is a method to search for Individuals records
    /// <param name="Username">string</param>
    /// <returns>bool</returns>
    /// </summary>
    public static bool ValidateUser(string Email, string Password)
    {
        // Call DataLayer method
        return SearchByEmailPassword(Email, Password).Tables[0].Rows.Count == 1;
    }

    /// <summary>
    /// SearchByEmail is a method to search for Individuals records
    /// <param name="Email">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByEmail(string Email)
    {
        // Call DataLayer method
        return IndividualsDAL.SearchByEmail(Email);
    }

    /// <summary>
    /// CheckRole is a method to search for Individuals records
    /// <param name="Email">string</param>
    /// <param name="Role">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static bool CheckRole(string Email, string Role)
    {
        // Call DataLayer method
        return IndividualsDAL.CheckRole(Email, Role);
    }

    /// <summary>
    /// Search is a method to search for Individuals records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search()
    {
        // Call DataLayer method
        return IndividualsDAL.Search();
    }
    /// <summary>
    /// SearchByRoles is a method to search for Individuals records
    /// <param name="Roles">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByRoles(string Roles)
    {
        // Call DataLayer method
        return IndividualsDAL.SearchByRoles(Roles);
    }
}