using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for Tasks
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class Tasks : System.Web.Services.WebService {

    public Tasks () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public bool ProcessBorrowerStatements(string userName, string password, DateTime startDate)
    {
        if (userName == "tadashigraves@gmail.com" && password == "Yuki13")
        {
            Statements.ProcessBorrowerStatements(startDate);
            return true;
        }
        else
        {
            return false;
        }
    }

    [WebMethod]
    public bool ProcessInvestorStatements(string userName, string password, DateTime startDate)
    {
        if (userName == "tadashigraves@gmail.com" && password == "Yuki13")
        {
            Statements.ProcessInvestorStatements(startDate);
            return true;
        }
        else
        {
            return false;
        }
    }
}
