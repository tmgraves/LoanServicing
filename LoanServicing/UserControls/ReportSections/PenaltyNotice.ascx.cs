using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;

public partial class UserControls_ReportSections_PenaltyNotice : System.Web.UI.UserControl
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
        gvPenalties.DataBind();
    }

    protected void gvPenalties_SelectedIndexChanged(object sender, EventArgs e)
    {
        int PenaltyID = Convert.ToInt32(gvPenalties.DataKeys[gvPenalties.SelectedIndex]["PenaltyID"].ToString());
        int LoanID = Convert.ToInt32(ddlLoans.SelectedValue);
        RenderStatement(PenaltyID, LoanID);
    }

    private void RenderStatement(int penaltyID, int loanID)
    {
        try
        {
            ReportParameter rpPenaltyID = new ReportParameter("PenaltyID", penaltyID.ToString());
            ReportParameter[] parameters = new ReportParameter[] { };

            DataTable dtPenalty = LoansBLL.GetPenalty(penaltyID, loanID).Tables[0];
            ReportDataSource rdsPenalty = new ReportDataSource("PenaltyDS", dtPenalty);
            ReportDataSource[] sources = new ReportDataSource[] { rdsPenalty };
            byte[] bytes = Statements.RenderStatement("PenaltyNotice.rdlc", sources, parameters);

            // Variables
            string mimeType = string.Empty;

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + "PenaltyNotice_" + penaltyID.ToString() + ".pdf");
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
        catch (Exception ex)
        {
        }
    }
}