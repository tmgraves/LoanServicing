using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_FileUpload : System.Web.UI.UserControl
{
    public FileUpload UploadFile
    {
        get
        {
            return fuFile;
        }
    }

    public string ValidationGroup
    {
        set
        {
            revFile.ValidationGroup = value;
            rfvFile.ValidationGroup = value;
        }
    }

    public bool Required
    {
        set
        {
            rfvFile.Enabled = value;
        }
    }

    public int Width
    {
        set
        {
            fuFile.Width = value;
        }
    }

    public string ErrorMessage
    {
        set
        {
            rfvFile.ErrorMessage = value;
            rfvFile.ToolTip = value;
        }
    }

    public string FileTypes
    {
        set
        {
            revFile.ValidationExpression = value;
        }
    }

    public string FileErrorMessage
    {
        set
        {
            revFile.ErrorMessage = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
