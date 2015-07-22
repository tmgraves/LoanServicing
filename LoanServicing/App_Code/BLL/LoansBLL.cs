using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for LoansBLL
/// </summary>
public class LoansBLL
{
	public LoansBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Search is a method to search for Loans records
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search()
    {
        // Call DataLayer method
        return LoansDAL.Search();
    }

    /// <summary>
    /// Search is a method to search for Loans records
    /// <param name="Closed">bool?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Search(bool? Closed)
    {
        // Call DataLayer method
        return LoansDAL.Search(Closed);
    }

    /// <summary>
    /// Get is a method to search for Loans records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet Get(int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.Get(LoanID);
    }

    /// <summary>
    /// SearchByInvestor is a method to search for Loans records
    /// <param name="InvestorID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByInvestor(int InvestorID)
    {
        // Call DataLayer method
        return LoansDAL.SearchByInvestor(InvestorID);
    }

    /// <summary>
    /// SearchByBorrower is a method to search for Loans records
    /// <param name="BorrowerID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchByBorrower(int BorrowerID)
    {
        // Call DataLayer method
        return LoansDAL.SearchByBorrower(BorrowerID);
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
    /// <returns>int?</returns>
    /// </summary>
    public static int? Update(int? LoanID, string Name, int? BorrowerID, DateTime? StartDate, decimal? Rate, decimal? Principal, decimal? Penalty, int? PrepaymentPenaltyPeriod, decimal? PaymentAmount, int? PaymentDay, int? GracePeriod, int? Term)
    {
        // Call DataLayer method
        return LoansDAL.Update(LoanID, Name, BorrowerID, StartDate, Rate, Principal, Penalty, PrepaymentPenaltyPeriod, PaymentAmount, PaymentDay, GracePeriod, Term);
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
        // Call DataLayer method
        return LoansDAL.Update(LoanID, Name, BorrowerID, StartDate, Rate, Principal, Penalty, PrepaymentPenaltyPeriod, PaymentAmount, PaymentDay, GracePeriod, Term, PropertyAddress, PropertyCity, PropertyState, PropertyZip, Closed);
    }

    /// <summary>
    /// SearchSchedule is a method to search for LoanSchedules records
    /// <param name="LoanID">int</param>
    /// <param name="LoanDay">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchSchedule(int LoanID, string LoanDay)
    {
        // Call DataLayer method
        return LoansDAL.SearchSchedule(LoanID, LoanDay);
    }

    /// <summary>
    /// GetSchedule is a method to search for LoanSchedules records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetSchedule(int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetSchedule(LoanID);
    }

    /// <summary>
    /// GetPayments is a method to search for Payments records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPayments(int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetPayments(LoanID);
    }

    /// <summary>
    /// GetPayment is a method to search for Payments records
    /// <param name="PaymentID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPayment(int PaymentID, int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetPayment(PaymentID, LoanID);
    }

    /// <summary>
    /// GetPayment is a method to search for Payments records
    /// <param name="PaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPayment(int PaymentID)
    {
        // Call DataLayer method
        return LoansDAL.GetPayment(PaymentID);
    }

    /// <summary>
    /// UpdatePayment is a method to insert/update a Payments record
    /// <param name="PaymentID">int?</param>
    /// <param name="LoanID">int?</param>
    /// <param name="Amount">decimal?</param>
    /// <param name="PaymentDate">string</param>
    /// <param name="PaymentNumber">DateTime?</param>
    /// <param name="Description">string</param>
    /// <param name="PaymentMethodID">int?</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdatePayment(int? PaymentID, int? LoanID, decimal? Amount, DateTime? PaymentDate, string PaymentNumber, string Description, int? PaymentMethodID)
    {
        // Call DataLayer method
        PaymentID = LoansDAL.UpdatePayment(PaymentID, LoanID, Amount, PaymentDate, PaymentNumber, Description, PaymentMethodID);

        Notifications.PaymentPosted((int)PaymentID);

        return PaymentID;
    }

    /// <summary>
    /// Delete is a method to delete a Loan record
    /// <param name="LoanID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void Delete(int LoanID)
    {
        // Call DataLayer method
        LoansDAL.Delete(LoanID);
    }

    /// <summary>
    /// DeletePayment is a method to delete a Loan record
    /// <param name="PaymentID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeletePayment(int PaymentID)
    {
        // Call DataLayer method
        LoansDAL.DeletePayment(PaymentID);
    }

    /// <summary>
    /// GetPenalties is a method to search for Penalties records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPenalties(int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetPenalties(LoanID);
    }

    /// <summary>
    /// GetPenalty is a method to search for Penalties records
    /// <param name="PenaltyID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPenalty(int PenaltyID, int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetPenalty(PenaltyID, LoanID);
    }

    /// <summary>
    /// GetPenalty is a method to search for Penalties records
    /// <param name="PenaltyID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetPenalty(int PenaltyID)
    {
        // Call DataLayer method
        return LoansDAL.GetPenalty(PenaltyID);
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
        // Call DataLayer method
        PenaltyID = LoansDAL.UpdatePenalty(PenaltyID, LoanID, Amount, PenaltyDate);
        Statements.ProcessPenaltyNotice((int)PenaltyID);
        return PenaltyID;
    }

    /// <summary>
    /// DeletePenalty is a method to delete a Loan record
    /// <param name="PenaltyID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeletePenalty(int PenaltyID)
    {
        // Call DataLayer method
        LoansDAL.DeletePenalty(PenaltyID);
    }

    /// <summary>
    /// GetInvestors is a method to search for Investors records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetInvestors(int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetInvestors(LoanID);
    }

    /// <summary>
    /// GetInvestor is a method to search for Investors records
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetInvestor(int InvestorID, int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetInvestor(InvestorID, LoanID);
    }

    /// <summary>
    /// DeleteInvestor is a method to delete a Loan/Investor record
    /// <param name="InvestorID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeleteInvestor(int InvestorID, int LoanID)
    {
        // Call DataLayer method
        LoansDAL.DeleteInvestor(InvestorID, LoanID);
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
        // Call DataLayer method
        LoansDAL.UpdateInvestor(InvestorID, LoanID, Investment, ServicingRate);
    }

    /// <summary>
    /// UpdateServicer is a method to insert/update a Servicers_Loans record
    /// <param name="ServicerID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>int?</returns>
    /// </summary>
    public static void UpdateServicer(int ServicerID, int LoanID)
    {
        // Call DataLayer method
        LoansDAL.UpdateServicer(ServicerID, LoanID);
    }

    /// <summary>
    /// DeleteServicer is a method to delete a Loan/Investor record
    /// <param name="ServicerID">int</param>
    /// <param name="LoanID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeleteServicer(int ServicerID, int LoanID)
    {
        // Call DataLayer method
        LoansDAL.DeleteServicer(ServicerID, LoanID);
    }

    /// <summary>
    /// GetServicers is a method to search for Servicers records
    /// <param name="LoanID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetServicers(int LoanID)
    {
        // Call DataLayer method
        return LoansDAL.GetServicers(LoanID);
    }

    /// <summary>
    /// GetDistributions is a method to search for Distributions records
    /// <param name="LoanID">int</param>
    /// <param name="Paid">bool?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistributions(int LoanID, bool? Paid)
    {
        // Call DataLayer method
        return LoansDAL.GetDistributions(LoanID, Paid);
    }
}