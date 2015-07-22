<%@ page title="Change Password" language="C#" masterpagefile="~/publicmaster.master" autoeventwireup="true" inherits="Account_ChangePassword, App_Web_tu3ivthh" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server"
    CssClass="failureNotification" 
    ValidationGroup="ChangeUserPasswordValidationGroup"
    Font-Size="12px"/>
<asp:ChangePassword ID="ChangeUserPassword" runat="server" 
    CancelDestinationPageUrl="~/"
    EnableViewState="false"
    RenderOuterTable="false"
    ChangePasswordFailureText="Change Failed!" >
    <ChangePasswordTemplate>
        <span class="failureNotification">
            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
        </span>
        <p>
            Use the form below to change your password.
        </p>
        <p>
            New passwords are required to be:<br/>
                    <ul>
                    <li>a minimum of <b><asp:Label ID="lblPasswordLength" runat="server" Text="0"></asp:Label></b> characters in length</li>
                    <li>and have at least <b><asp:Label ID="lblSymbols" runat="server" Text="0"></asp:Label></b> non-alphanumeric character such as !, $, &, or #</li>
                    </ul>
        </p>
        <div class="accountInfo">
            <fieldset class="changePassword">
                <legend>Account Information</legend>
                <p>
                    <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                    <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                            CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required." 
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvCheckCurrentPassword" runat="server"
                        ControlToValidate="CurrentPassword"
                        CssClass="failureNotification"
                        ErrorMessage="Your entry for Old Password is incorrect."
                        OnServerValidate="cvCheckCurrentPassword_ServerValidate"
                        ValidationGroup="ChangeUserPasswordValidationGroup">*
                    </asp:CustomValidator>
                </p>
                <p>
                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                    <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                            CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." 
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvChangePassword" runat="server"
                        ControlToCompare="CurrentPassword"
                        ControlToValidate="NewPassword" 
                        CssClass="failureNotification"
                        Display="Dynamic"
                        Operator="NotEqual"
                        ErrorMessage="New Password must be different from Old Password."
                        ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                </p>
                <p>
                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                            CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                            ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                            CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                </p>
            </fieldset>
            <p class="submitButton">
                <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" 
                        ValidationGroup="ChangeUserPasswordValidationGroup"/>
            </p>
        </div>
    </ChangePasswordTemplate>
    <SuccessTemplate>
        Your password was changed!
    </SuccessTemplate>
</asp:ChangePassword>
</asp:Content>