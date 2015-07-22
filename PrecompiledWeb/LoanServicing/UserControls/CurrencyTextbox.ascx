<%@ control language="C#" autoeventwireup="true" inherits="UserControls_CurrencyTextbox, App_Web_1skrkizd" %>
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
