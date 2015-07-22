<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PenaltyNotice.ascx.cs" Inherits="UserControls_ReportSections_PenaltyNotice" %>
<table>
    <tr>
        <td>
            <b>Loan:</b>
        </td>
        <td>
            <asp:DropDownList ID="ddlLoans" runat="server"
                DataTextField="Name"
                DataValueField="LoanID"
                AutoPostBack="true"
                AppendDataBoundItems="true">
                <asp:ListItem Text="-- Select a Loan --" Value="" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                ControlToValidate="ddlLoans"
                CssClass="failureNotification" 
                ErrorMessage="Please pick a Loan"
                ToolTip="Please pick a Loan" 
                ValidationGroup="Search">*
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:ObjectDataSource ID="odsPenalties" runat="server"
                SelectMethod="GetPenalties"
                TypeName="LoansBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="LoanID" Type="Int32" ControlID="ddlLoans" DefaultValue="-1" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="gvPenalties" runat="server"
                DataSourceID="odsPenalties"
                ShowHeader="false"
                DataKeyNames="PenaltyID"
                AutoGenerateColumns="False"
                GridLines="None"
                CellPadding="2"
                AllowPaging="true"
                PageSize="20"
                Width="100%"
                CssClass="DataWebControlStyle"
                onselectedindexchanged="gvPenalties_SelectedIndexChanged">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <PagerSettings Mode="NumericFirstLast"
                    Position="TopAndBottom"
                    FirstPageText="First"
                    LastPageText="Last"
                    PageButtonCount="5" />
                <PagerStyle
                    Height="30px"
                    Font-Size="12px"
                    Width="100%"
                    HorizontalAlign="Center" />
                <Columns>
                    <asp:ButtonField CommandName="Select" DataTextField="PenaltyDate" DataTextFormatString="Download Penalty Notice for {0:MMMM yyyy}" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
