<%@ page title="" language="C#" masterpagefile="~/Roles/Admins/administrator.master" autoeventwireup="true" inherits="Roles_Admins_Loans, App_Web_wlj5i3du" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>All Loans (as of <%= DateTime.Today.ToString("D") %>)</h1>
<p>
<asp:LinkButton ID="lbAddLoan" runat="server" Text="Create a Loan"></asp:LinkButton>
</p>
<ajaxtoolkit:modalpopupextender ID="mpeLoan" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="btnCancelLoan" 
    PopupControlID="pnlLoan"
    TargetControlID="lbAddLoan" />
<asp:Panel ID="pnlLoan" runat="server" DefaultButton="btnSaveLoan" 
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="1200px">
    <h2>
        Setup a New Loan
    </h2>
    <p>
        Use the form below to create a New Loan.
    </p>
    <asp:ValidationSummary ID="vsLoan" runat="server" CssClass="failureNotification" 
            ValidationGroup="Loan"/>
    <div>
        <fieldset class="loan">
            <legend>File Information</legend>
            <table width="100%">
                <tr>
                    <td valign="top" width="50%">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblName" runat="server" AssociatedControlID="tbName">Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbName" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                        ControlToValidate="tbName" CssClass="failureNotification" 
                                        ErrorMessage="Please enter a Loan Name" ToolTip="Please enter a Loan Name" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" AssociatedControlID="ucLoanAmount$tbValue">Loan Amount:</asp:Label>
                                </td>
                                <td>
                                    <userControls:CurrencyBox ID="ucLoanAmount" runat="server"
                                        Required="true"
                                        ValidationGroup="Loan"
                                        RequiredErrorMessage="Please enter a Loan Amount"
                                        ValueErrorMessage="Enter a valid Loan Amount" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" AssociatedControlID="ucRate$tbValue">Rate:</asp:Label>
                                </td>
                                <td>
                                    <userControls:PercentBox ID="ucRate" runat="server"
                                        Required="true"
                                        ValidationGroup="Loan"
                                        RequiredErrorMessage="Please enter a Rate"
                                        ValueErrorMessage="Enter a valid Rate" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" AssociatedControlID="ucStartDate$tbDate">Start Date:</asp:Label>
                                </td>
                                <td>
                                    <userControls:calendarBox ID="ucStartDate" runat="server"
                                        ValidationGroup="Loan"
                                        Required="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label9" runat="server" AssociatedControlID="ucPenalty$tbValue">Penalty:</asp:Label>
                                </td>
                                <td>
                                    <userControls:CurrencyBox ID="ucPenalty" runat="server"
                                        Required="true"
                                        ValidationGroup="Loan"
                                        RequiredErrorMessage="Please enter a Penalty Amount"
                                        ValueErrorMessage="Enter a valid Penalty Amount" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label10" runat="server" AssociatedControlID="ucPrepayPeriod$tbValue">Prepayment Penalty Period(in Months):</asp:Label>
                                </td>
                                <td>
                                    <userControls:integerTextbox ID="ucPrepayPeriod" runat="server"
                                        Minimum="0"
                                        Required="true"
                                        ValidationGroup="Loan" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" runat="server" AssociatedControlID="ucPayment$tbValue">Payment Amount:</asp:Label>
                                </td>
                                <td>
                                    <userControls:CurrencyBox ID="ucPayment" runat="server"
                                        Required="true"
                                        ValidationGroup="Loan"
                                        RequiredErrorMessage="Please enter a Payment Amount"
                                        ValueErrorMessage="Enter a valid Payment Amount" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" runat="server" AssociatedControlID="ucPaymentDay$tbValue">Payment Day:</asp:Label>
                                </td>
                                <td>
                                    <userControls:integerTextbox ID="ucPaymentDay" runat="server"
                                        Minimum="0"
                                        Maximum="28"
                                        Required="true"
                                        ValidationGroup="Loan" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label13" runat="server" AssociatedControlID="ucGracePeriod$tbValue">Grace Period (in days):</asp:Label>
                                </td>
                                <td>
                                    <userControls:integerTextbox ID="ucGracePeriod" runat="server"
                                        Minimum="0"
                                        Maximum="28"
                                        Required="true"
                                        ValidationGroup="Loan" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label14" runat="server" AssociatedControlID="ucGracePeriod$tbValue">Term (in months):</asp:Label>
                                </td>
                                <td>
                                    <userControls:integerTextbox ID="ucTerm" runat="server"
                                        Minimum="0"
                                        Required="true"
                                        ValidationGroup="Loan" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label15" runat="server" AssociatedControlID="tbPropertyAddress">Property Address:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbPropertyAddress" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPropertyAddress" runat="server" 
                                        ControlToValidate="tbPropertyAddress" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Property Address" ToolTip="Please enter a Property Address" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label16" runat="server" AssociatedControlID="tbPropertyCity">Property City:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbPropertyCity" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvropertyCity" runat="server" 
                                        ControlToValidate="tbPropertyCity" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Property City" ToolTip="Please enter a Property City" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label17" runat="server" AssociatedControlID="cbPropertyState">Property State:</asp:Label>
                                </td>
                                <td>
                                    <asp:ObjectDataSource ID="odsPropertyStates" runat="server"
                                        TypeName="SystemBLL"
                                        SelectMethod="States">
                                    </asp:ObjectDataSource>
                                    <obout:ComboBox runat="server" ID="cbPropertyState"
                                        DataSourceID="odsPropertyStates"
                                        DataTextField="State"
                                        DataValueField="StateCode"
                                        Width="150" MenuWidth="550" EmptyText="Select a state ...">
                                        <CssSettings ItemsContainer="ob_iCboIC long-states" />
                                    </obout:ComboBox>
                                    <asp:RequiredFieldValidator ID="rfvPropertyState" runat="server" 
                                        ControlToValidate="cbState" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Property State" ToolTip="Please enter a Property State" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label18" runat="server" AssociatedControlID="tbPropertyZip">Property Zip Code:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbPropertyZip" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPropertyZip" runat="server" 
                                        ControlToValidate="tbPropertyZip" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Property Zip Code" ToolTip="Please enter a Property Zip Code" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" width="50%">
                        <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="rblBorrower">Is this a New Borrower:</asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rblBorrower" runat="server" 
                                    RepeatDirection="Horizontal" CssClass="radioWithProperWrap" AutoPostBack="true" 
                                    onselectedindexchanged="rblBorrower_SelectedIndexChanged">
                                    <asp:ListItem Text="New" Value="true" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Existing" Value="false"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <asp:MultiView ID="mvBorrower" runat="server" ActiveViewIndex="0">
                        <asp:View ID="vNewBorrower" runat="server">
                            <tr>
                                <td>
                                    <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="tbFirstName">Borrower First Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbFirstName" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                        ControlToValidate="tbFirstName" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Borrower First Name" ToolTip="Please enter a Borrower First Name" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLastName" runat="server" AssociatedControlID="tbLastName">Borrower Last Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbLastName" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                        ControlToValidate="tbLastName" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Borrower Last Name" ToolTip="Please enter a Borrower Last Name" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblAddress" runat="server" AssociatedControlID="tbAddress">Borrower Address:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbAddress" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                        ControlToValidate="tbAddress" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Borrower Address" ToolTip="Please enter a Borrower Address" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCity" runat="server" AssociatedControlID="tbCity">Borrower City:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbCity" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                        ControlToValidate="tbCity" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Borrower City" ToolTip="Please enter a Borrower City" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblState" runat="server" AssociatedControlID="cbState">Borrower State:</asp:Label>
                                </td>
                                <td>
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
                                        ErrorMessage="Please enter Borrower State" ToolTip="Please enter a Borrower State" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbZipCode" runat="server" AssociatedControlID="tbZipCode">Borrower Zip Code:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbZipCode" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                                        ControlToValidate="tbZipCode" CssClass="failureNotification" 
                                        ErrorMessage="Please enter Borrower Zip Code" ToolTip="Please enter a Borrower Zip Code" 
                                        ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" AssociatedControlID="ucEmail">Borrower Email:</asp:Label>
                                </td>
                                <td>
                                    <userControls:Email ID="ucEmail" runat="server" ValidationGroup="Loan" Required="false" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" AssociatedControlID="ucPhone">Borrower Phone Number:</asp:Label>
                                </td>
                                <td>
                                    <userControls:Phone ID="ucPhone" runat="server" ValidationGroup="Loan" Required="false" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" AssociatedControlID="tbSSN">Borrower SSN:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="tbSSN" runat="server" CssClass="textEntry"></asp:TextBox>
                                </td>
                            </tr>
                        </asp:View>
                        <asp:View ID="vExistingBorrower" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" AssociatedControlID="ddlBorrower">Borrower:</asp:Label>
                            </td>
                            <td>
                                <asp:ObjectDataSource ID="odsBorrowers" runat="server"
                                    TypeName="BorrowersBLL"
                                    SelectMethod="Search">
                                </asp:ObjectDataSource>
                                <asp:DropDownList ID="ddlBorrower" runat="server"
                                    DataSourceID="odsBorrowers"
                                    DataTextField="Borrower"
                                    DataValueField="BorrowerID"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="-- Please Select a Borrower --" Value="" Selected="True"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvBorrower" runat="server" 
                                    ControlToValidate="ddlBorrower" CssClass="failureNotification" 
                                    ErrorMessage="Please select a Borrower" ToolTip="Please select a Borrower" 
                                    ValidationGroup="Loan"
                                    Enabled="false">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        </asp:View>
                        </asp:MultiView>
                        </table>
                    </td>
                </tr>
            </table>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="btnSaveLoan" runat="server" Text="Save Loan" 
                    ValidationGroup="Loan"
                    onclick="btnSaveLoan_Click" />
            <asp:Button ID="btnCancelLoan" runat="server" Text="Cancel" />
        </p>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsLoans" runat="server"
    SelectMethod="Search"
    TypeName="LoansBLL">
