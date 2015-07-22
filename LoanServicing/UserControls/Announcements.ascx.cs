using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
using System.Globalization;

public partial class Controls_Announcements : System.Web.UI.UserControl
{
    private int intWidth = 120;
    private int intTop = 3;

    //  Banner Image Type
    public int Width
    {
        get
        {
            return intWidth;
        }
        set
        {
            intWidth = value;
            dvAnnouncements.Width = intWidth;
        }
    }

    //  Banner Image Type
    public int Top
    {
        get
        {
            return intTop;
        }
        set
        {
            intTop = value;
        }
    }

    //  Play
    public bool Play
    {
        get
        {
            if (ViewState["Play"] != null)
            {
                return bool.Parse(ViewState["Play"].ToString());
            }
            else
                return false;
        }
        set
        {
            ViewState["Play"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }
    protected void dvAnnouncements_DataBound(object sender, EventArgs e)
    {
        if (dvAnnouncements.CurrentMode == DetailsViewMode.ReadOnly)
        {
            for (int i = 0; i < dvAnnouncements.Rows.Count; i++)
            {
                (dvAnnouncements.Rows[i].Controls[0] as DataControlFieldCell).Text = "";
            }
        }

        //  Disable timer reload
        if (dvAnnouncements.PageCount == 1)
        {
            tAnnouncements.Enabled = false;
        }
        else
        {
            tAnnouncements.Enabled = Play;
            ae.Enabled = Play;
        }
    }
    protected void tAnnouncements_Tick(object sender, EventArgs e)
    {
        if (dvAnnouncements.PageIndex < (dvAnnouncements.PageCount - 1))
        {
            dvAnnouncements.PageIndex += 1;
        }
        else
        {
            dvAnnouncements.PageIndex = 0;
        }
    }
    protected void ibPause_Click(object sender, ImageClickEventArgs e)
    {
        if (Play)
        {
            tAnnouncements.Enabled = false;
            ae.Enabled = false;
        }
        else
        {
            tAnnouncements.Enabled = true;
            ae.Enabled = true;
        }
        Play = Play ? false : true;
    }

    protected void dlBoxes_ItemCommand(object source, DataListCommandEventArgs e)
    {
        dvAnnouncements.PageIndex = e.Item.ItemIndex;
    }
}
