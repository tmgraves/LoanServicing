using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Net.Mail;

public partial class Roles_Administrators_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ReportParameter rpDate = new ReportParameter("LoanDate", "7/1/2013");
            //ReportParameter[] parameters = new ReportParameter[] { rpDate };
            //DataTable dtLoan = StatementsBLL.GetLoan(2, Convert.ToDateTime("1/1/2013"), Convert.ToDateTime("7/1/2013")).Tables[0];
            //ReportDataSource rdsLoan = new ReportDataSource("LoanDS", dtLoan);
            //ReportDataSource rdsSchedule = new ReportDataSource("ScheduleDS", StatementsBLL.GetStatementSchedule(2, Convert.ToDateTime("1/1/2013"), Convert.ToDateTime("7/1/2013")).Tables[0]);
            //ReportDataSource[] sources = new ReportDataSource[] { rdsLoan, rdsSchedule };
            //MailAddress from = new MailAddress("info@utiloan.com", "Information");
            //MailAddress[] to = new MailAddress[] { new MailAddress(dtLoan.Rows[0]["Email"].ToString()) };
            //string FileName = Statements.GenerateStatement("BorrowerLoanStatement.rdlc", "Borrower_2_July_2013_Statement", sources, parameters);
            //Email.SendMail(new MailAddress("tadashigraves@gmail.com"), new MailAddress[] { new MailAddress("tadashigraves@gmail.com") }, "subject", "test body", null, null, new string[] { "C:\\Users\\owner\\AppData\\Local\\Temp\\Borrower_2_July_2013_Statement.pdf" });
            //Statements.ProcessBorrowerStatements(Convert.ToDateTime("7/12/2013"));
            //Statements.ProcessInvestorStatements(Convert.ToDateTime("7/1/2013"));
        }
    }
}