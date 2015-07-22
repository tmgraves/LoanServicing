using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Roles_Admins_Investors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void rblInvestor_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bool.Parse(rblInvestor.SelectedValue))
        {
            mvInvestor.SetActiveView(vNew);
            rfvIndividual.Enabled = false;
            rfvFirstName.Enabled = true;
            rfvLastName.Enabled = true;
            rfvAddress.Enabled = true;
            rfvCity.Enabled = true;
            ucState.Required = true;
            rfvZip.Enabled = true;
        }
        else
        {
            mvInvestor.SetActiveView(vExisting);
            rfvIndividual.Enabled = true;
            rfvFirstName.Enabled = false;
            rfvLastName.Enabled = false;
            rfvAddress.Enabled = false;
            rfvCity.Enabled = false;
            ucState.Required = false;
            rfvZip.Enabled = false;
        }
        mpeInvestor.Show();
    }

    protected void btnSaveInvestor_Click(object sender, EventArgs e)
    {
        if (bool.Parse(rblInvestor.SelectedValue))
        {
            InvestorsBLL.Update(null, null, tbFirstName.Text, tbLastName.Text, ucEmail.Email, ucPhone.Phone, tbAddress.Text, tbCity.Text, ucState.State, tbZipCode.Text, tbSSN.Text, tbBankName.Text, tbAccountNumber.Text, tbRoutingNumber.Text);
        }
        else
        {
            InvestorsBLL.Update(null, Convert.ToInt32(ddlIndividual.SelectedValue), "", "", "", "", "", "", "", "", "", "", "", "");
        }

        gvInvestors.DataBind();

        tbFirstName.Text = "";
        tbLastName.Text = "";
        ucEmail.Email = "";
        ucPhone.Phone = "";
        tbAddress.Text = "";
        tbCity.Text = "";
        tbZipCode.Text = "";
        tbSSN.Text = "";
    }
    protected void dvInvestor_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        dvInvestor.Visible = false;
        gvInvestors.DataBind();
    }
    protected void gvInvestors_SelectedIndexChanged(object sender, EventArgs e)
    {
        dvInvestor.DataBind();
        dvInvestor.Visible = true;
    }
    protected void dvInvestor_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        dvInvestor.Visible = false;
        gvInvestors.DataBind();
    }
}