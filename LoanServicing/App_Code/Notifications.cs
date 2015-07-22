using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Net.Mail;

/// <summary>
/// Summary description for Notifications
/// </summary>
public class Notifications
{
	public Notifications()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// PaymentPosted
    /// </summary>
    /// <param name="PaymentID">int</param>
    /// <returns>bool</returns>
    /// <remarks></remarks>
    public static bool PaymentPosted(int PaymentID)
    {
        try
        {
            DataTable dtPayment = LoansBLL.GetPayment(PaymentID).Tables[0];
            MailAddress from = new MailAddress("info@utiloan.com", "Information");

            if (dtPayment.Rows.Count == 1)
            {
                //  Get Investors
                DataRow r = dtPayment.Rows[0];
                DataTable dtDistributions = PaymentsBLL.SearchDistributions(PaymentID, null, null, null, null, false).Tables[0];

                foreach (DataRow ir in dtDistributions.Rows)
                {
                    MailAddress[] to = new MailAddress[] { new MailAddress(ir["Email"].ToString()) };
                    MailAddress[] bcc = new MailAddress[] { new MailAddress("tadashigraves@gmail.com", "Tad Graves") };
                    string body = "Dear " + ir["Investor"].ToString() + ",\n\n" +
                                    "A payment was received for the " + r["LoanName"].ToString() + " loan in the amount of " + String.Format("{0:c}", r["Amount"]) + ".\n\n" +
                                    "Your share breaks down as follows:\n\n" +
                                    "Payment Share: " + String.Format("{0:c}", ir["PaymentAmount"]) + " x " + String.Format("{0:p2}", ir["LoanPercentage"]) + " = " + String.Format("{0:c}", ir["Amount"]) + "\n" +
                                    "Penalty and Interest Amount of Payment: " +  String.Format("{0:c}", ir["InterestPenaltyPaid"]) + "\n" +
                                    "Servicing Fee: " + String.Format("{0:c}", ir["InterestPenaltyPaid"]) + " x (" + String.Format("{0:p2}", ir["ServicingRate"]) + "/" + String.Format("{0:p2}", ir["Rate"]) + ") = " + String.Format("{0:c}", ir["ServicingAmount"]) + "\n" +
                                    "Net Payment: " + String.Format("{0:c}", ir["Amount"]) + " - " + String.Format("{0:c}", ir["ServicingAmount"]) + " = " + String.Format("{0:c}", ir["NetAmount"]) + "\n\n" +
                                    "Your distribution will be sent out shortly.\n\n" +
                                    "Thank you,\n\n" +
                                    "Loan Administrator\n" +
                                    "http://www.utiloan.com";
                    string subject = "A Payment was posted for " + r["LoanName"].ToString();
                    Email.SendMail(from, to, subject, body, null, bcc, new string[] {});
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
}