using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for PaymentsDAL
/// </summary>
public class PaymentsDAL
{
	public PaymentsDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// SearchDistributions is a method to search for Distributions records
    /// <param name="PaymentID">int?</param>
    /// <param name="InvestorID">int?</param>
    /// <param name="Paid">bool?</param>
    /// <param name="PaymentMethodID">int?</param>
    /// <param name="PaymentNumber">string</param>
    /// <param name="ServicingFee">bool?</param>
    /// <param name="LoanID">int?</param>
    /// <param name="IndividualID">int?</param>
    /// <param name="DistributionDate">DateTime?</param>
    /// <param name="DistributionPaymentID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchDistributions(int? PaymentID, int? InvestorID = null, bool? Paid = null, int? PaymentMethodID = null, string PaymentNumber = null, bool? ServicingFee = null, int? LoanID = null, int? IndividualID = null, DateTime? DistributionDate = null, int? DistributionPaymentID = null)
    {
        // Declare variables
        DataSet dsDistributions = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Distributions_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@PaymentID", PaymentID);
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);
        cmd.Parameters.AddWithValue("@Paid", Paid == null ? null : (int?)(Convert.ToBoolean(Paid) ? 1 : 0));
        cmd.Parameters.AddWithValue("@PaymentMethodID", PaymentMethodID);
        cmd.Parameters.AddWithValue("@PaymentNumber", PaymentNumber);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@ServicingFee", ServicingFee == null ? null : (int?)(Convert.ToBoolean(ServicingFee) ? 1 : 0));
        cmd.Parameters.AddWithValue("@IndividualID", IndividualID);
        cmd.Parameters.AddWithValue("@DistributionDate", DistributionDate);
        cmd.Parameters.AddWithValue("@DistributionPaymentID", DistributionPaymentID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsDistributions);

        return dsDistributions;
    }

    /// <summary>
    /// GetDistribution is a method to search for Distributions records
    /// <param name="DistributionID">int</param>
    /// <param name="PaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistribution(int DistributionID, int PaymentID)
    {
        // Declare variables
        DataSet dsDistributions = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Distributions_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@DistributionID", DistributionID);
        cmd.Parameters.AddWithValue("@PaymentID", PaymentID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsDistributions);

        return dsDistributions;
    }

    /// <summary>
    /// UpdateDistribution is a method to insert/update a Distributions record
    /// <param name="DistributionID">int?</param>
    /// <param name="DistributionDate">DateTime?</param>
    /// <param name="PaymentMethodID">int?</param>
    /// <param name="PaymentNumber">string</param>
    /// <param name="DistributionPaymentID">int?</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdateDistribution(int? DistributionID, DateTime? DistributionDate, int? PaymentMethodID, string PaymentNumber, int? DistributionPaymentID = null)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Distributions_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@DistributionDate", DistributionDate);
        cmd.Parameters.AddWithValue("@PaymentMethodID", PaymentMethodID);
        cmd.Parameters.AddWithValue("@PaymentNumber", PaymentNumber == "" ? null : PaymentNumber);
        cmd.Parameters.AddWithValue("@DistributionPaymentID", DistributionPaymentID);
        SqlParameter pDistributionID = cmd.Parameters.Add("@DistributionID", SqlDbType.Int);
        pDistributionID.Direction = ParameterDirection.InputOutput;
        pDistributionID.Value = DistributionID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            DistributionID = Int32.Parse(cmd.Parameters["@DistributionID"].Value.ToString());

        // Close Connection
        con.Close();

        return DistributionID;
    }

    /// <summary>
    /// SearchDistributionPayments is a method to search for DistributionPayments records
    /// <param name="IndividualID">int?</param>
    /// <param name="DistributionDate">DateTime?</param>
    /// <param name="PaymentNumber">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchDistributionPayments(int? IndividualID, DateTime? DistributionDate, string PaymentNumber, int? DistributionPaymentID = null)
    {
        // Declare variables
        DataSet dsDistributionPayments = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_DistributionPayments_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@IndividualID", IndividualID);
        cmd.Parameters.AddWithValue("@DistributionDate", DistributionDate);
        cmd.Parameters.AddWithValue("@PaymentNumber", PaymentNumber);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsDistributionPayments);

        return dsDistributionPayments;
    }

    /// <summary>
    /// GetDistributionPayment is a method to search for DistributionPayments records
    /// <param name="DistributionPaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistributionPayment(int DistributionPaymentID)
    {
        // Declare variables
        DataSet dsDistributionPayments = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_DistributionPayments_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@DistributionPaymentID", DistributionPaymentID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsDistributionPayments);

        return dsDistributionPayments;
    }

    /// <summary>
    /// GetDistributionPaymentIndividualTotals is a method to search for Individuals for a DistributionPayment records
    /// <param name="DistributionPaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistributionPaymentIndividualTotals(int DistributionPaymentID)
    {
        // Declare variables
        DataSet dsIndividualTotals = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_DistributionPayments_IndividualTotals", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@DistributionPaymentID", DistributionPaymentID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsIndividualTotals);

        return dsIndividualTotals;
    }

    /// <summary>
    /// UpdateDistributionPayment is a method to insert/update a DistributionPayments record
    /// <param name="DistributionPaymentID">int?</param>
    /// <param name="Amount">float?</param>
    /// <param name="DistributionDate">DateTime?</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdateDistributionPayment(int? DistributionPaymentID, float? Amount, DateTime? DistributionDate)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_DistributionPayments_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Amount", Amount);
        cmd.Parameters.AddWithValue("@DistributionDate", DistributionDate);
        SqlParameter pDistributionPaymentID = cmd.Parameters.Add("@DistributionPaymentID", SqlDbType.Int);
        pDistributionPaymentID.Direction = ParameterDirection.InputOutput;
        pDistributionPaymentID.Value = DistributionPaymentID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            DistributionPaymentID = Int32.Parse(cmd.Parameters["@DistributionPaymentID"].Value.ToString());

        // Close Connection
        con.Close();

        return DistributionPaymentID;
    }

    /// <summary>
    /// DeleteDistributionPayment is a method to delete a Distribution Payment record
    /// <param name="DistributionPaymentID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeleteDistributionPayment(int DistributionPaymentID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_DistributionPayments_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@DistributionPaymentID", DistributionPaymentID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}