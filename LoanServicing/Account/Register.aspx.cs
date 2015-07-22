using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class Account_Register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        string strFirstName = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("FirstName")).Text;
        string strLastName = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("LastName")).Text;
        //  string strEmail = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Email")).Text;
        string strPassword = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Password")).Text;
        string strUserName = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text;
        string strGender = ((RadioButtonList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("rblGender")).SelectedValue;
        int intAgencyID = Convert.ToInt32(((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("ddlAgency")).SelectedValue);
        string strProgram = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbProgram")).Text;
        string strTitle = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbTitle")).Text;
        string strDegree = ((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("ddlDegree")).SelectedValue;
        string strPosition = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbPosition")).Text;
        string strLicense = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbLicense")).Text;
        string strAddress = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbAddress")).Text;
        string strAddress2 = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbAddress2")).Text;
        string strCity = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbCity")).Text;
        ComboBox cbState = ((ComboBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("cbState"));
        string strZipCode = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbZipCode")).Text;
        string strPhoneNumber = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbPhoneNumber")).Text;
        int intProgramTypeID = Convert.ToInt32(((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("ddlProgramType")).SelectedValue);
        string strProgramType = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbProgramType")).Text;
        int intPositionTypeID = Convert.ToInt32(((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("ddlPositionType")).SelectedValue);
        string strPositionType = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbPositionType")).Text;
        string strLicenseType = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbLicenseType")).Text;
        string strSupervisor = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbSupervisor")).Text;
        bool blSupervisionResponsibilities = bool.Parse(((RadioButtonList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("rblSupervisionResponsibilities")).Text);
        int intWorkPositionID = Convert.ToInt32(((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("ddlWorkPosition")).SelectedValue);
        int intCaseload = Convert.ToInt32(((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbCaseload")).Text);
        bool blGroupExperience = bool.Parse(((RadioButtonList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("rblGroupExperience")).Text);
        string strMajor = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbMajor")).Text;
        int intDegreeYear = Convert.ToInt32(((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbDegreeYear")).Text);
        ListBox lbxLanguages = ((ListBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("lbxLanguages"));
        int intIndividualID = (int)IndividualsBLL.Update(null, strFirstName, strLastName, strUserName, null, strPassword, null, null, null, null, null, null, null, null);
        //int intOrganizationMemberID = (int)OrganizationMembersBLL.Update(null, Convert.ToInt32(Session["OrganizationID"].ToString()), intIndividualID, null, null, null, null, null, null, null, null, null, intAgencyID, strProgram, strTitle, strDegree, intDegreeYear, strMajor, strPosition, strLicense, strAddress, strAddress2, strCity, cbState.SelectedValue, strZipCode, strPhoneNumber, intProgramTypeID, strProgramType, intPositionTypeID, strPositionType, strLicenseType, strSupervisor, blSupervisionResponsibilities, intWorkPositionID, intCaseload, blGroupExperience);

        ////  Send Notice
        //Notifications.SendNewMemberNotice(intOrganizationMemberID);

        ////  Languages
        //foreach(ListItem i in lbxLanguages.Items)
        //{
        //    if (i.Selected)
        //    {
        //        OrganizationMembersBLL.AddLanguage(intOrganizationMemberID, Convert.ToInt32(i.Value));
        //    }
        //}

        FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

        Session["IndividualID"] = intIndividualID.ToString();
        Session["FirstName"] = strFirstName;
        Session["LastName"] = strLastName;

        //  Set up Profile
        //ProfileCommon profile = (ProfileCommon)ProfileCommon.Create(strEmail, true);
        //profile.IndividualID = intIndividualID;
        //profile.FirstName = strFirstName;
        //profile.LastName = strLastName;
        //profile.Gender = strGender;
        //profile.Save();

        string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        if (String.IsNullOrEmpty(continueUrl))
        {
            continueUrl = "~/";
        }
        Response.Redirect(continueUrl);
    }

    protected void ddlProgramType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbProgramType")).Visible = (sender as DropDownList).SelectedItem.Text == "Other";
        ((RequiredFieldValidator)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("rfvProgramType")).Enabled = (sender as DropDownList).SelectedItem.Text == "Other";
    }

    protected void ddlPositionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("tbPositionType")).Visible = (sender as DropDownList).SelectedItem.Text == "Other";
        ((RequiredFieldValidator)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("rfvPositionType")).Enabled = (sender as DropDownList).SelectedItem.Text == "Other";
    }


    protected void cvEmail_ServerValidate(object sender, ServerValidateEventArgs args)
    {
        try
        {
            // Test whether the value entered into the text box is even.
            args.IsValid = IndividualsBLL.SearchByEmail(((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text).Tables[0].Rows.Count == 0;
        }

        catch (Exception ex)
        {
            args.IsValid = false;
        }
    }
}
