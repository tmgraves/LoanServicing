<%@ Page Title="" Language="C#" MasterPageFile="~/Roles/Admins/administrator.master" AutoEventWireup="true" CodeFile="DistributionPayments.aspx.cs" Inherits="Roles_Admins_DistributionPayments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<p>
    <asp:ObjectDataSource ID="odsDistributionPayments" runat="server"
        SelectMethod="SearchDistributionPayments"
        TypeName="PaymentsBLL">
        <SelectParameters>
            <asp:Parameter Name="IndividualID" Type="Int32" />
            <asp:Parameter Name="DistributionDate" Type="DateTime" />
            <asp:Parameter Name="PaymentNumber" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:DropDownList ID="ddlDistributionPayments" runat="server"
        DataSourceID="odsDistributionPayments"
        DataTextField="DistributionDate"
        DataValueField="DistributionPaymentID"
        AutoPostBack="true"
        AppendDataBoundItems="true">
        <asp:ListItem Text="-- Select a Distribution Payment --" Value="" Selected="True"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="btnDeletePayment" runat="server"
        Text="Delete Batch" onclick="btnDeletePayment_Click" />
</p>
    <asp:ObjectDataSource ID="odsIndividualTotals" runat="server"
        SelectMethod="GetDistributionPaymentIndividualTotals"
        TypeName="PaymentsBLL">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlDistributionPayments" PropertyName="SelectedValue" Name="DistributionPaymentID" Type="Int32" DefaultValue="-1" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:GridView ID="gvIndividualTotals" runat="server"
        AllowPaging="True" 
        AutoGenerateColumns="False"
        CellPadding="2"
        CssClass="DataWebControlStyle" 
        DataSourceID="odsIndividualTotals" 
        ShowFooter="true" 
        Width="400px" onrowdatabound="gvIndividualTotals_RowDataBound">
        <HeaderStyle CssClass="HeaderStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        <SelectedRowStyle BackColor="#EEEEEE" CssClass="SelectedRowStyle" />
        <Columns>
            <asp:BoundField DataField="Payee" HeaderText="Payee" />
            <asp:BoundField DataField="DistributionDate" HeaderText="Distribution Date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Method" HeaderText="Payment Method" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true" />
        </Columns>
    </asp:GridView>


    <p>
        <b>Payment Method:</b>
        <asp:ObjectDataSource ID="odsMethods" runat="server"
            SelectMethod="GetPaymentMethods"
            TypeName="SystemBLL">
        </asp:ObjectDataSource>
        <asp:DropDownList ID="ddlMethod" runat="server" AppendDataBoundItems="True" 
            DataSourceID="odsMethods"
            DataTextField="Method" 
            DataValueField="PaymentMethodID">
            <asp:ListItem Selected="True" Text="-- Select Method --" Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvMethod" runat="server"
            ControlToValidate="ddlMethod"
            ValidationGroup="DistributionPayment"
            Display="dynamic"
            ErrorMessage="*Payment Method Required">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="btnCommit" runat="server"
            Text="Commit Batch"
            ValidationGroup="DistributionPayment"
            onclick="btnCommit_Click" />
    </p>
</asp:Content>

