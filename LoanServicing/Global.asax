<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

        //  Get the organization record and create Organization Session Dataset
        Session.Add("IndividualID", "");
        Session.Add("FirstName", "");
        Session.Add("LastName", "");
        Session.Add("Email", "");
        Session.Add("Role", "");
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

        Session["OrganizationID"] = null;
        Session["IndividualID"] = null;
        Session["FirstName"] = null;
        Session["LastName"] = null;
        Session["Email"] = null;
        Session["Role"] = null;
    }
</script>
