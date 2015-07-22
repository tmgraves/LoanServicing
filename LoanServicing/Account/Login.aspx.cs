using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ReturnUrl"] != null)
        {
            LoginUser.DestinationPageUrl = Request.QueryString["ReturnUrl"].ToString();
            DropDownList ddlRole = (LoginUser.FindControl("ddlRole") as DropDownList);
            if (Request.QueryString["ReturnUrl"].ToString().IndexOf("/Admins") > 0)
            {
                ddlRole.SelectedIndex = 3;
            }
            else if (Request.QueryString["ReturnUrl"].ToString().IndexOf("/Investors") > 0)
            {
                ddlRole.SelectedIndex = 2;
            }
            else if (Request.QueryString["ReturnUrl"].ToString().IndexOf("/Borrowers") > 0)
            {
                ddlRole.SelectedIndex = 1;
            }
            ddlRole.Enabled = false;
        }
        if (User.Identity.IsAuthenticated && Request.QueryString["ReturnUrl"] != null)
        {
            Response.Redirect("NotAuthorized.aspx");
        }
    }

    protected void LoginUser_LoggedIn(object sender, EventArgs e)
    {
        ProfileCommon p = Profile.GetProfile(LoginUser.UserName);

        p.Role = "Administrator";
        DataTable dtMember = IndividualsBLL.SearchByEmail(p.UserName).Tables[0];

        //  Set Profile Properties
        p.FirstName = null;
        p.LastName = null;
        p.IndividualID = 0;
        p.Email = null;
        p.BorrowerID = 0;
        p.InvestorID = 0;
        p.AdministratorID = 0;
        p.Role = null;
        p.FirstName = dtMember.Rows[0]["FirstName"].ToString();
        p.LastName = dtMember.Rows[0]["LastName"].ToString();
        p.IndividualID = Convert.ToInt32(dtMember.Rows[0]["IndividualID"].ToString());
        p.Email = dtMember.Rows[0]["Email"].ToString();
        p.Save();

        bool changePassword = bool.Parse(dtMember.Rows[0]["ChangePassword"].ToString());

        DropDownList ddlRole = (LoginUser.FindControl("ddlRole") as DropDownList);

        string redirect;
        switch (ddlRole.SelectedValue)
        {
            case "Borrower":
                p.BorrowerID = dtMember.Rows[0]["BorrowerID"].ToString() != "" ? Convert.ToInt32(dtMember.Rows[0]["BorrowerID"].ToString()) : 0;
                p.Role = "Borrower";
                p.Save();
                redirect = "~/Roles/Borrowers/Default.aspx";
                break;
            case "Investor":
                p.InvestorID = dtMember.Rows[0]["InvestorID"].ToString() != "" ? Convert.ToInt32(dtMember.Rows[0]["InvestorID"].ToString()) : 0;
                p.Role = "Investor";
                p.Save();
                redirect = "~/Roles/Investors/Default.aspx";
                break;
            case "Administrator":
                p.AdministratorID = dtMember.Rows[0]["AdministratorID"].ToString() != "" ? Convert.ToInt32(dtMember.Rows[0]["AdministratorID"].ToString()) : 0;
                p.Role = "Administrator";
                p.Save();
                redirect = "~/Roles/Admins/Default.aspx";
                break;
            default:
                redirect = "NotAuthorized.aspx";
                break;
        }

        if (bool.Parse(dtMember.Rows[0]["ChangePassword"].ToString()))
        {
            if (Request.QueryString["ReturnUrl"] == null)
            {
                Response.Redirect("ChangePassword.aspx" + "?ReturnUrl=" + redirect);
            }
            else
            {
                Response.Redirect("ChangePassword.aspx" + "?ReturnUrl=" + Request.QueryString["ReturnUrl"].ToString());
            }
        }
        if (Request.QueryString["ReturnUrl"] == null)
        {
            Response.Redirect(redirect);
        }
    }
}
