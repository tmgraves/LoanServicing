using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Drawing;

public partial class Roles_Admins_Distributions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //  if (ddlPaid.SelectedItem.Text == "Not Paid" && ddlIndividuals.SelectedIndex > 0)
        if (ddlPaid.SelectedItem.Text == "Not Paid")
        {
            btnAddDistributionPayment.Enabled = true;
            btnAddDistributionPayment.ToolTip = "";
        }
        else
        {
            btnAddDistributionPayment.Enabled = false;
            //  btnAddDistributionPayment.ToolTip = "Please select 'Not Paid' and a Payee in the drop down lists above";
            btnAddDistributionPayment.ToolTip = "Please select 'Not Paid' in the drop down list above";
        }

        //  Set Paid Dropdown List colors
        ddlPaid.Items[1].Attributes.Add("style", "background-color: #93DB70");
    }

    protected void btnFinishDistributions_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow r in gvDistributions.Rows)
        {
            gvDistributions.UpdateRow(r.RowIndex, true);
        }
    }

    decimal sumFooterValue = 0;
    protected void gvDistributions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //  Process Amount Totals
            Decimal amount;
            bool ok = decimal.TryParse(((LinkButton)e.Row.FindControl("lbAmount")).Text, NumberStyles.Currency, CultureInfo.CurrentCulture.NumberFormat, out amount);
            sumFooterValue += amount;
            //  End Process Amount Totals

            //  Set Row Color
            DataRowView rowView = (DataRowView)e.Row.DataItem;
            if (rowView["DistributionDate"].ToString() != "")
            {
                e.Row.BackColor = ColorTranslator.FromHtml("#93DB70");
            }
            else
            {
                //  Add Move over Events
                e.Row.Style.Add("cursor", "pointer");
                e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");
                e.Row.Attributes.Add("onclick", "MarkCheckBox(this, event)");
                //  End Add Move over Events
            }
        }

        //  Update total
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotalAmount = (Label)e.Row.FindControl("lblTotalAmount");
            lblTotalAmount.Text = sumFooterValue.ToString("c");
        }
        //  Update total
    }

    protected void btnSaveDistributionPayment_Click(object sender, EventArgs e)
    {
        try
        {
            List<int> lDistributions = (List<int>)Session["lDistributions"];

            float amount;
            bool ok = float.TryParse(lblAmount.Text, NumberStyles.Currency, CultureInfo.CurrentCulture.NumberFormat, out amount);
            //  PaymentsBLL.UpdateDistributionPayment(null, Convert.ToInt32(ddlIndividuals.SelectedValue), amount, cbDistributionDate.Date, Convert.ToInt32(ddlMethod.SelectedValue), tbNumber.Text, lDistributions);
            int? pid = PaymentsBLL.UpdateDistributionPayment(null, amount, cbDistributionDate.Date, lDistributions);
            gvDistributions.DataBind();
            Response.Redirect("DistributionPayments.aspx" + "?dpid=" + pid.ToString());
        }
        catch (Exception ex)
        {
            var msg = ex.Message;
        }
    }

    protected void btnAddDistributionPayment_Click(object sender, EventArgs e)
    {
        List<int> lDistributions = new List<int>();
        Decimal total = 0;
        
        foreach (GridViewRow r in gvDistributions.Rows)
        {
            if ((r.FindControl("cbCheck") as CheckBox).Checked)
            {
                lDistributions.Add(Convert.ToInt32(gvDistributions.DataKeys[r.RowIndex]["DistributionID"]));
                Decimal amount;
                bool ok = decimal.TryParse(((LinkButton)r.FindControl("lbAmount")).Text, NumberStyles.Currency, CultureInfo.CurrentCulture.NumberFormat, out amount);
                total += amount;
            }
        }
        cbDistributionDate.Clear();
        lblAmount.Text = total.ToString("c");
        //  lblPayee.Text = ddlIndividuals.SelectedItem.Text;
        lblDistributions.Text = lDistributions.Count.ToString();
        cbDistributionDate.Date = DateTime.Today;
        Session["lDistributions"] = lDistributions;
        if (lDistributions.Count == 0)
        {
            btnSaveDistributionPayment.Enabled = false;
            btnSaveDistributionPayment.ToolTip = "Please select at least (1) Distribution to pay out";
        }
        else
        {
            btnSaveDistributionPayment.Enabled = true;
            btnSaveDistributionPayment.ToolTip = "";
        }
        mpeDistributionPayment.Show();
    }
    protected void ddlPaid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPaid.SelectedItem.Text == "Not Paid")
        {
            ucSearchDistributionDate.Enabled = false;
        }
        else
        {
            ucSearchDistributionDate.Enabled = true;
        }
    }
    protected void gvDistributions_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Reset")
        {
            GridViewRow row = ((e.CommandSource as Control).NamingContainer as GridViewRow);
            int distributionId = Convert.ToInt32(gvDistributions.DataKeys[row.RowIndex]["DistributionID"].ToString());
            PaymentsBLL.UpdateDistribution(distributionId, null, null, null, null);
            gvDistributions.DataBind();
        }
    }
}