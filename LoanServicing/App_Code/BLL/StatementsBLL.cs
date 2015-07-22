using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for StatementsBLL
/// </summary>
public class StatementsBLL
{
	public StatementsBLL()
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
        // Call DataLayer method
        return StatementsDAL.GetBorrowerStatementDates(LoanID);
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
        // Call DataLayer method
        return StatementsDAL.GetStatementSchedule(LoanID, LoanDay, LoanEndDay);
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
        // Call DataLayer method
        return StatementsDAL.GetLoan(LoanID, LoanStartDate, LoanEndDate);
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
        // Call DataLayer method
        return StatementsDAL.GetInvestorIncome(InvestorID, LoanID, StartDate, EndDate);
    }

    /// <summary>
    /// GetInvestorDates is a method to search for Loans records
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetInvestorDates(int InvestorID, int? LoanID)
    {
        // Call DataLayer method
        return StatementsDAL.GetInvestorDates(InvestorID, LoanID);
    }

    /// <summary>
    /// GetLoansForDay is a method to search for Loans records
    /// <param name="Day">DateTime?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetLoansForDay(DateTime? Day)
    {
        // Call DataLayer method
        return StatementsDAL.GetLoansForDay(Day);
    }

    /// <summary>
    /// GetActiveInvestors is a method to search for Investors records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetActiveInvestors()
    {
        // Call DataLayer method
        return StatementsDAL.GetActiveInvestors();
    }
}