using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for StatementsDAL
/// </summary>
public class StatementsDAL
{
	public StatementsDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// GetBorrowerStatementDates is a method to search for Loans records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetBorrowerStatementDates(int LoanID)
    {
        // Declare variables
        DataSet dsLoans = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_StatementDates", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoans);

        return dsLoans;
    }

    /// <summary>
    /// GetStatementSchedule is a method to search for Loans records
    /// <param name="LoanID">int</param>
    /// <param name="LoanDay">DateTime</param>
    /// <param name="LoanEndDay">DateTime?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetStatementSchedule(int LoanID, DateTime LoanDay, DateTime? LoanEndDay)
    {
        // Declare variables
        DataSet dsLoans = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_LoanSchedules_GenerateBorrowerStatement", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@LoanDay", LoanDay);
        cmd.Parameters.AddWithValue("@LoanEndDay", LoanEndDay);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoans);

        return dsLoans;
    }

    /// <summary>
    /// GetLoan is a method to search for Loans records
    /// <param name="LoanID">int</param>
    /// <param name="LoanStartDate">DateTime</param>
    /// <param name="LoanEndDate">DateTime</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetLoan(int LoanID, DateTime LoanStartDate, DateTime LoanEndDate)
    {
        // Declare variables
        DataSet dsLoans = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Loans_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@LoanStartDate", LoanStartDate);
        cmd.Parameters.AddWithValue("@LoanEndDate", LoanEndDate);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsLoans);

        return dsLoans;
    }

    /// <summary>
    /// GetInvestorIncome is a method to search for Loans records
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int?</param>
    /// <param name="StartDate">DateTime</param>
    /// <param name="EndDate">DateTime</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetInvestorIncome(int InvestorID, int? LoanID, DateTime StartDate, DateTime EndDate)
    {
        // Declare variables
        DataSet dsStatement = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Statements_InvestorIncome", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);
        cmd.Parameters.AddWithValue("@StartDate", StartDate);
        cmd.Parameters.AddWithValue("@EndDate", EndDate);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsStatement);

        return dsStatement;
    }

    /// <summary>
    /// GetInvestorDates is a method to search for Loans records
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetInvestorDates(int InvestorID, int? LoanID)
    {
        // Declare variables
        DataSet dsStatement = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Statements_InvestorDates", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@InvestorID", InvestorID);
        cmd.Parameters.AddWithValue("@LoanID", LoanID);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsStatement);

        return dsStatement;
    }

    /// <summary>
    /// GetLoansForDay is a method to search for Loans records
    /// <param name="Day">DateTime?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetLoansForDay(DateTime? Day)
    {
        // Declare variables
        DataSet dsStatement = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Statements_GetLoansForDay", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@Day", Day);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsStatement);

        return dsStatement;
    }

    /// <summary>
    /// GetActiveInvestors is a method to search for Investors records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetActiveInvestors()
    {
        // Declare variables
        DataSet dsInvestors = new DataSet();

        // Create connection, create command, add paramteres and fill dataset
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlData"].ToString());
        SqlCommand cmd = new SqlCommand("usp_Investors_Search", con);
        cmd.CommandType = CommandType.StoredProcedure;

        // Add params
        cmd.Parameters.AddWithValue("@ActiveInvestor", 1);

        // Connect and fill dataset
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dsInvestors);

        return dsInvestors;
    }
}