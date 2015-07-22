<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Email.ascx.cs" Inherits="Controls_Email" %>

<asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvEmail" runat="server"
    CssClass="failureNotification"
    ControlToValidate="tbEmail"
    ValidationGroup="Address"
    Enabled="false"
    ToolTip="Please enter an Email Address"
    ErrorMessage="Email Address is Required">*
</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator id="revEmail" runat="server"
    CssClass="failureNotification"
    ControlToValidate="tbEmail"
    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
    ErrorMessage="Enter a Valid Email"
    ToolTip="Please enter a Valid Email">*
</asp:RegularExpressionValidator>
<ajaxToolkit:TextBoxWatermarkExtender ID="tbweEmail" runat="server"
    TargetControlID="tbEmail"
    WatermarkText="joesmith@email.com"
    WatermarkCssClass="watermarked textEntry">
</ajaxToolkit:TextBoxWatermarkExtender>
