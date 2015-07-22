using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Roles_Admins_Servicers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void rblServicer_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bool.Parse(rblServicer.SelectedValue))
        {
            mvServicer.SetActiveView(vNew);
            rfvIndividual.Enabled = false;
            rfvFirstName.Enabled = true;
            rfvLastName.Enabled = true;
            rfvAddress.Enabled = true;
            rfvCity.Enabled = true;
            rfvState.Enabled = true;
            rfvZip.Enabled = true;
        }
        else
        {
            mvServicer.SetActiveView(vExisting);
            rfvIndividual.Enabled = true;
            rfvFirstName.Enabled = false;
            rfvLastName.Enabled = false;
            rfvAddress.Enabled = false;
            rfvCity.Enabled = false;
            rfvState.Enabled = false;
            rfvZip.Enabled = false;
        }
        mpeServicer.Show();
    }

    protected void btnSaveServicer_Click(object sender, EventArgs e)
    {
        if (bool.Parse(rblServicer.SelectedValue))
        {
            ServicersBLL.Update(null, null, tbFirstName.Text, tbLastName.Text, ucEmail.Email, ucPhone.Phone, "", tbAddress.Text, tbCity.Text, cbState.SelectedText, tbZipCode.Text, tbSSN.Text, "", "", "");
        }
        else
        {
            ServicersBLL.Update(null, Convert.ToInt32(ddlIndividual.SelectedValue), "", "", "", "", "", "", "", "", "", "", "", "", "");
        }

        gvServicers.DataBind();

        tbFirstName.Text = "";
        tbLastName.Text = "";
        ucEmail.Email = "";
        ucPhone.Phone = "";
        tbAddress.Text = "";
        tbCity.Text = "";
        tbZipCode.Text = "";
        tbSSN.Text = "";
    }
}