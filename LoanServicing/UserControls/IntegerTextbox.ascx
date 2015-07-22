<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IntegerTextbox.ascx.cs" Inherits="Controls_IntegerTextbox" %>
<asp:TextBox ID="tbValue" runat="server"
    Style="text-align: right;"
    Width="50px"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvValue" runat="server"
    ControlToValidate="tbValue"
    Display="Dynamic"
    ErrorMessage="*"
    Enabled="false">
</asp:RequiredFieldValidator>
<asp:CompareValidator ID="cvValue" runat="server"
    ControlToValidate="tbValue"
    Operator="DataTypeCheck"
    Type="Integer"
    Display="None"
    ErrorMessage="Please enter a valid value">
</asp:CompareValidator>
<ajaxToolkit:ValidatorCalloutExtender ID="cvValueE" runat="server"
    TargetControlID="cvValue"
    HighlightCssClass="validatorCalloutHighlight">
</ajaxToolkit:ValidatorCalloutExtender>
<asp:RangeValidator id="rvValue" runat="server"
    ControlToValidate="tbValue"
    MaximumValue="1000"
    MinimumValue="1"
    Type="Integer"
    Display="None"
    ErrorMessage="*Please enter a valid value">
</asp:RangeValidator>
<ajaxToolkit:ValidatorCalloutExtender ID="rvValueE" runat="server"
    TargetControlID="rvValue"
    HighlightCssClass="validatorCalloutHighlight">
</ajaxToolkit:ValidatorCalloutExtender>

<asp:CompareValidator ID="cvInvalidValue" runat="server"
    ControlToValidate="tbValue"
    Operator="NotEqual"
    Type="Integer"
    Display="None"
    ValueToCompare="-1"
    ErrorMessage="That value is not allowed">
</asp:CompareValidator>
<ajaxToolkit:ValidatorCalloutExtender ID="vcInvalidValue" runat="server"
    TargetControlID="cvInvalidValue"
    HighlightCssClass="validatorCalloutHighlight">
</ajaxToolkit:ValidatorCalloutExtender>
