using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for ServicersDAL
/// </summary>
public class ServicersDAL
{
	public ServicersDAL()
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
        // Declare variables
        DataSet dsServicers = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Servicers_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@ServicerID", ServicerID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsServicers);

        return dsServicers;
    }

    /// <summary>
    /// Search is a method to search for Servicers records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search()
    {
        // Declare variables
        DataSet dsServicers = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Servicers_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsServicers);

        return dsServicers;
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
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Servicers_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@IndividualID", IndividualID);
        cmd.Parameters.AddWithValue("@IndividualFirstName", IndividualFirstName);
        cmd.Parameters.AddWithValue("@IndividualLastName", IndividualLastName);
        cmd.Parameters.AddWithValue("@IndividualEmail", IndividualEmail);
        cmd.Parameters.AddWithValue("@IndividualPhoneNumber", IndividualPhoneNumber);
        cmd.Parameters.AddWithValue("@IndividualPassword", IndividualPassword);
        cmd.Parameters.AddWithValue("@IndividualAddress", IndividualAddress);
        cmd.Parameters.AddWithValue("@IndividualCity", IndividualCity);
        cmd.Parameters.AddWithValue("@IndividualState", IndividualState);
        cmd.Parameters.AddWithValue("@IndividualZip", IndividualZip);
        cmd.Parameters.AddWithValue("@IndividualSSN", IndividualSSN);
        cmd.Parameters.AddWithValue("@IndividualBankName", IndividualBankName);
        cmd.Parameters.AddWithValue("@IndividualAccountNumber", IndividualAccountNumber);
        cmd.Parameters.AddWithValue("@IndividualRoutingNumber", IndividualRoutingNumber);
        SqlParameter pServicerID = cmd.Parameters.Add("@ServicerID", SqlDbType.Int);
        pServicerID.Direction = ParameterDirection.InputOutput;
        pServicerID.Value = ServicerID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            ServicerID = Int32.Parse(cmd.Parameters["@ServicerID"].Value.ToString());

        // Close Connection
        con.Close();

        return ServicerID;
    }

    /// <summary>
    /// Delete is a method to delete a Servicer record
    /// <param name="ServicerID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void Delete(int ServicerID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Servicers_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@ServicerID", ServicerID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}