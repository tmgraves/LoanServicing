﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_ChangePasswordSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnReturn_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ReturnUrl"] != null)
        {
            Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
        }
    }
}
