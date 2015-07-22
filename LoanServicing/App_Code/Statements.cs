using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Net.Mail;

/// <summary>
/// Summary description for Statements
/// </summary>
public class Statements
{
	public Statements()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// GenerateStatement
    /// </summary>
    /// <param name="Report">string</param>
    /// <param name="DataSources">ReportDataSource[]</param>
    /// <param name="Parameters">ReportParameters[]</param>
    /// <returns></returns>
    /// <remarks></remarks>
    public static string GenerateStatement(string Report, string ReportName, ReportDataSource[] DataSources, ReportParameter[] Parameters)
    {
        ReportViewer viewer = new ReportViewer();

        viewer.ProcessingMode = ProcessingMode.Local;
        viewer.Reset();
        viewer.LocalReport.ReportPath = @"Reports\" + Report;
        viewer.LocalReport.DataSources.Clear();
        foreach (ReportDataSource ds in DataSources)
        {
            viewer.LocalReport.DataSources.Add(ds);
        }
        viewer.LocalReport.SetParameters(Parameters);
        viewer.LocalReport.Refresh();

        Warning[] warnings;
        string[] streamids;
        string mimeType;
        string encoding;
        string filenameExtension;

        byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);

        string filename = Path.Combine(Path.GetTempPath(), ReportName + ".pdf");
        using (FileStream fs = new FileStream(filename, FileMode.Create))
        {
            fs.Write(bytes, 0, bytes.Length);
        }

