using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_PercentageTextbox : System.Web.UI.UserControl
{
    public decimal? Value
    {
        get
        {
            return tbValue.Text == "" ? null : (decimal?)(Convert.ToDecimal(tbValue.Text)/100);
        }
        set
        {
            tbValue.Text = value == null ? "" : value.ToString();
        }
    }

    public decimal Minimum
    {
        set
        {
            mevValue.MinimumValue = value.ToString();
        }
    }

    public decimal Maximum
    {
        set
        {
            mevValue.MaximumValue = value.ToString();
        }
    }

    public string ValidationGroup
    {
        set
        {
            mevValue.ValidationGroup = value;
            rfvValue.ValidationGroup = value;
        }
    }

    public bool Required
    {
        set
        {
            rfvValue.Enabled = value;
        }
    }

    public string RequiredErrorMessage
    {
        set
        {
            rfvValue.ErrorMessage = value;
        }
    }

    public string ValueErrorMessage
    {
        set
        {
            mevValue.ErrorMessage = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}