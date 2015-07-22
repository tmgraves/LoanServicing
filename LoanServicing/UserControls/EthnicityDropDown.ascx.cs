using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_EthnicityDropDown : System.Web.UI.UserControl
{
    public int EthnicityID
    {
        get
        {
            return ddlEthnicities.SelectedIndex > 0 ? Convert.ToInt32(ddlEthnicities.SelectedValue) : -999999999;
        }
        set
        {
            ddlEthnicities.SelectedValue = value == 0 ? "" : value.ToString();
        }
    }

    public bool Required
    {
        set
        {
            rfvEthnicity.Enabled = value;
        }
    }

    public string ValidationGroup
    {
        set
        {
            rfvEthnicity.ValidationGroup = value;
        }
    }

    public string ErrorMessage
    {
        set
        {
            rfvEthnicity.ErrorMessage = value;
            rfvEthnicity.ToolTip = value;
        }
    }

    public bool AutoPostBack
    {
        set
        {
            ddlEthnicities.AutoPostBack = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ddlEthnicities_SelectedIndexChanged(object sender, EventArgs e)
    {
        OnSelectedIndexChanged(e);
    }

    public event System.EventHandler Ethnicities_SelectedIndexChanged;

    protected void OnSelectedIndexChanged(EventArgs e)
    {
        if (Ethnicities_SelectedIndexChanged != null)
        {
            Ethnicities_SelectedIndexChanged(this, e);
        }
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e);
    }

    private void InitializeComponent()
    {
        ddlEthnicities.SelectedIndexChanged += new System.EventHandler(this.ddlEthnicities_SelectedIndexChanged);
        this.Load += new System.EventHandler(this.Page_Load);
    }
    #endregion
}