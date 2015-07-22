<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CurrencyTextbox.ascx.cs" Inherits="UserControls_CurrencyTextbox" %>
<asp:TextBox ID="tbValue" runat="server" Style="text-align: right;"></asp:TextBox>
<asp:CompareValidator ID="cvValue" runat="server"
    ControlToValidate="tbValue"
    Type="Currency"
    ValidationGroup="Value"
    Operator="DataTypeCheck"
    ErrorMessage="Please enter a valid amount">
</asp:CompareValidator>
<asp:RequiredFieldValidator ID="rfvValue" runat="server"
    ControlToValidate="tbValue"
    Display="dynamic"
    Enabled="false"
    ErrorMessage="*Required"
    ValidationGroup="Value">*
</asp:RequiredFieldValidator>
