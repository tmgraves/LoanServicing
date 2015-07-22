using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Email : System.Web.UI.UserControl
{
    public string Email
    {
        get
        {
            return tbEmail.Text;
        }
        set
        {
            tbEmail.Text = value;
        }
    }

    //  Required
    public bool Required
    {
        get
        {
            return rfvEmail.Enabled;
        }
        set
        {
            rfvEmail.Enabled = value;
        }
    }

    public string ValidationGroup
    {
        get
        {
            return rfvEmail.ValidationGroup;
        }
        set
        {
            rfvEmail.ValidationGroup = value;
            revEmail.ValidationGroup = value;
        }
    }

    public int Width
    {
        set
        {
            tbEmail.Width = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }
}
