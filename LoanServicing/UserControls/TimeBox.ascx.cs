using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_TimeBox : System.Web.UI.UserControl
{
    public DateTime Time
    {
        get
        {
            if (tbTime.Text == "")
            {
                return Convert.ToDateTime("00:00 AM");
            }
            else
            {
                return Convert.ToDateTime(tbTime.Text);
            }
        }
        set
        {
            tbTime.Text = value.ToShortTimeString();
        }
    }

    public bool Required
    {
        set
        {
            rfvTime.Enabled = value;
        }
    }

    public string ValidationGroup
    {
        set
        {
            rfvTime.ValidationGroup = value;
            rvTime.ValidationGroup = value;
        }
    }

    public string ErrorMessage
    {
        set
        {
            rfvTime.ErrorMessage = value;
            rfvTime.ToolTip = value;
        }
    }

    public string CssClass
    {
        set
        {
            rfvTime.CssClass = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
