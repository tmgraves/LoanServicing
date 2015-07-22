using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_CalendarTextbox : System.Web.UI.UserControl
{
    public DateTime? Date
    {
        get
        {
            return tbDate.Text == "" ? null : (DateTime?)Convert.ToDateTime(tbDate.Text);
        }
        set
        {
            tbDate.Text = Convert.ToDateTime(value).ToShortDateString() == "1/1/1900" ? "" : Convert.ToDateTime(value).ToShortDateString();
        }
    }

    public bool Required
    {
        set
        {
            rfvDate.Enabled = value;
            cvDate.Enabled = value;
        }
    }

    public string ValidationGroup
    {
        set
        {
            rfvDate.ValidationGroup = value;
            cvDate.ValidationGroup = value;
            rvDate.ValidationGroup = value;
        }
    }

    public string ErrorMessage
    {
        set
        {
            rfvDate.ErrorMessage = value;
            rfvDate.ToolTip = value;
        }
    }

    public DateTime MinimumDate
    {
        set
        {
            rvDate.MinimumValue = value.ToShortDateString();
        }
        get
        {
            return Convert.ToDateTime(rvDate.MinimumValue == "" ? "1/1/1900" : rvDate.MinimumValue);
        }
    }

    public DateTime MaximumDate
    {
        set
        {
            rvDate.MaximumValue = value.ToShortDateString();
        }
        get
        {
            return Convert.ToDateTime(rvDate.MaximumValue == "" ? "1/1/1900" : rvDate.MaximumValue);
        }
    }

    public bool RangeRequired
    {
        set
        {
            rvDate.Enabled = value;
        }
    }

    public string RangeErrorMessage
    {
        set
        {
            rvDate.ErrorMessage = value;
        }
    }

    public bool Enabled
    {
        set
        {
            tbDate.Enabled = value;
            tbDate.Text = "";
            ceDate.Enabled = value;
            ibCalendar.Enabled = value;
            Required = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void Clear()
    {
        tbDate.Text = "";
    }
}
