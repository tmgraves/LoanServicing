using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_StateComboBox : System.Web.UI.UserControl
{
    public string State
    {
        get
        {
            return cbState.SelectedValue;
        }
        set
        {
            cbState.SelectedValue = value;
        }
    }

    public string ValidationGroup
    {
        set
        {
            rfvState.ValidationGroup = value;
        }
    }

    public bool Required
    {
        set
        {
            rfvState.Enabled = value;
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}