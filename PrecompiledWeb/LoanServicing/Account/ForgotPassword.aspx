<%@ page title="" language="C#" masterpagefile="~/publicmaster.master" autoeventwireup="true" inherits="Account_ForgotPassword, App_Web_tu3ivthh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<style type="text/css">
.recoverylabel
{
	width: 100px;
	font-weight: bold;
}
</style>
<asp:PasswordRecovery ID="prPassword" runat="server"
    MailDefinition-BodyFileName="~/EmailTemplates/PasswordRecovery.txt"
    MailDefinition-Subject="Your password for Utiloan"
    Width="100%">
        <UserNameTemplate>
            <h2>Enter your Email to retrieve your password</h2>
            <fieldset class="contact">
                <p>
                    <asp:Label ID="UserNameLabel" runat="server" Width="100px" CssClass="recoverylabel">Email:</asp:Label>
                    <asp:TextBox ID="UserName" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
                        CssClass="failureNotification" 
                        ControlToValidate="UserName"
                        ErrorMessage="* Email is required"
                        ToolTip="Email is required"
                        Display="Dynamic"
                        ValidationGroup="PasswordRecovery"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator id="revEmail" runat="server"
                        CssClass="failureNotification" 
                        ControlToValidate="UserName"
                        ValidationGroup="PasswordRecovery"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ToolTip="Enter a Valid Email"
                        ErrorMessage="* Enter a Valid Email">
                    </asp:RegularExpressionValidator>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="tbweEmail" runat="server"
                        TargetControlID="UserName"
                        WatermarkText="joesmith@email.com"
                        WatermarkCssClass="watermarked textEntry">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                </p>
                <p>
                    <asp:Label ID="FailureText" runat="server"
                        EnableViewState="false"
                        ForeColor="Red"></asp:Label>
                </p>
                <p>
                    <asp:Button ID="btnSubmit" runat="server"
                        CommandName="Submit"
                        Text="Submit"
                        ValidationGroup="PasswordRecovery" />
                </p>
            </fieldset>
        </UserNameTemplate>
        <SuccessTemplate>
            <fieldset class="passwordRecover">
                <p>Your password has been sent to you.  Please check your email for your password.</p>
                <p>
                    <asp:Button ID="btnLogin" runat="server"
                        Text="Go to Login Page"
                        PostBackUrl="~/Default.aspx" />
                </p>
            </fieldset>
        </SuccessTemplate>
</asp:PasswordRecovery>
</asp:Content>
