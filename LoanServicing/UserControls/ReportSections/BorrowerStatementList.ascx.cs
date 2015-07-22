using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Reporting.WebForms;

public partial class UserControls_ReportSections_BorrowerStatementList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (Profile.Role)
            {
                case "Administrator":
                    ddlLoans.DataSource = LoansBLL.Search();
                    ddlLoans.DataBind();
                    break;
                case "Investor":
                    ddlLoans.DataSource = LoansBLL.SearchByInvestor(Profile.InvestorID);
                    ddlLoans.DataBind();
                    break;
                case "Borrower":
                    ddlLoans.DataSource = LoansBLL.SearchByBorrower(Profile.BorrowerID);
                    ddlLoans.DataBind();
                    break;
            }
        }
    }

    protected void ddlLoans_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvStatements.DataBind();
    }

    protected void gvStatements_SelectedIndexChanged(object sender, EventArgs e)
    {
        DateTime StatementDate = Convert.ToDateTime(gvStatements.DataKeys[gvStatements.SelectedIndex]["StatementDate"].ToString());
        int LoanID = Convert.ToInt32(ddlLoans.SelectedValue.ToString());
        RenderStatement(LoanID, StatementDate);
    }

    private void RenderStatement(int loanID, DateTime statementDate)
    {
        try
        {
            DateTime startDate = Convert.ToDateTime("1/1/" + statementDate.AddMonths(-1).Year.ToString());
            ReportParameter rpDate = new ReportParameter("LoanDate", statementDate.ToShortDateString());
            ReportParameter[] parameters = new ReportParameter[] { rpDate };

            DataTable dtLoan = StatementsBLL.GetLoan(loanID, startDate, statementDate).Tables[0];
            ReportDataSource rdsLoan = new ReportDataSource("LoanDS", dtLoan);
            ReportDataSource rdsSchedule = new ReportDataSource("ScheduleDS", StatementsBLL.GetStatementSchedule(loanID, startDate, statementDate).Tables[0]);
            ReportDataSource[] sources = new ReportDataSource[] { rdsLoan, rdsSchedule };
            byte[] bytes = Statements.RenderStatement("BorrowerLoanStatement.rdlc", sources, parameters);

            // Variables
            string mimeType = string.Empty;

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + "Borrower_" + loanID.ToString() + "_" + statementDate.ToString("MMMM") + "_" + statementDate.Year.ToString() + "_Statement" + ".pdf");
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
        catch (Exception ex)
        {
        }
    }
}