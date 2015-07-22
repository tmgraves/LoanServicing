<%@ page title="Log In" language="C#" masterpagefile="~/publicmaster.master" autoeventwireup="true" inherits="Account_Login, App_Web_tu3ivthh" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Log In
    </h2>
    <p>
        Please enter your Email and Password.
    </p>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" 
    RenderOuterTable="false" onloggedin="LoginUser_LoggedIn">
        <LayoutTemplate>
            <asp:Panel ID="pnlLogin" runat="server" DefaultButton="LoginButton">
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Account Information</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="Email is required." ToolTip="Email is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:DropDownList ID="ddlRole" runat="server">
                            <asp:ListItem Text="-- Select Your Role --" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="I am a Borrower" Value="Borrower"></asp:ListItem>
                            <asp:ListItem Text="I am an Investor" Value="Investor"></asp:ListItem>
                            <asp:ListItem Text="I am an Administrator" Value="Administrator"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole" 
                             CssClass="failureNotification" ErrorMessage="Please select your Role" ToolTip="Please select your Role" 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:HyperLink ID="hlForgotPassword" runat="server" 
                            Text="Forgot your password? Click here"
                            NavigateUrl="ForgotPassword.aspx"></asp:HyperLink>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"/>
                </p>
            </div>
            </asp:Panel>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>