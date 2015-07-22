<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StateComboBox.ascx.cs" Inherits="UserControls_StateComboBox" %>
<asp:ObjectDataSource ID="odsStates" runat="server"
    TypeName="SystemBLL"
    SelectMethod="States">
</asp:ObjectDataSource>
<obout:ComboBox runat="server" ID="cbState"
    DataSourceID="odsStates"
    DataTextField="State"
    DataValueField="StateCode"
    Width="150" MenuWidth="550" EmptyText="Select a state ...">
    <CssSettings ItemsContainer="ob_iCboIC long-states" />
</obout:ComboBox>
<asp:RequiredFieldValidator ID="rfvState" runat="server" 
    ControlToValidate="cbState" CssClass="failureNotification" 
    ErrorMessage="Please enter State" ToolTip="Please enter a State">*</asp:RequiredFieldValidator>
