using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;

public partial class UserControls_ReportSections_InvestorStatementList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void gvStatements_SelectedIndexChanged(object sender, EventArgs e)
    {
        DateTime StatementDate = Convert.ToDateTime(gvStatements.DataKeys[gvStatements.SelectedIndex]["StatementDate"].ToString());
        int InvestorID = Convert.ToInt32(ddlInvestor.SelectedValue.ToString());
        RenderStatement(InvestorID, StatementDate);
    }

    private void RenderStatement(int investorID, DateTime statementDate)
    {
        try
        {
            DateTime startDate = Convert.ToDateTime("1/1/" + statementDate.AddMonths(-1).Year.ToString());
            ReportParameter rpDate = new ReportParameter("LoanDate", statementDate.ToShortDateString());
            ReportParameter[] parameters = new ReportParameter[] { rpDate };

            DataSet dsStatement = StatementsBLL.GetInvestorIncome(investorID, ddlLoans.SelectedValue != "" ? (int?)Convert.ToInt32(ddlLoans.SelectedValue) : null, startDate, statementDate);
            ReportDataSource rdsHeader = new ReportDataSource("HeaderDS", dsStatement.Tables[0]);
            ReportDataSource rdsBody = new ReportDataSource("BodyDS", dsStatement.Tables[1]);
            ReportDataSource[] sources = new ReportDataSource[] { rdsHeader, rdsBody };
            byte[] bytes = Statements.RenderStatement("InvestorIncomeStatement.rdlc", sources, parameters);

            // Variables
            string mimeType = string.Empty;

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + "Investor_" + statementDate.ToString("MMMM") + "_" + statementDate.Year.ToString() + "_Statement_" + investorID.ToString() + ".pdf");
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
        catch (Exception ex)
        {
        }
    }
    protected void ddlInvestor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlLoans.Enabled = true;
        gvStatements.DataBind();
    }
    protected void ddlLoans_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvStatements.DataBind();
    }
    protected void ddlInvestor_DataBound(object sender, EventArgs e)
    {
        switch (Profile.Role)
        {
            case "Investor":
                ListItem oListItem = ddlInvestor.Items.FindByValue(Profile.InvestorID.ToString());
                if (oListItem != null)
                {
                    ddlInvestor.SelectedValue = oListItem.Value;
                }
                pnlInvestor.Visible = false;
                ddlLoans.Enabled = true;
                ddlLoans.DataBind();
                break;
            default:
                ddlInvestor.SelectedIndex = 0;
                pnlInvestor.Visible = true;
                ddlLoans.Enabled = false;
                ddlLoans.DataBind();
                break;
        }
    }
}