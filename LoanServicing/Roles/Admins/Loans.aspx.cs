using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class Roles_Admins_Loans : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rblBorrower_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bool.Parse(rblBorrower.SelectedValue))
        {
            mvBorrower.SetActiveView(vNewBorrower);
            rfvBorrower.Enabled = false;
            rfvFirstName.Enabled = true;
            rfvLastName.Enabled = true;
            rfvAddress.Enabled = true;
            rfvCity.Enabled = true;
            rfvState.Enabled = true;
            rfvZip.Enabled = true;
        }
        else
        {
            mvBorrower.SetActiveView(vExistingBorrower);
            rfvBorrower.Enabled = true;
            rfvFirstName.Enabled = false;
            rfvLastName.Enabled = false;
            rfvAddress.Enabled = false;
            rfvCity.Enabled = false;
            rfvState.Enabled = false;
            rfvZip.Enabled = false;
        }
        mpeLoan.Show();
    }

    protected void btnSaveLoan_Click(object sender, EventArgs e)
    {
        int? BorrowerID;

        if (bool.Parse(rblBorrower.SelectedValue))
        {
            BorrowerID = BorrowersBLL.Update(null, null, tbFirstName.Text, tbLastName.Text, ucEmail.Email, ucPhone.Phone, tbAddress.Text, tbCity.Text, cbState.SelectedText, tbZipCode.Text, tbSSN.Text, "", "", "");
        }
        else
        {
            BorrowerID = Convert.ToInt32(ddlBorrower.SelectedValue);
        }
        LoansBLL.Update(null, tbName.Text, BorrowerID, ucStartDate.Date, ucRate.Value, ucLoanAmount.Value, ucPenalty.Value, ucPrepayPeriod.Value, ucPayment.Value, ucPaymentDay.Value, ucGracePeriod.Value, ucTerm.Value, tbPropertyAddress.Text, tbPropertyCity.Text, cbPropertyState.SelectedValue, tbPropertyZip.Text);

        gvLoans.DataBind();

        tbFirstName.Text = "";
        tbLastName.Text = "";
        ucEmail.Email = "";
        ucPhone.Phone = "";
        tbAddress.Text = "";
        tbCity.Text = "";
        tbZipCode.Text = "";
        tbSSN.Text = "";
        tbName.Text = "";
        ucStartDate.Date = Convert.ToDateTime("1/1/1900");
        ucRate.Value = null;
        ucLoanAmount.Value = null;
        ucPenalty.Value = null;
        ucPrepayPeriod.Value = null;
        ucPayment.Value = null;
        ucPaymentDay.Value = null;
        ucGracePeriod.Value = null;
        ucTerm.Value = null;
        tbPropertyAddress.Text = "";
        tbPropertyCity.Text = "";
        tbPropertyZip.Text = "";
        cbPropertyState.SelectedValue = null;
    }
    protected void gvLoans_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Payment")
        {
            GridViewRow row = ((e.CommandSource as Control).NamingContainer as GridViewRow);
            ucUpdatePayment.LoanID = Convert.ToInt32(gvLoans.DataKeys[row.RowIndex]["LoanID"].ToString());
            ucUpdatePayment.CurrentMode = "Insert";
            ucUpdatePayment.Show();
        }
    }

    protected void ddlActive_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    decimal sumFooterValue = 0;
    protected void gvLoans_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //  Process Amount Totals
            decimal amount;

            bool ok = decimal.TryParse(e.Row.Cells[3].Text, NumberStyles.Currency, CultureInfo.CurrentCulture.NumberFormat, out amount);
            sumFooterValue += amount;
            //  End Process Amount Totals
        }

        //  Update total
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[0].Text = "Total";
            e.Row.Cells[3].Text = sumFooterValue.ToString("c");
        }
        //  Update total
    }
}