<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MediaUpload.ascx.cs" Inherits="Controls_MediaUpload" %>
<asp:FileUpload ID="fuFile" runat="server" />
<asp:RegularExpressionValidator id="revFile" runat="server"
    ErrorMessage="Only audio/video files are allowed (.mp3,.wav,.wma,.asf,.asx,.avi,.flv,.mov,.mp4,.mpg,.rm,.swf,.vob,.wmv)"
    ValidationExpression="(.*?)\.(mp3|MP3|wav|WAV|wma|WMA|asf|ASF|asx|ASX|avi|AVI|flv|FLV|mov|MOV|mp4|MP4|mpg|MPG|mpeg|MPEG|rm|RM|swf|SWF|vob|VOB|wmv|WMV)$"
    ControlToValidate="fuFile">
</asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="rfvFile" runat="server"
    ControlToValidate="fuFile"
    Enabled="false"
    ErrorMessage="*Required">*</asp:RequiredFieldValidator>
