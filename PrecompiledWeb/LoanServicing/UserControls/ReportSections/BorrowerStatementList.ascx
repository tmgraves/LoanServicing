<%@ control language="C#" autoeventwireup="true" inherits="UserControls_ReportSections_BorrowerStatementList, App_Web_tr2erits" %>
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
            <asp:ObjectDataSource ID="odsDates" runat="server"
                SelectMethod="GetBorrowerStatementDates"
                TypeName="StatementsBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="LoanID" Type="Int32" ControlID="ddlLoans" DefaultValue="-1" PropertyName="SelectedValue" />
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
                    <asp:ButtonField CommandName="Select" DataTextField="StatementDate" DataTextFormatString="Download Loan Statement for {0:MMMM yyyy}" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
