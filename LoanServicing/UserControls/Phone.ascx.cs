using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

public partial class Controls_Phone : System.Web.UI.UserControl
{
    public string Phone
    {
        get
        {
            return tbPhone.Text;
        }
        set
        {
            tbPhone.Text = value;
        }
    }

    //  Required
    public bool Required
    {
        get
        {
            return rfvPhone.Enabled;
        }
        set
        {
            rfvPhone.Enabled = value;
        }
    }

    public string ValidationGroup
    {
        get
        {
            return rfvPhone.ValidationGroup;
        }
        set
        {
            rfvPhone.ValidationGroup = value;
        }
    }

    //  Required
    public int Width
    {
        set
        {
            tbPhone.Width = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
