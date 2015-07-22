using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_PictureUpload : System.Web.UI.UserControl
{
    public FileUpload Image
    {
        get
        {
            return fuImage;
        }
    }

    public string ValidationGroup
    {
        set
        {
            revImage.ValidationGroup = value;
            rfvImage.ValidationGroup = value;
        }
    }

    public bool Required
    {
        set
        {
            rfvImage.Enabled = value;
        }
    }

    public int Width
    {
        set
        {
            fuImage.Width = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
