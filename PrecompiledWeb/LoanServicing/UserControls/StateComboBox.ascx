<%@ control language="C#" autoeventwireup="true" inherits="UserControls_StateComboBox, App_Web_1skrkizd" %>
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
