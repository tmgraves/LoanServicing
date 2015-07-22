<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PictureUpload.ascx.cs" Inherits="Controls_PictureUpload" %>
<asp:FileUpload ID="fuImage" runat="server" />
<asp:RegularExpressionValidator id="revImage" runat="server"
    ErrorMessage="Only image files are allowed (.jpg, .gif, .png)"
    ValidationExpression="(.*?)\.(jpg|JPG|gif|GIF|jpeg|JPEG|png|PNG)$"
    ControlToValidate="fuImage">
</asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvImage" runat="server"
    ControlToValidate="fuImage"
    Enabled="false"
    ErrorMessage="*Required" />