        return filename;
    }

    /// <summary>
    /// SendStatement
    /// </summary>
    /// <param name="StatementName">string</param>
    /// <param name="Subject">string</param>
    /// <param name="Body">string</param>
    /// <param name="From">MailAddress</param>
    /// <param name="To">MailAddress[]</param>
    /// <param name="CC">MailAddress[]?</param>
    /// <param name="BCC">MailAddress[]?</param>
    /// <returns></returns>
    /// <remarks></remarks>
    public static bool SendStatement(string StatementName, string Subject, string Body, MailAddress From, MailAddress[] To, MailAddress[] CC, MailAddress[] BCC)
    {
        try
        {
            Email.SendMail(From, To, "test", "test", null, null, new string[] { StatementName });
            return true;
        }
        catch
        {
            return false;
        }
    }

    /// <summary>
    /// ProcessBorrowerStatements
    /// </summary>
    /// <param name="Day">DateTime?</param>
    /// <returns>bool</returns>
    /// <remarks></remarks>
    public static bool ProcessBorrowerStatements(DateTime? ProcessDay)
    {
        try
        {
            DateTime loanDate;
            int LoanID;

            if (ProcessDay == null)
            {
                loanDate = DateTime.Today;
            }
            else
            {
                loanDate = Convert.ToDateTime(ProcessDay);
            }

            //  1. Process all Borrower Statements for Borrowers/Investors
            DataTable dtLoans = StatementsBLL.GetLoansForDay(loanDate).Tables[0];
            DateTime startDate = Convert.ToDateTime("1/1/" + loanDate.AddMonths(-1).Year.ToString());
            ReportParameter rpDate = new ReportParameter("LoanDate", loanDate.ToShortDateString());
            ReportParameter[] parameters = new ReportParameter[] { rpDate };

            foreach (DataRow r in dtLoans.Rows)
            {
                LoanID = Convert.ToInt32(r["LoanID"].ToString());
                DataTable dtLoan = StatementsBLL.GetLoan(LoanID, startDate, loanDate).Tables[0];
                ReportDataSource rdsLoan = new ReportDataSource("LoanDS", dtLoan);
                ReportDataSource rdsSchedule = new ReportDataSource("ScheduleDS", StatementsBLL.GetStatementSchedule(LoanID, startDate, loanDate).Tables[0]);
                ReportDataSource[] sources = new ReportDataSource[] { rdsLoan, rdsSchedule };
                MailAddress from = new MailAddress("info@utiloan.com", "Information");
                MailAddress[] to = new MailAddress[] { new MailAddress(dtLoan.Rows[0]["Email"].ToString()) };
                MailAddress[] bcc = new MailAddress[] { new MailAddress("tadashigraves@gmail.com", "Tad Graves") };
                string FileName = Statements.GenerateStatement("BorrowerLoanStatement.rdlc", "Borrower_" + LoanID.ToString() + "_" + loanDate.ToString("MMMM") + "_" + loanDate.Year.ToString() + "_Statement", sources, parameters);
                string body = "Dear " + dtLoan.Rows[0]["Borrower"].ToString() + ",\n\n" +
                                "Here is your Loan Statement for " + loanDate.ToString("MMMM") + "/" + loanDate.Year.ToString() + ".\n\n" +
                                "Click here to download/view your all Statements:\n" +
                                "http://www.utiloan.com/Roles/Borrowers/Statements/BorrowerLoanStatement.aspx\n\n" +
                                "Thank you,\n\n" +
                                "Loan Administrator\n" +
                                "http://www.utiloan.com";
                string subject = "Your Loan Statement for " + loanDate.ToString("MMMM") + " " + loanDate.Year.ToString();
                Email.SendMail(from, to, subject, body, null, bcc, new string[] { FileName });
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// ProcessInvestorStatements
    /// </summary>
    /// <param name="Day">DateTime?</param>
    /// <returns>bool</returns>
    /// <remarks></remarks>
    public static bool ProcessInvestorStatements(DateTime? ProcessDay)
    {
        try
        {
            DateTime loanDate;

            if (ProcessDay == null)
            {
                loanDate = Convert.ToDateTime(DateTime.Today.Month.ToString() + "/1/" + DateTime.Today.Year.ToString());
            }
            else
            {
                loanDate = Convert.ToDateTime(DateTime.Today.Month.ToString() + "/1/" + Convert.ToDateTime(ProcessDay).Year.ToString());
            }

            //  1. Process all Statements for Investors
            DataTable dtInvestors = StatementsBLL.GetActiveInvestors().Tables[0];
            DateTime startDate = Convert.ToDateTime("1/1/" + loanDate.AddMonths(-1).Year.ToString());
            ReportParameter rpDate = new ReportParameter("LoanDate", loanDate.ToShortDateString());
            ReportParameter[] parameters = new ReportParameter[] { rpDate };

            foreach (DataRow r in dtInvestors.Rows)
            {
                DataSet dsStatement = StatementsBLL.GetInvestorIncome(Convert.ToInt32(r["InvestorID"].ToString()), null, startDate, loanDate);
                ReportDataSource rdsHeader = new ReportDataSource("HeaderDS", dsStatement.Tables[0]);
                ReportDataSource rdsBody = new ReportDataSource("BodyDS", dsStatement.Tables[1]);
                ReportDataSource[] sources = new ReportDataSource[] { rdsHeader, rdsBody };
                MailAddress from = new MailAddress("info@utiloan.com", "Information");
                MailAddress[] to = new MailAddress[] { new MailAddress(r["Email"].ToString()) };
                MailAddress[] bcc = new MailAddress[] { new MailAddress("tadashigraves@gmail.com", "Tad Graves") };
                string FileName = Statements.GenerateStatement("InvestorIncomeStatement.rdlc", "Investor_" + loanDate.ToString("MMMM") + "_" + loanDate.Year.ToString() + "_Statement_" + r["InvestorID"].ToString(), sources, parameters);
                string body = "Dear " + r["Investor"].ToString() + ",\n\n" +
                                "Here is your Investor Statement for " + loanDate.ToString("MMMM") + "/" + loanDate.Year.ToString() + ".\n\n" +
                                "Click here to download/view your all Statements:\n" +
                                "http://www.utiloan.com/Roles/Investors/Statements/InvestorIncomeStatement.aspx\n\n" +
                                "Thank you,\n\n" +
                                "Loan Administrator\n" +
                                "http://www.utiloan.com";
                string subject = "Your Investor Statement for " + loanDate.ToString("MMMM") + " " + loanDate.Year.ToString();
                Email.SendMail(from, to, subject, body, null, bcc, new string[] { FileName });
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// ProcessPenaltyNotice
    /// </summary>
    /// <param name="PenaltyID">int</param>
    /// <returns>bool</returns>
    /// <remarks></remarks>
    public static bool ProcessPenaltyNotice(int PenaltyID)
    {
        try
        {
            ReportParameter[] parameters = new ReportParameter[] { };

            DataTable dtPenalty = LoansBLL.GetPenalty(PenaltyID).Tables[0];
            ReportDataSource rdsPenalty = new ReportDataSource("PenaltyDS", dtPenalty);
            ReportDataSource[] sources = new ReportDataSource[] { rdsPenalty };
            MailAddress from = new MailAddress("info@utiloan.com", "Information");

            if (dtPenalty.Rows.Count == 1)
            {
                DataRow r = dtPenalty.Rows[0];
                MailAddress[] to = new MailAddress[] { new MailAddress(r["Email"].ToString()) };
                MailAddress[] bcc = new MailAddress[] { new MailAddress("tadashigraves@gmail.com", "Tad Graves") };
                string FileName = Statements.GenerateStatement("PenaltyNotice.rdlc", "PenaltyNotice_" + PenaltyID.ToString() + ".pdf", sources, parameters);
                string body = "Dear " + r["Borrower"].ToString() + ",\n\n" +
                                "Please read the attached notice.\n\n" +
                                "Thank you,\n\n" +
                                "Loan Administrator\n" +
                                "http://www.utiloan.com";
                string subject = "You've been assessed a late penalty on your loan";
                Email.SendMail(from, to, subject, body, null, bcc, new string[] { FileName });

            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    /// <summary>
    /// RenderStatement
    /// </summary>
    /// <param name="Report">string</param>
    /// <param name="DataSources">ReportDataSource[]</param>
    /// <param name="Parameters">ReportParameters[]</param>
    /// <returns></returns>
    /// <remarks></remarks>
    public static byte[] RenderStatement(string Report, ReportDataSource[] DataSources, ReportParameter[] Parameters)
    {
        ReportViewer viewer = new ReportViewer();

        viewer.ProcessingMode = ProcessingMode.Local;
        viewer.Reset();
        viewer.LocalReport.ReportPath = @"Reports\" + Report;
        viewer.LocalReport.DataSources.Clear();
        foreach (ReportDataSource ds in DataSources)
        {
            viewer.LocalReport.DataSources.Add(ds);
        }

        viewer.LocalReport.SetParameters(Parameters);
        viewer.LocalReport.Refresh();

        Warning[] warnings;
        string[] streamids;
        string mimeType;
        string encoding;
        string filenameExtension;

        byte[] bytes = viewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);

        return bytes;
    }
}