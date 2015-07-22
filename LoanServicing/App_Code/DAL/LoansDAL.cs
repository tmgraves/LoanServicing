using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;


/// <summary>
/// Summary description for LoansDAL
/// </summary>
public class LoansDAL
{
	public LoansDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Search is a method to search for Loans records
    /// <param name="Closed">bool?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search(bool? Closed = null)
    {
        // Declare variables
        DataSet dsLoans = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Closed", Closed == null ? null : (int?)(Convert.ToBoolean(Closed) ? 1 : 0));

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoans);

        return dsLoans;
    }

    /// <summary>
    /// Get is a method to search for Loans records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int LoanID)
    {
        // Declare variables
        DataSet dsLoans = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoans);

        return dsLoans;
    }

    /// <summary>
    /// SearchByInvestor is a method to search for Loans records
    /// <param name="InvestorID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByInvestor(int InvestorID)
    {
        // Declare variables
        DataSet dsLoans = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoans);

        return dsLoans;
    }

    /// <summary>
    /// SearchByBorrower is a method to search for Loans records
    /// <param name="BorrowerID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByBorrower(int BorrowerID)
    {
        // Declare variables
        DataSet dsLoans = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@BorrowerID", BorrowerID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoans);

        return dsLoans;
    }

    /// <summary>
    /// Update is a method to insert/update a Loans record
    /// <param name="LoanID">int?</param>
    /// <param name="Name">string</param>
    /// <param name="BorrowerID">int?</param>
    /// <param name="StartDate">DateTime?</param>
    /// <param name="Rate">decimal?</param>
    /// <param name="Principal">decimal?</param>
    /// <param name="Penalty">decimal?</param>
    /// <param name="PrepaymentPenaltyPeriod">int?</param>
    /// <param name="PaymentAmount">decimal?</param>
    /// <param name="PaymentDay">int?</param>
    /// <param name="GracePeriod">int?</param>
    /// <param name="Term">int?</param>
    /// <param name="PropertyAddress">string</param>
    /// <param name="PropertyCity">string</param>
    /// <param name="PropertyState">string</param>
    /// <param name="PropertyZip">string</param>
    /// <param name="Closed">DateTime?</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? Update(int? LoanID, string Name, int? BorrowerID, DateTime? StartDate, decimal? Rate, decimal? Principal, decimal? Penalty, int? PrepaymentPenaltyPeriod, decimal? PaymentAmount, int? PaymentDay, int? GracePeriod, int? Term, string PropertyAddress = null, string PropertyCity = null, string PropertyState = null, string PropertyZip = null, DateTime? Closed = null)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Name", Name);
        cmd.Parameters.AddWithValue("@BorrowerID", BorrowerID);
        cmd.Parameters.AddWithValue("@StartDate", StartDate);
        cmd.Parameters.AddWithValue("@Rate", Rate);
        cmd.Parameters.AddWithValue("@Principal", Principal);
        cmd.Parameters.AddWithValue("@Penalty", Penalty);
        cmd.Parameters.AddWithValue("@PrepaymentPenaltyPeriod", PrepaymentPenaltyPeriod);
        cmd.Parameters.AddWithValue("@PaymentAmount", PaymentAmount);
        cmd.Parameters.AddWithValue("@PaymentDay", PaymentDay);
        cmd.Parameters.AddWithValue("@GracePeriod", GracePeriod);
        cmd.Parameters.AddWithValue("@Term", Term);
        cmd.Parameters.AddWithValue("@PropertyAddress", PropertyAddress);
        cmd.Parameters.AddWithValue("@PropertyCity", PropertyCity);
        cmd.Parameters.AddWithValue("@PropertyState", PropertyState);
        cmd.Parameters.AddWithValue("@PropertyZip", PropertyZip);
        cmd.Parameters.AddWithValue("@Closed", Closed);
        SqlParameter pLoanID = cmd.Parameters.Add("@LoanID", SqlDbType.Int);
        pLoanID.Direction = ParameterDirection.InputOutput;
        pLoanID.Value = LoanID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            LoanID = Int32.Parse(cmd.Parameters["@LoanID"].Value.ToString());

        // Close Connection
        con.Close();

        return LoanID;
    }

    /// <summary>
    /// SearchSchedule is a method to search for LoanSchedules records
    /// <param name="LoanID">int</param>
    /// <param name="LoanDay">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchSchedule(int LoanID, string LoanDay)
    {
        // Declare variables
        DataSet dsLoanSchedules = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_LoanSchedules_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@LoanDay", LoanDay);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoanSchedules);

        return dsLoanSchedules;
    }

    /// <summary>
    /// GetSchedule is a method to search for LoanSchedules records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetSchedule(int LoanID)
    {
        // Declare variables
        DataSet dsLoanSchedules = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_LoanSchedules_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoanSchedules);

        return dsLoanSchedules;
    }

    /// <summary>
    /// GetPayments is a method to search for Payments records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPayments(int LoanID)
    {
        // Declare variables
        DataSet dsPayments = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Payments_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsPayments);

        return dsPayments;
    }

    /// <summary>
    /// GetPayment is a method to search for Payments records
    /// <param name="PaymentID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPayment(int PaymentID, int? LoanID = null)
    {
        // Declare variables
        DataSet dsPayments = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Payments_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@PaymentID", PaymentID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsPayments);

        return dsPayments;
    }

    /// <summary>
    /// UpdatePayment is a method to insert/update a Payments record
    /// <param name="PaymentID">int?</param>
    /// <param name="LoanID">int?</param>
    /// <param name="Amount">decimal?</param>
    /// <param name="PaymentDate">DateTime?</param>
    /// <param name="PaymentNumber">string</param>
    /// <param name="Description">string</param>
    /// <param name="PaymentMethodID">int?</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdatePayment(int? PaymentID, int? LoanID, decimal? Amount, DateTime? PaymentDate, string PaymentNumber, string Description, int? PaymentMethodID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Payments_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@Amount", Amount);
        cmd.Parameters.AddWithValue("@PaymentDate", PaymentDate);
        cmd.Parameters.AddWithValue("@PaymentNumber", PaymentNumber);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@PaymentMethodID", PaymentMethodID);
        SqlParameter pPaymentID = cmd.Parameters.Add("@PaymentID", SqlDbType.Int);
        pPaymentID.Direction = ParameterDirection.InputOutput;
        pPaymentID.Value = PaymentID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            PaymentID = Int32.Parse(cmd.Parameters["@PaymentID"].Value.ToString());

        // Close Connection
        con.Close();

        return PaymentID;
    }

    /// <summary>
    /// DeletePayment is a method to delete a Loan record
    /// <param name="PaymentID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeletePayment(int PaymentID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Payments_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@PaymentID", PaymentID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    /// <summary>
    /// Delete is a method to delete a Loan record
    /// <param name="LoanID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void Delete(int LoanID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    /// <summary>
    /// GetPenalties is a method to search for Penalties records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPenalties(int LoanID)
    {
        // Declare variables
        DataSet dsPenalties = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Penalties_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsPenalties);

        return dsPenalties;
    }

    /// <summary>
    /// GetPenalty is a method to search for Penalties records
    /// <param name="PenaltyID">int</param>
    /// <param name="LoanID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPenalty(int PenaltyID, int? LoanID = null)
    {
        // Declare variables
        DataSet dsPenalties = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Penalties_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@PenaltyID", PenaltyID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsPenalties);

        return dsPenalties;
    }

    /// <summary>
    /// UpdatePenalty is a method to insert/update a Penalties record
    /// <param name="PenaltyID">int?</param>
    /// <param name="LoanID">int?</param>
    /// <param name="Amount">decimal?</param>
    /// <param name="PenaltyDate">DateTime?</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdatePenalty(int? PenaltyID, int? LoanID, decimal? Amount, DateTime? PenaltyDate)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Penalties_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@Amount", Amount);
        cmd.Parameters.AddWithValue("@PenaltyDate", PenaltyDate);
        SqlParameter pPenaltyID = cmd.Parameters.Add("@PenaltyID", SqlDbType.Int);
        pPenaltyID.Direction = ParameterDirection.InputOutput;
        pPenaltyID.Value = PenaltyID;

        con.Open();

        // Run Command
        if (cmd.ExecuteNonQuery() == -1)
            PenaltyID = Int32.Parse(cmd.Parameters["@PenaltyID"].Value.ToString());

        // Close Connection
        con.Close();

        return PenaltyID;
    }

    /// <summary>
    /// DeletePenalty is a method to delete a Loan record
    /// <param name="PenaltyID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeletePenalty(int PenaltyID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Penalties_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@PenaltyID", PenaltyID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    /// <summary>
    /// GetInvestors is a method to search for Investors records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetInvestors(int LoanID)
    {
        // Declare variables
        DataSet dsInvestors = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsInvestors);

        return dsInvestors;
    }

    /// <summary>
    /// GetInvestor is a method to search for Investors records
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetInvestor(int InvestorID, int LoanID)
    {
        // Declare variables
        DataSet dsInvestors = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsInvestors);

        return dsInvestors;
    }

    /// <summary>
    /// DeleteInvestor is a method to delete a Loan/Investor record
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeleteInvestor(int InvestorID, int LoanID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Loans_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    /// <summary>
    /// UpdateInvestor is a method to insert/update a Investors_Loans record
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int</param>
    /// <param name="Investment">decimal?</param>
    /// <param name="ServicingRate">decimal?</param>
    /// <returns>int?</returns>
    /// </summary>
    public static void UpdateInvestor(int InvestorID, int LoanID, decimal? Investment, decimal? ServicingRate)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Loans_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@Investment", Investment);
        cmd.Parameters.AddWithValue("@ServicingRate", ServicingRate);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    /// <summary>
    /// UpdateServicer is a method to insert/update a Servicers_Loans record
    /// <param name="ServicerID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>int?</returns>
    /// </summary>
    public static void UpdateServicer(int ServicerID, int LoanID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Servicers_Loans_Update", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@ServicerID", ServicerID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    /// <summary>
    /// DeleteServicer is a method to delete a Loan/Investor record
    /// <param name="ServicerID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeleteServicer(int ServicerID, int LoanID)
    {
        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Servicers_Loans_Delete", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@ServicerID", ServicerID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    /// <summary>
    /// GetServicers is a method to search for Servicers records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetServicers(int LoanID)
    {
        // Declare variables
        DataSet dsServicers = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Servicers_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsServicers);

        return dsServicers;
    }

    /// <summary>
    /// GetDistributions is a method to search for Distributions records
    /// <param name="LoanID">int</param>
    /// <param name="Paid">bool?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistributions(int LoanID, bool? Paid)
    {
        // Declare variables
        DataSet dsDistributions = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Distributions_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@Paid", Paid == null ? null : (int?)(Convert.ToBoolean(Paid) ? 1 : 0));

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsDistributions);

        return dsDistributions;
    }
}