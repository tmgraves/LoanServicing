using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class Roles_CommonControls_MemberInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        (ChangeUserPassword.ChangePasswordTemplateContainer.FindControl("lblPasswordLength") as Label).Text = Membership.MinRequiredPasswordLength.ToString();
        (ChangeUserPassword.ChangePasswordTemplateContainer.FindControl("lblSymbols") as Label).Text = Membership.MinRequiredNonAlphanumericCharacters.ToString();
        ChangeUserPassword.ChangePasswordFailureText = "Password change failed!<br/>Make sure your new password is <b>at least <u>" + Membership.MinRequiredPasswordLength.ToString() + "</u> characters long</b> " +
                                    "and contains <b>at least <u>" + Membership.MinRequiredNonAlphanumericCharacters.ToString() + "</u> non-alphanumeric character such as !, $, &, or #</b>";
    }

    protected void cvCheckCurrentPassword_ServerValidate(object sender, ServerValidateEventArgs args)
    {
        try
        {
            // Test whether the value entered into the text box is even.
            args.IsValid = IndividualsBLL.Get(Profile.IndividualID).Tables[0].Rows[0]["Password"].ToString() == ChangeUserPassword.CurrentPassword;
        }

        catch (Exception ex)
        {
            args.IsValid = false;
        }
    }
    protected void dvIndividual_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        lbStatus.Text = "Your Information was Updated at " + DateTime.Now.ToString();
        lbStatus.Visible = true;

    }
}