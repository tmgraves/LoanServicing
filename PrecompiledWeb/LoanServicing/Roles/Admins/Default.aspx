<%@ page title="" language="C#" masterpagefile="~/Roles/Admins/administrator.master" autoeventwireup="true" inherits="Roles_Administrators_Default, App_Web_wlj5i3du" async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<table width="98%" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <td colspan="2">
            <div style="width: 100%; float: left; height: 100px;">
            <h1 style="padding: 10px;">Welcome to the Loan Management System</h1>
            </div>
        </td>
        <td align="center" rowspan="2" style="width: 33%;">
            <div class="homepageBox">
            <h3 class="homepageBoxHeader">Latest Activity</h3>
            <asp:ObjectDataSource ID="odsLoans" runat="server"
                SelectMethod="Search"
                TypeName="LoansBLL">
            </asp:ObjectDataSource>
            <asp:GridView ID="gvLoans" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="LoanID"
                DataSourceID="odsLoans"
                Showheader="false"
                GridLines="None"
                Width="100%"
                CssClass="DataWebControlStyle">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:TemplateField HeaderText="Loan">
                        <ItemTemplate>
                            <asp:Label ID="lblLoan" runat="server"
                                Text='<%# Eval("Name") %>'>
                            </asp:Label><br />
                            <asp:Label ID="Label1" runat="server"
                                Style="padding-left: 10px;"
                                Text='<%# "<b>Last Payment:</b> " + Eval("LastPayment", "{0:c} on ") + Eval("LastPaymentDate", "{0:d}") %>'>
                            </asp:Label><br />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            <div class="homepageBox">
            <h3 class="homepageBoxHeader">Common Tasks</h3>
                <table width="100%" cellpadding="5">
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton4" runat="server"
                                Text="Record a Loan Payment"
                                CssClass="homepageLink"
                                PostBackUrl="Loans.aspx">
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lbInvestorStatements" runat="server"
                                Text="View Loan Statements"
                                CssClass="homepageLink"
                                PostBackUrl="Statements/InvestorIncomeStatement.aspx">
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lbBorrowerStatements" runat="server"
                                Text="View Borrower Statements"
                                CssClass="homepageLink"
                                PostBackUrl="Statements/BorrowerLoanStatement.aspx">
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="homepageBox">
            <h3 class="homepageBoxHeader">My Information</h3>
                <table width="100%" cellpadding="5">
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton2" runat="server"
                                Text="Update My Information"
                                CssClass="homepageLink"
                                PostBackUrl="MyInfo.aspx">
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton3" runat="server"
                                Text="Change My password"
                                CssClass="homepageLink"
                                PostBackUrl="MyInfo.aspx">
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="homepageBox">
            <h3 class="homepageBoxHeader">Tax Documents</h3>
                <table cellspacing="5" width="100%">
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server"
                                Text="Form 1098 & 1099"
                                CssClass="homepageLink"
                                PostBackUrl="Statements/IncomeTaxForms.aspx">
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr valign="top" align="center">
        <td>
            <div class="homepageBox">
            <h3 class="homepageBoxHeader">Investors</h3>
            <asp:ObjectDataSource ID="odsInvestors" runat="server"
                SelectMethod="Search"
                UpdateMethod="Update"
                TypeName="InvestorsBLL">
            </asp:ObjectDataSource>
            <asp:GridView ID="gvInvestors" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="InvestorID"
                ShowHeader="false"
                GridLines="None"
                DataSourceID="odsInvestors"
                Width="100%"
                CssClass="DataWebControlStyle">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:BoundField DataField="Investor" HeaderText="Investor" />
                    <asp:BoundField DataField="TotalInvestment" HeaderText="Total Investment" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                </Columns>
            </asp:GridView>
            </div>
        </td>
        <td>
            <div class="homepageBox">
            <h3 class="homepageBoxHeader">Borrowers</h3>
            <asp:ObjectDataSource ID="odsBorrowers" runat="server"
                SelectMethod="Search"
                DeleteMethod="Delete"
                TypeName="BorrowersBLL">
            </asp:ObjectDataSource>
            <asp:GridView ID="gvBorrowers" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="BorrowerID"
                DataSourceID="odsBorrowers"
                ShowHeader="false"
                GridLines="None"
                Width="100%"
                CssClass="DataWebControlStyle">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:BoundField DataField="Borrower" HeaderText="Borrower" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Loan Amount" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:c}" />
                </Columns>
            </asp:GridView>
            </div>
        </td>
    </tr>
</table>
</asp:Content>

