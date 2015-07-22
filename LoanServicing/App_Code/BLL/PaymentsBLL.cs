using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for PaymentsBLL
/// </summary>
public class PaymentsBLL
{
	public PaymentsBLL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// SearchDistributions is a method to search for Distributions records
    /// <param name="PaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchDistributions(int PaymentID)
    {
        // Call DataLayer method
        return PaymentsDAL.SearchDistributions(PaymentID);
    }

    /// <summary>
    /// SearchDistributions is a method to search for Distributions records
    /// <param name="PaymentID">int?</param>
    /// <param name="InvestorID">int?</param>
    /// <param name="Paid">bool?</param>
    /// <param name="PaymentMethodID">int?</param>
    /// <param name="PaymentNumber">string</param>
    /// <param name="ServicingFee">bool?</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchDistributions(int? PaymentID, int? InvestorID, bool? Paid, int? PaymentMethodID, string PaymentNumber, bool? ServicingFee)
    {
        // Call DataLayer method
        return PaymentsDAL.SearchDistributions(PaymentID, InvestorID, Paid, PaymentMethodID, PaymentNumber, ServicingFee);
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
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchDistributions(int? PaymentID, int? InvestorID, bool? Paid, int? PaymentMethodID, string PaymentNumber, bool? ServicingFee, int? LoanID)
    {
        // Call DataLayer method
        return PaymentsDAL.SearchDistributions(PaymentID, InvestorID, Paid, PaymentMethodID, PaymentNumber, ServicingFee, LoanID);
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
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchDistributions(int? PaymentID, int? InvestorID, bool? Paid, int? PaymentMethodID, string PaymentNumber, bool? ServicingFee, int? LoanID, int? IndividualID, DateTime? DistributionDate)
    {
        // Call DataLayer method
        return PaymentsDAL.SearchDistributions(PaymentID, InvestorID, Paid, PaymentMethodID, PaymentNumber, ServicingFee, LoanID, IndividualID, DistributionDate);
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
    public static DataSet SearchDistributions(int? PaymentID, int? InvestorID, bool? Paid, int? PaymentMethodID, string PaymentNumber, bool? ServicingFee, int? LoanID, int? IndividualID, DateTime? DistributionDate, int? DistributionPaymentID)
    {
        // Call DataLayer method
        return PaymentsDAL.SearchDistributions(PaymentID, InvestorID, Paid, PaymentMethodID, PaymentNumber, ServicingFee, LoanID, IndividualID, DistributionDate, DistributionPaymentID);
    }

    /// <summary>
    /// GetDistribution is a method to search for Distributions records
    /// <param name="DistributionID">int</param>
    /// <param name="PaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistribution(int DistributionID, int PaymentID)
    {
        // Call DataLayer method
        return PaymentsDAL.GetDistribution(DistributionID, PaymentID);
    }

    /// <summary>
    /// UpdateDistribution is a method to insert/update a Distributions record
    /// <param name="DistributionID">int?</param>
    /// <param name="DistributionDate">DateTime?</param>
    /// <param name="PaymentMethodID">int?</param>
    /// <param name="PaymentNumber">string</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdateDistribution(int? DistributionID, DateTime? DistributionDate, int? PaymentMethodID, string PaymentNumber)
    {
        // Call DataLayer method
        return PaymentsDAL.UpdateDistribution(DistributionID, DistributionDate, PaymentMethodID, PaymentNumber);
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
    public static int? UpdateDistribution(int? DistributionID, DateTime? DistributionDate, int? PaymentMethodID, string PaymentNumber, int? DistributionPaymentID)
    {
        // Call DataLayer method
        return PaymentsDAL.UpdateDistribution(DistributionID, DistributionDate, PaymentMethodID, PaymentNumber, DistributionPaymentID);
    }

    /// <summary>
    /// SearchDistributionPayments is a method to search for DistributionPayments records
    /// <param name="IndividualID">int?</param>
    /// <param name="DistributionDate">DateTime?</param>
    /// <param name="PaymentNumber">string</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet SearchDistributionPayments(int? IndividualID, DateTime? DistributionDate, string PaymentNumber)
    {
        // Call DataLayer method
        return PaymentsDAL.SearchDistributionPayments(IndividualID, DistributionDate, PaymentNumber);
    }

    /// <summary>
    /// GetDistributionPayment is a method to search for DistributionPayments records
    /// <param name="DistributionPaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistributionPayment(int DistributionPaymentID)
    {
        // Call DataLayer method
        return PaymentsDAL.GetDistributionPayment(DistributionPaymentID);
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
        // Call DataLayer method
        return PaymentsDAL.UpdateDistributionPayment(DistributionPaymentID, Amount, DistributionDate);
    }

    /// <summary>
    /// UpdateDistributionPayment is a method to insert/update a DistributionPayments record
    /// <param name="DistributionPaymentID">int?</param>
    /// <param name="Amount">float?</param>
    /// <param name="DistributionDate">DateTime?</param>
    /// <param name="DistributionIDs">List<int></param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? UpdateDistributionPayment(int? DistributionPaymentID, float? Amount, DateTime? DistributionDate, List<int> DistributionIDs)
    {
        // Call DataLayer method
        DistributionPaymentID = PaymentsDAL.UpdateDistributionPayment(null, Amount, DistributionDate);

        foreach (int DistributionID in DistributionIDs)
        {
            UpdateDistribution(DistributionID, null, null, null, DistributionPaymentID);
        }
        return DistributionPaymentID;
    }

    ///// <summary>
    ///// UpdateDistributionPayment is a method to insert/update a DistributionPayments record
    ///// <param name="DistributionPaymentID">int?</param>
    ///// <param name="IndividualID">int?</param>
    ///// <param name="Amount">float?</param>
    ///// <param name="DistributionDate">DateTime?</param>
    ///// <param name="PaymentMethodID">int?</param>
    ///// <param name="PaymentNumber">string</param>
    ///// <returns>int?</returns>
    ///// </summary>
    //public static int? UpdateDistributionPayment(int? DistributionPaymentID, int? IndividualID, float? Amount, DateTime? DistributionDate, int? PaymentMethodID, string PaymentNumber)
    //{
    //    // Call DataLayer method
    //    return PaymentsDAL.UpdateDistributionPayment(DistributionPaymentID, IndividualID, Amount, DistributionDate, PaymentMethodID, PaymentNumber);
    //}

    ///// <summary>
    ///// UpdateDistributionPayment is a method to insert/update a DistributionPayments record
    ///// <param name="DistributionPaymentID">int?</param>
    ///// <param name="IndividualID">int?</param>
    ///// <param name="Amount">float?</param>
    ///// <param name="DistributionDate">DateTime?</param>
    ///// <param name="PaymentMethodID">int?</param>
    ///// <param name="PaymentNumber">string</param>
    ///// <param name="DistributionIDs">List<int></param>
    ///// <returns>int?</returns>
    ///// </summary>
    //public static int? UpdateDistributionPayment(int? DistributionPaymentID, int? IndividualID, float? Amount, DateTime? DistributionDate, int? PaymentMethodID, string PaymentNumber, List<int> DistributionIDs)
    //{
    //    // Call DataLayer method
    //    DistributionPaymentID = PaymentsDAL.UpdateDistributionPayment(DistributionPaymentID, IndividualID, Amount, DistributionDate, PaymentMethodID, PaymentNumber);

    //    foreach (int DistributionID in DistributionIDs)
    //    {
    //        UpdateDistribution(DistributionID, DistributionDate, PaymentMethodID, PaymentNumber, DistributionPaymentID);
    //    }
    //    return DistributionPaymentID;
    //}

    /// <summary>
    /// DeleteDistributionPayment is a method to delete a Distribution Payment record
    /// <param name="DistributionPaymentID">int</param>
    /// <returns>void</returns>
    /// </summary>
    public static void DeleteDistributionPayment(int DistributionPaymentID)
    {
        // Call DataLayer method
        PaymentsDAL.DeleteDistributionPayment(DistributionPaymentID);
    }

    /// <summary>
    /// GetDistributionPaymentIndividualTotals is a method to search for Individuals for a DistributionPayment records
    /// <param name="DistributionPaymentID">int</param>
    /// <returns>Dataset</returns>
    /// </summary>
    public static DataSet GetDistributionPaymentIndividualTotals(int DistributionPaymentID)
    {
        // Call DataLayer method
        return PaymentsDAL.GetDistributionPaymentIndividualTotals(DistributionPaymentID);
    }

    /// <summary>
    /// CommitDistributionPayment is a method to insert/update a DistributionPayments record
    /// <param name="DistributionPaymentID">int</param>
    /// <param name="PaymentMethodID">int</param>
    /// <returns>int?</returns>
    /// </summary>
    public static int? CommitDistributionPayment(int DistributionPaymentID, int PaymentMethodID)
    {
        var p = GetDistributionPayment(DistributionPaymentID).Tables[0].Rows[0];
        var ds = SearchDistributions(null, null, null, null, null, null, null, null, null, DistributionPaymentID);

        foreach (DataRow r in ds.Tables[0].Rows)
        {
            UpdateDistribution(Convert.ToInt32(r["DistributionID"].ToString()), Convert.ToDateTime(p["DistributionDate"].ToString()), PaymentMethodID, null, DistributionPaymentID);
        }
        return DistributionPaymentID;
    }
}