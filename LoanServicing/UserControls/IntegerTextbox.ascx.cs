using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_IntegerTextbox : System.Web.UI.UserControl
{
    private string _validationGroup = "";

    public int? Value
    {
        get
        {
            return tbValue.Text != "" ? (int?)Convert.ToInt32(tbValue.Text) : null;
        }
        set
        {
            tbValue.Text = value == null ? "" : value.ToString();
        }
    }

    public bool Required
    {
        get
        {
            return rfvValue.Enabled;
        }
        set
        {
            if (value)
            {
                rfvValue.Enabled = true;
            }
            else
            {
                rfvValue.Enabled = false;
            }
        }
    }

    public bool InputEnabled
    {
        get
        {
            return tbValue.Enabled;
        }
        set
        {
            tbValue.Enabled = value;
        }
    }

    public string ValidationGroup
    {
        get
        {
            return _validationGroup;
        }
        set
        {
            _validationGroup = value;
            cvValue.ValidationGroup = value;
            rfvValue.ValidationGroup = value;
            rvValue.ValidationGroup = value;
            cvInvalidValue.ValidationGroup = value;
        }
    }

    public int Minimum
    {
        set
        {
            rvValue.MinimumValue = value.ToString();
        }
    }

    public int Maximum
    {
        set
        {
            rvValue.MaximumValue = value.ToString();
        }
    }

    public int InvalidValue
    {
        set
        {
            cvInvalidValue.ValueToCompare = value.ToString();
        }
    }

    public int Width
    {
        set
        {
            tbValue.Width = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
