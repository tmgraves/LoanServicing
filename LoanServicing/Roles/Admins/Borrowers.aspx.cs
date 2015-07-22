using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Roles_Borrowers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSaveBorrower_Click(object sender, EventArgs e)
    {
        BorrowersBLL.Update(null, null, tbFirstName.Text, tbLastName.Text, ucEmail.Email, ucPhone.Phone, tbAddress.Text, tbCity.Text, ucState.State, tbZipCode.Text, tbSSN.Text, tbBankName.Text, tbAccountNumber.Text, tbRoutingNumber.Text);

        gvBorrowers.DataBind();

        tbFirstName.Text = "";
        tbLastName.Text = "";
        ucEmail.Email = "";
        ucPhone.Phone = "";
        tbAddress.Text = "";
        tbCity.Text = "";
        tbZipCode.Text = "";
        tbSSN.Text = "";
    }

    protected void dvBorrower_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        dvBorrower.Visible = false;
        gvBorrowers.DataBind();
    }
    protected void gvBorrowers_SelectedIndexChanged(object sender, EventArgs e)
    {
        dvBorrower.DataBind();
        dvBorrower.Visible = true;
    }
    protected void dvBorrower_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        dvBorrower.Visible = false;
        gvBorrowers.DataBind();
    }
}