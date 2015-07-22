<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EthnicityDropDown.ascx.cs" Inherits="UserControls_EthnicityDropDown" %>
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
