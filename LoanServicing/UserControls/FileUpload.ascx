<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FileUpload.ascx.cs" Inherits="Controls_FileUpload" %>
<asp:FileUpload ID="fuFile" runat="server" />
<asp:RegularExpressionValidator id="revFile" runat="server"
    ControlToValidate="fuFile">
</asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvFile" runat="server"
    ControlToValidate="fuFile"
    Enabled="false"
    ErrorMessage="*Required">*</asp:RequiredFieldValidator>
