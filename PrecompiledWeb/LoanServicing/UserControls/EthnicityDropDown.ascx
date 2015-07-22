<%@ control language="C#" autoeventwireup="true" inherits="UserControls_EthnicityDropDown, App_Web_1skrkizd" %>
<asp:ObjectDataSource ID="odsEthnicities" runat="server"
    SelectMethod="GetEthnicities"
    TypeName="SystemBLL">
</asp:ObjectDataSource>
<asp:DropDownList ID="ddlEthnicities" runat="server"
    DataSourceID="odsEthnicities"
    DataTextField="Ethnicity"
    DataValueField="EthnicityID"
    AppendDataBoundItems="true">
    <asp:ListItem Text="-- Please Select an Ethnicity --" Value="" Selected="True"></asp:ListItem>
</asp:DropDownList>
<asp:RequiredFieldValidator ID="rfvEthnicity" runat="server" ControlToValidate="ddlEthnicities" 
        CssClass="failureNotification"
        Enabled="false"
        ErrorMessage="Ethnicity is required." ToolTip="Please select an Ethnicity.">*</asp:RequiredFieldValidator>
