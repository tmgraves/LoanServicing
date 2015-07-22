using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_CurrencyTextbox : System.Web.UI.UserControl
{
    public decimal? Value
    {
        get
        {
            return tbValue.Text == "" ? null : (decimal?)Convert.ToDecimal(tbValue.Text);
        }
        set
        {
            tbValue.Text = value == null ? "" : value.ToString();
        }
    }

    public string ValidationGroup
    {
        set
        {
            cvValue.ValidationGroup = value;
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
            cvValue.ErrorMessage = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}