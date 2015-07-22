<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Website.ascx.cs" Inherits="Controls_Website" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:TextBox ID="tbWebsite" runat="server"></asp:TextBox>
(ex: "http://www.yahoo.com")
<asp:RequiredFieldValidator ID="rfvWebsite" runat="server"
    ControlToValidate="tbWebsite"
    Display="Dynamic"
    ErrorMessage="*Required"
    Enabled="false">
</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator id="revWebsite" runat="server"
    ErrorMessage="*Please enter valid website address.<br/>(ex: http://www.google.com)"
    ValidationExpression="(http|https)://([\w-]+\.)+[\w-]+(/[\w- ./?%&=,]*)?"
    ControlToValidate="tbWebsite"
    Display="None">
</asp:RegularExpressionValidator>
<cc1:ValidatorCalloutExtender ID="revWebsiteE" runat="server"
    TargetControlID="revWebsite"
    HighlightCssClass="validatorCalloutHighlight">
</cc1:ValidatorCalloutExtender>
<%--ValidationExpression="^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&%\$#_]*)?$"--%>
