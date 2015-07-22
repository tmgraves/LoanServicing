<%@ control language="C#" autoeventwireup="true" inherits="UserControls_ReportSections_InvestorStatementList, App_Web_tr2erits" %>
<asp:UpdatePanel ID="upStatement" runat="server" UpdateMode="Conditional">
<ContentTemplate>
</ContentTemplate>
</asp:UpdatePanel>
<table>
    <asp:Panel ID="pnlInvestor" runat="server" Visible="true">
    <tr>
        <td>
            <b>Investor:</b>
        </td>
        <td>
            <asp:ObjectDataSource ID="odsInvestors" runat="server"
                SelectMethod="Search"
                TypeName="InvestorsBLL">
            </asp:ObjectDataSource>
            <asp:DropDownList ID="ddlInvestor" runat="server"
                DataSourceID="odsInvestors"
                DataTextField="Investor"
                DataValueField="InvestorID"
                AutoPostBack="true"
                AppendDataBoundItems="true" 
                onselectedindexchanged="ddlInvestor_SelectedIndexChanged" 
                ondatabound="ddlInvestor_DataBound">
                <asp:ListItem Text="-- Select an Investor --" Value="" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvInvestor" runat="server" 
                ControlToValidate="ddlInvestor"
                CssClass="failureNotification" 
                ErrorMessage="Please pick an Investor"
                ToolTip="Please pick an Investor" 
                ValidationGroup="Search">*
            </asp:RequiredFieldValidator>
        </td>
    </tr>
    </asp:Panel>
    <tr>
        <td>
            <b>Loan:</b>
        </td>
        <td>
            <asp:ObjectDataSource ID="odsLoans" runat="server"
                SelectMethod="SearchByInvestor"
                TypeName="LoansBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="InvestorID" Type="Int32" ControlID="ddlInvestor" DefaultValue="-1" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DropDownList ID="ddlLoans" runat="server"
                DataSourceID="odsLoans"
                DataTextField="Name"
                DataValueField="LoanID"
                AutoPostBack="true"
                Enabled="false"
                AppendDataBoundItems="true" 
                onselectedindexchanged="ddlLoans_SelectedIndexChanged">
                <asp:ListItem Text="-- All Loans --" Value="" Selected="True"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:ObjectDataSource ID="odsDates" runat="server"
                SelectMethod="GetInvestorDates"
                TypeName="StatementsBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="InvestorID" Type="Int32" ControlID="ddlInvestor" DefaultValue="-1" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="LoanID" Type="Int32" ControlID="ddlLoans" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="gvStatements" runat="server"
                DataSourceID="odsDates"
                ShowHeader="false"
                DataKeyNames="StatementDate"
                AutoGenerateColumns="False"
                GridLines="None"
                CellPadding="2"
                AllowPaging="true"
                PageSize="20"
                Width="100%"
                CssClass="DataWebControlStyle"
                onselectedindexchanged="gvStatements_SelectedIndexChanged">
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
                    <asp:ButtonField CommandName="Select" DataTextField="StatementDate" DataTextFormatString="Download Investment Statement for {0:MMMM yyyy}" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
