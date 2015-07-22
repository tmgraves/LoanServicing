using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for InvestorsDAL
/// </summary>
public class InvestorsDAL
{
	public InvestorsDAL()
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
        // Declare variables
        DataSet dsInvestors = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsInvestors);

        return dsInvestors;
    }

    /// <summary>
    /// SearchByIndividualID is a method to search for Investors records
    /// <param name="IndividualID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByIndividualID(int IndividualID)
    {
        // Declare variables
        DataSet dsInvestors = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@IndividualID", IndividualID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsInvestors);

        return dsInvestors;
    }

    /// <summary>
    /// Get is a method to search for Investors records
    /// <param name="InvestorID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int InvestorID)
    {
        // Declare variables
        DataSet dsInvestors = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsInvestors);

        return dsInvestors;
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
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@IndividualID", IndividualID);
        cmd.Parameters.AddWithValue("@IndividualFirstName", FirstName);
        cmd.Parameters.AddWithValue("@IndividualLastName", LastName);
        cmd.Parameters.AddWithValue("@IndividualEmail", Email);
        cmd.Parameters.AddWithValue("@IndividualPhoneNumber", PhoneNumber);
        cmd.Parameters.AddWithValue("@IndividualAddress", Address);
        cmd.Parameters.AddWithValue("@IndividualCity", City);
        cmd.Parameters.AddWithValue("@IndividualState", State);
        cmd.Parameters.AddWithValue("@IndividualZip", Zip);
        cmd.Parameters.AddWithValue("@IndividualSSN", SSN);
        cmd.Parameters.AddWithValue("@IndividualBankName", BankName);
        cmd.Parameters.AddWithValue("@IndividualAccountNumber", AccountNumber);
        cmd.Parameters.AddWithValue("@IndividualRoutingNumber", RoutingNumber);
        SqlParameter pInvestorID = cmd.Parameters.Add("@InvestorID", SqlDbType.Int);
        pInvestorID.Direction = ParameterDirection.InputOutput;
        pInvestorID.Value = InvestorID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            InvestorID = Int32.Parse(cmd.Parameters["@InvestorID"].Value.ToString());

        // Close Connection
        con.Close();

        return InvestorID;
    }
}