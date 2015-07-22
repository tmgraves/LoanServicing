using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Roles_Admins_DistributionPayments : System.Web.UI.Page
{
    double total = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["dpid"] != null)
        {
            ddlDistributionPayments.SelectedValue = Request.QueryString["dpid"].ToString();
        }

    }
    protected void gvIndividualTotals_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            total += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Amount").ToString());
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[3].Text = total.ToString("c");
        }
    }
    protected void btnDeletePayment_Click(object sender, EventArgs e)
    {
        if (ddlDistributionPayments.SelectedIndex > 0)
        {
            int id = Convert.ToInt32(ddlDistributionPayments.SelectedValue);
            PaymentsBLL.DeleteDistributionPayment(id);
            Response.Redirect("DistributionPayments.aspx");
        }
    }
    protected void btnCommit_Click(object sender, EventArgs e)
    {
        if (ddlDistributionPayments.SelectedIndex > 0 && ddlMethod.SelectedIndex > 0)
        {
            PaymentsBLL.CommitDistributionPayment(Convert.ToInt32(ddlDistributionPayments.SelectedValue), Convert.ToInt32(ddlMethod.SelectedValue));
            gvIndividualTotals.DataBind();
        }
    }
}