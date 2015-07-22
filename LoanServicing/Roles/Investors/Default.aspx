<%@ Page Title="" Language="C#" MasterPageFile="~/Roles/Investors/investor.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Roles_Investors_Default" %>

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
            <h3 class="homepageBoxHeader">Common Tasks</h3>
                <table width="100%" cellpadding="5">
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
                                Text="Form 1099"
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
            <h3 class="homepageBoxHeader">Latest Activity</h3>
            <asp:ObjectDataSource ID="odsLoans" runat="server"
                SelectMethod="SearchByInvestor"
                TypeName="LoansBLL">
                <SelectParameters>
                    <asp:ProfileParameter Name="InvestorID" PropertyName="InvestorID" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
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
        </td>
        <td>
            <div class="homepageBox">
            <h3 class="homepageBoxHeader">Summary</h3>
            <asp:ObjectDataSource ID="odsInvestor" runat="server"
                SelectMethod="Get"
                TypeName="InvestorsBLL">
                <SelectParameters>
                    <asp:ProfileParameter Name="InvestorID" PropertyName="InvestorID" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="dvInvestor" runat="server"
                AutoGenerateRows="False"
                DataSourceID="odsInvestor"
                GridLines="None"
                Width="100%"
                DataKeyNames="InvestorID">
                <Fields>
                    <asp:BoundField DataField="Loans" HeaderText="# of Loans" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="TotalInvestment" HeaderText="Total Invested" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="YTDEarnings" HeaderText="YTD Earnings" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="MonthlyIncome" HeaderText="Approximate Monthly Income" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                </Fields>
            </asp:DetailsView>
            </div>
        </td>
    </tr>
</table>
</asp:Content>

