using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomControls;
using System.Data;

public partial class Roles_Admins_Loan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvPayments_SelectedIndexChanged(object sender, EventArgs e)
    {
        dvPayment.DataBind();
        dvPayment.ChangeMode(DetailsViewMode.Edit);
        mpePayment.Show();
    }

    protected void btnSaveServicer_Click(object sender, EventArgs e)
    {
        LoansBLL.UpdateServicer(Convert.ToInt32(ddlServicers.SelectedValue), Convert.ToInt32(dvLoan.SelectedValue));
        gvServicers.DataBind();
    }
    protected void dvPayment_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvPayments.DataBind();
        gvSchedule.DataBind();
        dvLoan.DataBind();
    }
    protected void lbAddPayment_Click(object sender, EventArgs e)
    {
        dvPayment.ChangeMode(DetailsViewMode.Insert);
        mpePayment.Show();
        SetPaymentDateRange();
    }

    protected void btnDeactivate_Click(object sender, EventArgs e)
    {
        LoansBLL.Update(Convert.ToInt32(dvLoan.SelectedValue), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, DateTime.Now);
        dvLoan.DataBind();
        Response.Redirect("~/Roles/Admins/Loans.aspx");
    }
    protected void dvPayment_DataBound(object sender, EventArgs e)
    {
        SetPaymentDateRange();
    }

    private void SetPaymentDateRange()
    {
        Controls_CalendarTextbox ucPaymentDate = (Controls_CalendarTextbox)dvPayment.FindControl("ucPaymentDate");
        DataTable dtLoan = LoansBLL.Get(Convert.ToInt32(dvLoan.SelectedValue)).Tables[0];
        ucPaymentDate.MinimumDate = Convert.ToDateTime(dtLoan.Rows[0]["StartDate"].ToString());
        ucPaymentDate.MaximumDate = Convert.ToDateTime(dtLoan.Rows[0]["EndDate"].ToString());
        ucPaymentDate.RangeErrorMessage = "Please enter a date between " + Convert.ToDateTime(dtLoan.Rows[0]["StartDate"].ToString()).ToShortDateString() + " and " + Convert.ToDateTime(dtLoan.Rows[0]["EndDate"].ToString()).ToShortDateString();
        ucPaymentDate.RangeRequired = true;
    }

    protected void dvPayment_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvPayments.DataBind();
        gvSchedule.DataBind();
        dvLoan.DataBind();
    }
    protected void odsPayments_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        gvSchedule.DataBind();
    }

    protected void gvDistributions_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        mpeDistributions.Show();
    }
    protected void gvServicingDistributions_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        mpeDistributions.Show();
    }
    protected void gvPayments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Distributions")
        {
            GridViewRow row = ((e.CommandSource as Control).NamingContainer as GridViewRow);
            gvPayments.SelectedIndex = row.RowIndex;
            gvDistributions.DataBind();
            gvServicingDistributions.DataBind();
            mpeDistributions.Show();
        }
    }
    protected void btnFinishDistributions_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow r in gvDistributions.Rows)
        {
            gvDistributions.UpdateRow(r.RowIndex, true);
        }
        foreach (GridViewRow r in gvServicingDistributions.Rows)
        {
            gvServicingDistributions.UpdateRow(r.RowIndex, true);
        }
        gvPayments.DataBind();
    }

    protected void btnSaveInvestor_Click(object sender, EventArgs e)
    {
        LoansBLL.UpdateInvestor(Convert.ToInt32(ddlInvestor.SelectedValue), Convert.ToInt32(dvLoan.SelectedValue), ucInvestment.Value, ucServicingRate.Value);
        gvInvestors.DataBind();
        ddlInvestor.SelectedIndex = 0;
        ucInvestment.Value = null;
        ucServicingRate.Value = null;
    }

    protected void dvPenalty_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvPenalties.DataBind();
        gvSchedule.DataBind();
    }
    protected void dvPenalty_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvPenalties.DataBind();
        gvSchedule.DataBind();
    }

    protected void odsPenalties_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        gvSchedule.DataBind();
    }
    protected void dvLoan_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvSchedule.DataBind();
    }
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        LoansBLL.UpdatePayment(null, Convert.ToInt32(dvLoan.SelectedValue), 0, Convert.ToDateTime(ucPayoffDate.Date), "0", "Payoff Balance", 1);
        var row = LoansBLL.SearchSchedule(Convert.ToInt32(dvLoan.SelectedValue), Convert.ToDateTime(ucPayoffDate.Date).ToShortDateString()).Tables[0].Rows[0];
        lblBalance.Text = String.Format("{0:c}", row["Total"]);
        lblInterest.Text = String.Format("{0:c}", row["Interest"]);
    }
}