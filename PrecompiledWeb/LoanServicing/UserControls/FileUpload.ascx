<%@ control language="C#" autoeventwireup="true" inherits="Controls_FileUpload, App_Web_1skrkizd" %>
<asp:FileUpload ID="fuFile" runat="server" />
<asp:RegularExpressionValidator id="revFile" runat="server"
    ControlToValidate="fuFile">
</asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvFile" runat="server"
    ControlToValidate="fuFile"
    Enabled="false"
    ErrorMessage="*Required">*</asp:RequiredFieldValidator>
