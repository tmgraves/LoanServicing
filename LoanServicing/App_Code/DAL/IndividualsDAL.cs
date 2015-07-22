using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for Data
/// </summary>
public class IndividualsDAL
{
    public IndividualsDAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// Get is a method to search for Individuals records
    /// <param name="IndividualID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int? IndividualID)
    {
        // Declare variables
        DataSet dsIndividuals = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Individuals_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@IndividualID", IndividualID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsIndividuals);

        return dsIndividuals;
    }

    /// <summary>
    /// SearchByEmailPassword is a method to search for Individuals records
    /// <param name="Email">string</param>
    /// <param name="Password">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByEmailPassword(string Email, string Password)
    {
        // Declare variables
        DataSet dsIndividuals = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Individuals_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Email", Email);
        cmd.Parameters.AddWithValue("@Password", Password);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsIndividuals);

        return dsIndividuals;
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
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Individuals_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@FirstName", FirstName);
        cmd.Parameters.AddWithValue("@LastName", LastName);
        cmd.Parameters.AddWithValue("@Email", Email);
        cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
        cmd.Parameters.AddWithValue("@Password", Password);
        cmd.Parameters.AddWithValue("@Address", Address);
        cmd.Parameters.AddWithValue("@City", City);
        cmd.Parameters.AddWithValue("@State", State);
        cmd.Parameters.AddWithValue("@Zip", Zip);
        cmd.Parameters.AddWithValue("@SSN", SSN);
        cmd.Parameters.AddWithValue("@BankName", BankName);
        cmd.Parameters.AddWithValue("@AccountNumber", AccountNumber);
        cmd.Parameters.AddWithValue("@RoutingNumber", RoutingNumber);
        SqlParameter pIndividualID = cmd.Parameters.Add("@IndividualID", SqlDbType.Int);
        pIndividualID.Direction = ParameterDirection.InputOutput;
        pIndividualID.Value = IndividualID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            IndividualID = Int32.Parse(cmd.Parameters["@IndividualID"].Value.ToString());

        // Close Connection
        con.Close();

        return IndividualID;
    }
    /// <summary>
    /// SearchByEmail is a method to search for Individuals records
    /// <param name="Email">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByEmail(string Email)
    {
        // Declare variables
        DataSet dsIndividuals = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Individuals_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Email", Email);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsIndividuals);

        return dsIndividuals;
    }

    /// <summary>
    /// CheckRole is a method to search for Individuals records
    /// <param name="Email">string</param>
    /// <param name="Role">string</param>
    /// <returns>bool</returns>
    /// </summary>
    public static bool CheckRole(string Email, string Role)
    {
        // Declare variables
        DataSet dsIndividuals = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Individuals_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Email", Email);
        cmd.Parameters.AddWithValue("@Role", Role);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsIndividuals);

        return dsIndividuals.Tables[0].Rows.Count == 1;
    }

    /// <summary>
    /// Search is a method to search for Individuals records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search()
    {
        // Declare variables
        DataSet dsIndividuals = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Individuals_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsIndividuals);

        return dsIndividuals;
    }

    /// <summary>
    /// SearchByRoles is a method to search for Individuals records
    /// <param name="Roles">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByRoles(string Roles)
    {
        // Declare variables
        DataSet dsIndividuals = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Individuals_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Roles", Roles);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsIndividuals);

        return dsIndividuals;
    }
}
