using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Website : System.Web.UI.UserControl
{
    public string Website
    {
        get
        {
            return tbWebsite.Text;
        }
        set
        {
            tbWebsite.Text = value;
        }
    }

    public bool Required
    {
        get
        {
            return rfvWebsite.Enabled;
        }
        set
        {
            rfvWebsite.Enabled = value;
        }
    }

    public string ValidationGroup
    {
        get
        {
            return rfvWebsite.ValidationGroup;
        }
        set
        {
            rfvWebsite.ValidationGroup = value;
            revWebsite.ValidationGroup = value;
        }
    }

    public int Width
    {
        set
        {
            tbWebsite.Width = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