</asp:ObjectDataSource>
    <asp:GridView ID="gvLoans" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="LoanID"
        DataSourceID="odsLoans"
        Width="75%"
        CssClass="DataWebControlStyle" onrowcommand="gvLoans_RowCommand">
        <HeaderStyle CssClass="HeaderStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
        <Columns>
            <asp:TemplateField HeaderText="Loan">
                <ItemTemplate>
                    <asp:LinkButton ID="lbLoan" runat="server"
                        Text='<%# Eval("Name") %>'
                        PostBackUrl='<%# Eval("LoanID", "~/Roles/Admins/Loan.aspx?lid={0}") %>'>
                    </asp:LinkButton>
                    <ajaxToolkit:HoverMenuExtender ID="hveLoan" runat="Server" 
                        HoverCssClass="popupHover"
                        OffsetX="50"
                        PopDelay="25" 
                        PopupControlID="pnlLoanDetail"
                        PopupPosition="Right" 
                        TargetControlID="lbLoan" />
                    <asp:Panel ID="pnlLoanDetail" runat="server" CssClass="popupMenu">
                        <div style="border:1px outset white;padding:2px;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <label class="searchLabel" style="font-weight: bold;">
                                        Borrower:</label>
                                    </td>
                                    <td>
                                        <%# Eval("Borrower")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="searchLabel" style="font-weight: bold;">
                                        Term:</label>
                                    </td>
                                    <td>
                                        <%# Eval("Term") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="searchLabel" style="font-weight: bold;">
                                        Principal:</label>
                                    </td>
                                    <td>
                                        <%# Eval("Principal", "{0:c}")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="searchLabel" style="font-weight: bold;">
                                        Rate:</label>
                                    </td>
                                    <td>
                                        <%# Eval("Rate", "{0:p}") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="searchLabel" style="font-weight: bold;">
                                        Payment Day of the Month:</label>
                                    </td>
                                    <td>
                                        <%# Eval("PaymentDay")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="searchLabel" style="font-weight: bold;">
                                        Loan Start Date:</label>
                                    </td>
                                    <td>
                                        <%# Eval("StartDate", "{0:D}") %>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Label ID="lblUnpaidDistributions" runat="server"
                        Text="* unpaid distributions"
                        ForeColor="Red"
                        Visible='<%# bool.Parse(Eval("UnpaidDistributions").ToString()) %>'>
                    </asp:Label>
                    <ajaxToolkit:HoverMenuExtender ID="hmeUnpaidDistributions" runat="Server" 
                        HoverCssClass="popupHover"
                        OffsetX="50"
                        PopDelay="25" 
                        PopupControlID="pnlUnpaidDistributions"
                        PopupPosition="Right" 
                        TargetControlID="lblUnpaidDistributions" />
                    <asp:Panel ID="pnlUnpaidDistributions" runat="server" CssClass="popupMenu">
                        <div style="border:1px outset white;padding:2px;">
                            <asp:GridView ID="gvUnpaidDistributions" runat="server"
                                AutoGenerateColumns="False"
                                DataKeyNames="DistributionID"
                                DataSource='<%# LoansBLL.GetDistributions(Convert.ToInt32(Eval("LoanID")), false) %>'
                                CssClass="DataWebControlStyle">
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                <RowStyle Height="100%" />
                                <Columns>
                                    <asp:BoundField DataField="Investor" HeaderText="Investor" />
                                    <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Right" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Investors">
                <ItemTemplate>
                    <asp:LinkButton ID="lbInvestors" runat="server"
                        Text='<%# Eval("Investors", "Investors ({0})") %>'>
                    </asp:LinkButton>
                    <ajaxToolkit:HoverMenuExtender ID="hveInvestors" runat="Server" 
                        HoverCssClass="popupHover"
                        OffsetX="50"
                        PopDelay="25" 
                        PopupControlID="pnlInvestors"
                        PopupPosition="Right" 
                        TargetControlID="lbInvestors" />
                    <asp:Panel ID="pnlInvestors" runat="server" CssClass="popupMenu">
                        <div style="border:1px outset white;padding:2px;">
                            <asp:GridView ID="gvInvestors" runat="server"
                                AutoGenerateColumns="False"
                                DataKeyNames="InvestorID"
                                EmptyDataText="No Investors Assigned"
                                DataSource='<%# LoansBLL.GetInvestors(Convert.ToInt32(Eval("LoanID"))) %>'
                                CssClass="DataWebControlStyle">
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                <RowStyle Height="100%" />
                                <Columns>
                                    <asp:BoundField DataField="Investor" HeaderText="Investor" />
                                    <asp:BoundField DataField="Investment" HeaderText="Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="LoanPercentage" HeaderText="% of Loan" DataFormatString="{0:p}" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="ServicingRate" HeaderText="Servicing Rate" DataFormatString="{0:p}" ItemStyle-HorizontalAlign="Right" />
                                </Columns>
                            </asp:GridView>
                                
                        </div>
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Servicers">
                <ItemTemplate>
                    <asp:LinkButton ID="lbServicers" runat="server"
                        Text='<%# Eval("Servicers", "Servicers ({0})") %>'>
                    </asp:LinkButton>
                    <ajaxToolkit:HoverMenuExtender ID="hveServicers" runat="Server" 
                        HoverCssClass="popupHover"
                        OffsetX="50"
                        PopDelay="25" 
                        PopupControlID="pnlServicers"
                        PopupPosition="Right" 
                        TargetControlID="lbServicers" />
                    <asp:Panel ID="pnlServicers" runat="server" CssClass="popupMenu">
                        <div style="border:1px outset white;padding:2px;">
                            <asp:GridView ID="gvServicers" runat="server"
                                AutoGenerateColumns="False"
                                DataKeyNames="ServicerID"
                                EmptyDataText="No Servicers Assigned"
                                DataSource='<%# LoansBLL.GetServicers(Convert.ToInt32(Eval("LoanID"))) %>'
                                CssClass="DataWebControlStyle">
                                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                                <RowStyle Height="100%" />
                                <Columns>
                                    <asp:BoundField DataField="Servicer" HeaderText="Servicer" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Balance" HeaderText="Balance" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbPayment" runat="server"
                        Text="Add Payment"
                        ToolTip="Click Here to add a Payment for this loan"
                        CommandName="Payment">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
<userControls:UpdatePayment ID="ucUpdatePayment" runat="server">
</userControls:UpdatePayment>
<asp:UpdatePanel ID="upLoan" runat="server" UpdateMode="Conditional">
<ContentTemplate>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

