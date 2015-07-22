using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for BorrowersDAL
/// </summary>
public class BorrowersDAL
{
	public BorrowersDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Get is a method to search for Borrowers records
    /// <param name="BorrowerID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int? BorrowerID)
    {
        // Declare variables
        DataSet dsBorrowers = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Borrowers_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@BorrowerID", BorrowerID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsBorrowers);

        return dsBorrowers;
    }

    /// <summary>
    /// Search is a method to search for Borrowers records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search()
    {
        // Declare variables
        DataSet dsBorrowers = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Borrowers_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsBorrowers);

        return dsBorrowers;
    }

    /// <summary>
    /// SearchByIndividualID is a method to search for Borrowers records
    /// <param name="IndividualID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByIndividualID(int? IndividualID)
    {
        // Declare variables
        DataSet dsBorrowers = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Borrowers_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@IndividualID", IndividualID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsBorrowers);

        return dsBorrowers;
    }

    /// <summary>
    /// Update is a method to insert/update a Borrowers record
    /// <param name="BorrowerID">int?</param>
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
    public static int? Update(int? BorrowerID, int? IndividualID, string FirstName, string LastName, string Email, string PhoneNumber, string Address, string City, string State, string Zip, string SSN, string BankName, string AccountNumber, string RoutingNumber)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Borrowers_Update", con);
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
        SqlParameter pBorrowerID = cmd.Parameters.Add("@BorrowerID", SqlDbType.Int);
        pBorrowerID.Direction = ParameterDirection.InputOutput;
        pBorrowerID.Value = BorrowerID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            BorrowerID = Int32.Parse(cmd.Parameters["@BorrowerID"].Value.ToString());

        // Close Connection
        con.Close();

        return BorrowerID;
    }

    /// <summary>
    /// Delete is a method to delete a Borrower record
    /// <param name="BorrowerID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void Delete(int BorrowerID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Borrowers_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@BorrowerID", BorrowerID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}