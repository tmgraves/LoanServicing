<%@ Page Title="" Language="C#" MasterPageFile="~/Roles/Admins/administrator.master" AutoEventWireup="true" CodeFile="Loan.aspx.cs" Inherits="Roles_Admins_Loan" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Button ID="btnBack" runat="server"
    Text="Back to Loans"
    PostBackUrl="~/Roles/Admins/Loans.aspx" />
<asp:UpdatePanel ID="upLoan" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<asp:ObjectDataSource ID="odsLoan" runat="server"
    SelectMethod="Get"
    UpdateMethod="Update"
    TypeName="LoansBLL">
    <SelectParameters>
        <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="LoanID" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="BorrowerID" Type="Int32" />
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="Rate" Type="Decimal" />
        <asp:Parameter Name="Principal" Type="Decimal" />
        <asp:Parameter Name="Penalty" Type="Decimal" />
        <asp:Parameter Name="PrepaymentPenaltyPeriod" Type="Int32" />
        <asp:Parameter Name="PaymentAmount" Type="Decimal" />
        <asp:Parameter Name="PaymentDay" Type="Int32" />
        <asp:Parameter Name="GracePeriod" Type="Int32" />
        <asp:Parameter Name="Term" Type="Int32" />
        <asp:Parameter Name="PropertyAddress" Type="String" />
        <asp:Parameter Name="PropertyCity" Type="String" />
        <asp:Parameter Name="PropertyState" Type="String" />
        <asp:Parameter Name="PropertyZip" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsMethods" runat="server"
    SelectMethod="GetPaymentMethods"
    TypeName="SystemBLL">
</asp:ObjectDataSource>
<table>
    <tr>
        <td>
            <asp:DetailsView ID="dvLoan" runat="server"
                AutoGenerateRows="False" 
                CssClass="DataWebControlStyle"
                DataKeyNames="LoanID" 
                DataSourceID="odsLoan" onitemupdated="dvLoan_ItemUpdated">
                <FieldHeaderStyle BackColor="#EEEEEE" Font-Bold="True" Width="300px" />
                <Fields>
                    <asp:CommandField ShowEditButton="true" EditText="Edit Loan" UpdateText="Save Loan" ValidationGroup="Loan" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="Name" HeaderText="Loan" />
                    <asp:BoundField DataField="Borrower" HeaderText="Borrower" ReadOnly="true" />
                    <asp:BoundField DataField="Term" HeaderText="Term (in Months)" />
                    <asp:TemplateField HeaderText="Principal">
                        <ItemTemplate>
                            <%# Eval("Principal", "{0:c}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:CurrencyBox ID="ucPrincipal" runat="server"
                                Required="true"
                                ValidationGroup="Loan"
                                Value='<%# Bind("Principal") %>'
                                RequiredErrorMessage="Please enter a Principal Amount"
                                ValueErrorMessage="Enter a valid Principal Amount" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rate">
                        <ItemStyle/>
                        <ItemTemplate>
                            <%# Eval("Rate", "{0:p}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:PercentBox ID="ucRate" runat="server"
                                Value='<%# Bind("Rate") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Amount">
                        <ItemTemplate>
                            <%# Eval("PaymentAmount", "{0:c}") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:CurrencyBox ID="ucPaymentAmount" runat="server"
                                Required="true"
                                ValidationGroup="Loan"
                                Value='<%# Bind("PaymentAmount") %>'
                                RequiredErrorMessage="Please enter a Payment Amount"
                                ValueErrorMessage="Enter a valid Payment Amount" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PaymentDay" HeaderText="Payment Day of the Month" />
                    <asp:TemplateField HeaderText="Prepayment Penalty Period (in Months)">
                        <ItemTemplate>
                            <%# Eval("PrepaymentPenaltyPeriod")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:integerTextbox ID="ucPrepaymentPenaltyPeriod" runat="server"
                                Required="true"
                                ValidationGroup="Loan"
                                Value='<%# Bind("PrepaymentPenaltyPeriod") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Penalty Amount">
                        <ItemTemplate>
                            <%# Eval("Penalty", "{0:c}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:CurrencyBox ID="ucPenaltyAmount" runat="server"
                                Required="true"
                                ValidationGroup="Loan"
                                Value='<%# Bind("Penalty") %>'
                                RequiredErrorMessage="Please enter a Penalty Amount"
                                ValueErrorMessage="Enter a valid Penalty Amount" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grace Period (in Days)">
                        <ItemTemplate>
                            <%# Eval("GracePeriod")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:integerTextbox ID="ucGracePeriod" runat="server"
                                Required="true"
                                ValidationGroup="Loan"
                                Value='<%# Bind("GracePeriod") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loan Start Date">
                        <ItemTemplate>
                            <%# Eval("StartDate", "{0:d}") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:calendarBox ID="ucStartDate" runat="server"
                                ValidationGroup="Loan"
                                Date='<%# Bind("StartDate") %>'
                                Required="true" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <%# Eval("PropertyAddress")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbAddress" runat="server" CssClass="textEntry"
                                Text='<%# Bind("PropertyAddress") %>' >
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ControlToValidate="tbAddress" CssClass="failureNotification" 
                                ErrorMessage="Please enter Address" ToolTip="Please enter a Address" 
                                ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <%# Eval("PropertyCity")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbCity" runat="server" CssClass="textEntry"
                                Text='<%# Bind("PropertyCity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                ControlToValidate="tbCity" CssClass="failureNotification" 
                                ErrorMessage="Please enter City" ToolTip="Please enter a City" 
                                ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <%# Eval("PropertyState")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:StateComboBox ID="ucState" runat="server"
                                ValidationGroup="Loan"
                                State='<%# Bind("PropertyState") %>'
                                Required="true" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zip">
                        <ItemTemplate>
                            <%# Eval("PropertyZip")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbZip" runat="server" CssClass="textEntry"
                                Text='<%# Bind("PropertyZip") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                                ControlToValidate="tbZip" CssClass="failureNotification" 
                                ErrorMessage="Please enter Zip Code" ToolTip="Please enter a Zip Code" 
                                ValidationGroup="Loan">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Balance" HeaderText="Balance" DataFormatString="{0:c}" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Closed Date">
                        <ItemTemplate>
                            <%# Eval("Closed")%>
                            <asp:Button ID="btnDeactivate" runat="server"
                                Visible='<%# Eval("Closed").ToString() == "" ? true : false %>'
                                Text="Deactivate"
                                 onclick="btnDeactivate_Click"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" EditText="Edit Loan" UpdateText="Save Loan" ValidationGroup="Loan" ItemStyle-HorizontalAlign="Right" />
                </Fields>
            </asp:DetailsView>
        </td>
        <td valign="top">
        </td>
    </tr>
</table>
<br />
<ajaxToolkit:TabContainer ID="tcLoanDetails" runat="server">
<ajaxToolkit:TabPanel ID="tpPayments" runat="server" HeaderText="Payments">
<ContentTemplate>
<p>
<asp:LinkButton ID="lbAddPayment" runat="server"
    Text="Add Payment" onclick="lbAddPayment_Click"></asp:LinkButton>
</p>
<div style="visibility: hidden;">
<asp:LinkButton ID="lbPaymentDummy" runat="server" >Dummy</asp:LinkButton>
</div>
<ajaxtoolkit:modalpopupextender ID="mpePayment" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="ctl00$ctl00$MainContent$MainContent$tcLoanDetails$tpPayments$dvPayment$btnCancelPayment"
    PopupControlID="pnlPayment"
    TargetControlID="lbPaymentDummy" DynamicServicePath="" Enabled="True" />
<asp:Panel ID="pnlPayment" runat="server"
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <p>
        Use the form below to create a Payment.
    </p>
    <asp:ValidationSummary ID="vsLoan" runat="server" CssClass="failureNotification" 
            ValidationGroup="Payment"/>
    <div>
        <fieldset class="payment">
            <legend>Payment Information</legend>
            <asp:ObjectDataSource ID="odsPayment" runat="server"
                SelectMethod="GetPayment"
                InsertMethod="UpdatePayment"
                UpdateMethod="UpdatePayment"
                TypeName="LoansBLL">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter Name="PaymentID" Type="Int32" ControlID="gvPayments" DefaultValue="-1" PropertyName="SelectedValue" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="PaymentID" Type="Int32" />
                    <asp:ControlParameter Name="LoanID" Type="Int32" ControlID="dvLoan" DefaultValue="-1" PropertyName="SelectedValue" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="PaymentDate" Type="DateTime" />
                    <asp:Parameter Name="PaymentNumber" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="PaymentMethodID" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="dvPayment" runat="server"
                DefaultMode="Insert"
                AutoGenerateRows="False"
                DataSourceID="odsPayment"
                DataKeyNames="PaymentID,LoanID"
                GridLines="None"
                OnDataBound="dvPayment_DataBound"
                oniteminserted="dvPayment_ItemInserted" 
                onitemupdated="dvPayment_ItemUpdated" >
                <Fields>
                    <asp:TemplateField HeaderText="Payment Amount:">
                        <EditItemTemplate>
                            <userControls:CurrencyBox ID="ucAmount" runat="server"
                                Required="true"
                                ValidationGroup="Payment"
                                Value='<%# Bind("Amount") %>'
                                RequiredErrorMessage="Please enter a Payment Amount"
                                ValueErrorMessage="Enter a valid Payment Amount" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <userControls:CurrencyBox ID="ucAmount" runat="server"
                                Required="true"
                                ValidationGroup="Payment"
                                Value='<%# Bind("Amount") %>'
                                RequiredErrorMessage="Please enter a Payment Amount"
                                ValueErrorMessage="Enter a valid Payment Amount" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Date:">
                        <EditItemTemplate>
                            <userControls:calendarBox ID="ucPaymentDate" runat="server"
                                ValidationGroup="Payment"
                                Date='<%# Bind("PaymentDate") %>'
                                Required="true" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <userControls:calendarBox ID="ucPaymentDate" runat="server"
                                ValidationGroup="Payment"
                                Date='<%# Bind("PaymentDate") %>'
                                Required="true" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Number:">
                        <HeaderStyle VerticalAlign="Top" />
                        <EditItemTemplate>
                            <asp:TextBox ID="tbPaymentNumber" runat="server"
                                Text='<%# Bind("PaymentNumber") %>'
                                CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPaymentNumber" runat="server" 
                                ControlToValidate="tbPaymentNumber" CssClass="failureNotification" 
                                ErrorMessage="Payment Number Required" ToolTip="Enter Confirmation Number from Bank Transaction" 
                                ValidationGroup="Payment">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="tbPaymentNumber" runat="server"
                                Text='<%# Bind("PaymentNumber") %>'
                                CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPaymentNumber" runat="server" 
                                ControlToValidate="tbPaymentNumber" CssClass="failureNotification" 
                                ErrorMessage="Payment Number Required" ToolTip="Enter Confirmation Number from Bank Transaction" 
                                ValidationGroup="Payment">*</asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description:">
                        <HeaderStyle VerticalAlign="Top" />
                        <EditItemTemplate>
                            <asp:TextBox ID="tbDescription" runat="server"
                                Text='<%# Bind("Description") %>'
                                Width="400px"
                                Height="100px"
                                TextMode="MultiLine"
                                CssClass="textEntry"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="tbDescription" runat="server"
                                Text='<%# Bind("Description") %>'
                                Width="400px"
                                Height="100px"
                                TextMode="MultiLine"
                                CssClass="textEntry"></asp:TextBox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Payment Method:">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlMethod" runat="server"
                                SelectedValue='<%# Bind("PaymentMethodID") %>'
                                DataSourceID="odsMethods"
                                DataTextField="Method"
                                DataValueField="PaymentMethodID"
                                AppendDataBoundItems="True">
                                <asp:ListItem Text="-- Select a Payment Method --" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlMethod" runat="server"
                                SelectedValue='<%# Bind("PaymentMethodID") %>'
                                DataSourceID="odsMethods"
                                DataTextField="Method"
                                DataValueField="PaymentMethodID"
                                AppendDataBoundItems="True">
                                <asp:ListItem Text="-- Select a Payment Method --" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server"
                                Text="Save Payment"
                                CommandName="Update"
                                ValidationGroup="Payment" />
                            <asp:Button ID="btnCancelPayment" runat="server"
                                Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button ID="btnInsert" runat="server"
                                Text="Save Payment"
                                CommandName="Insert"
                                ValidationGroup="Payment" />
                            <asp:Button ID="btnCancelPayment" runat="server"
                                Text="Cancel" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </fieldset>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsPayments" runat="server"
    SelectMethod="GetPayments"
    DeleteMethod="DeletePayment"
    TypeName="LoansBLL" ondeleted="odsPayments_Deleted">
    <SelectParameters>
        <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:GridView ID="gvPayments" runat="server"
    AutoGenerateColumns="False"
    Font-Size="11px"
    AllowPaging="True"
    PageSize="50"
    DataKeyNames="PaymentID"
    DataSourceID="odsPayments"
    CssClass="DataWebControlStyle" 
    onselectedindexchanged="gvPayments_SelectedIndexChanged" 
    onrowcommand="gvPayments_RowCommand">
    <HeaderStyle CssClass="HeaderStyle" />
    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
    <PagerStyle CssClass="pager" Font-Size="14px" HorizontalAlign="Right" />
    <PagerSettings Position="TopAndBottom" />
    <Columns>
        <asp:BoundField DataField="PaymentDate" HeaderText="Date" 
            DataFormatString="{0:d}" >
        <ItemStyle HorizontalAlign="Left" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="Amount">
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Right" />
            <ItemTemplate>
                <asp:LinkButton ID="lbAmount" runat="server"
                    Text='<%# Eval("Amount", "{0:c}") %>'>
                </asp:LinkButton>
                <ajaxToolkit:HoverMenuExtender ID="hveAmount" runat="Server" 
                    HoverCssClass="popupHover"
                    OffsetX="50"
                    PopDelay="25" 
                    PopupControlID="pnlAmount"
                    PopupPosition="Right" 
                    TargetControlID="lbAmount" />
                <asp:Panel ID="pnlAmount" runat="server" CssClass="popupMenu">
                    <div style="border:1px outset white;padding:2px;">
                        <table width="100%">
                            <tr>
                                <td>
                                    <label class="searchLabel" style="font-weight: bold;">
                                    PaymentNumber:</label>
                                </td>
                                <td>
                                    <%# Eval("PaymentNumber")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="searchLabel" style="font-weight: bold;">
                                    Payment Method:</label>
                                </td>
                                <td>
                                    <%# Eval("Method")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="searchLabel" style="font-weight: bold;">
                                    Description:</label>
                                </td>
                                <td>
                                    <%# Eval("Description")%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="PaymentNumber" HeaderText="Transaction Number" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lbDistributions" runat="server"
                    Text="Distributions"
                    ToolTip="Click Here to view Payment Distributions"
                    CommandName="Distributions">
                </asp:LinkButton>
                <asp:Label ID="lblPaid" runat="server"
                    Text="(Not Paid)"
                    ForeColor="Red"
                    ToolTip="Not all Distributions for this Payment have been Paid Out"
                    Visible='<%# !bool.Parse(Eval("Paid").ToString()) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="Edit" />
        <asp:TemplateField>
        <ItemTemplate>
            <asp:Button ID="btnDelete" runat="server"
                Text="Delete"
                CommandName="Delete"
                OnClientClick="javascript:return confirm('Are you sure you want to delete this Payment?')" />
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<div style="visibility: hidden;">
<asp:LinkButton ID="lbDummyDistributions" runat="server" >Dummy</asp:LinkButton>
</div>
<ajaxtoolkit:modalpopupextender ID="mpeDistributions" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="ibClose"
    PopupControlID="pnlDistributions"
    TargetControlID="lbDummyDistributions" DynamicServicePath="" Enabled="True" />
<asp:Panel ID="pnlDistributions" runat="server"
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="800px">
    <div style="float: right; padding: 5px;">
        <asp:ImageButton ID="ibClose" runat="server" ImageUrl="~/images/closewindow.gif" />
    </div>
    <h2>
        Distributions
    </h2>
    <div>
        <fieldset class="loan">
            <legend>Payment Distributions</legend>
            <asp:ObjectDataSource ID="odsDistributions" runat="server"
                SelectMethod="SearchDistributions"
                UpdateMethod="UpdateDistribution"
                TypeName="PaymentsBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="PaymentID" ControlID="gvPayments" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:Parameter Name="InvestorID" Type="Int32" />
                    <asp:Parameter Name="Paid" Type="Boolean" />
                    <asp:Parameter Name="PaymentMethodID" Type="Int32" />
                    <asp:Parameter Name="PaymentNumber" Type="String" />
                    <asp:Parameter Name="ServicingFee" Type="Boolean" DefaultValue="False" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DistributionID" Type="Int32" />
                    <asp:Parameter Name="DistributionDate" Type="DateTime" />
                    <asp:Parameter Name="PaymentMethodID" Type="Int32" />
                    <asp:Parameter Name="PaymentNumber" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="gvDistributions" runat="server"
                AutoGenerateColumns="False"
                Font-Size="10px"
                CellPadding="2"
                Width="100%"
                DataKeyNames="DistributionID"
                DataSourceID="odsDistributions"
                CssClass="DataWebControlStyle"
                OnRowCommand="gvDistributions_RowCommand">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:BoundField DataField="Investor" HeaderText="Investor" ItemStyle-Width="125px" />
                    <asp:TemplateField HeaderText="Amount" >
                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbAmount" runat="server"
                                Text='<%# Eval("NetAmount", "{0:c}") %>'>
                            </asp:LinkButton>
                            <ajaxToolkit:HoverMenuExtender ID="hveAmount" runat="Server" 
                                HoverCssClass="popupHover"
                                OffsetX="50"
                                PopDelay="25" 
                                PopupControlID="pnlAmount"
                                PopupPosition="Right" 
                                TargetControlID="lbAmount" />
                            <asp:Panel ID="pnlAmount" runat="server" CssClass="popupMenu">
                                <div style="border:1px outset white;padding:2px;">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Payment Amount:</label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label8" runat="server"
                                                    Text='<%# Eval("PaymentAmount", "{0:c}")%>'>
                                                </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                % Share of Loan:</label>
                                            </td>
                                            <td align="right">
                                                <%# Eval("LoanPercentage", "{0:p}")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Share Amount:</label>
                                            </td>
                                            <td align="right">
                                                <%# Eval("Amount", "{0:c}")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Interest + Penalty:</label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="Label6" runat="server"
                                                    Text='<%# String.Format("{0:c}", Convert.ToDecimal(Eval("InterestPenaltyPaid")))  %>'>
                                                </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Servicing Amount:</label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblServicingAmount" runat="server"
                                                    Text='<%# Eval("ServicingAmount", "-{0:c}")%>'
                                                    ForeColor="Red">
                                                </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Net Amount:</label>
                                            </td>
                                            <td align="right">
                                                <%# Eval("NetAmount", "{0:c}")%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DistributionDate" HeaderText="Date" DataFormatString="{0:d}" ItemStyle-Width="175px" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="Method" HeaderText="Payment Method" ItemStyle-Width="175px" />
                    <asp:BoundField DataField="PaymentNumber" HeaderText="Payment #" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsServicingDistributions" runat="server"
                SelectMethod="SearchDistributions"
                UpdateMethod="UpdateDistribution"
                TypeName="PaymentsBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="PaymentID" ControlID="gvPayments" PropertyName="SelectedValue" Type="Int32" DefaultValue="-1" />
                    <asp:Parameter Name="InvestorID" Type="Int32" />
                    <asp:Parameter Name="Paid" Type="Boolean" />
                    <asp:Parameter Name="PaymentMethodID" Type="Int32" />
                    <asp:Parameter Name="PaymentNumber" Type="String" />
                    <asp:Parameter Name="ServicingFee" Type="Boolean" DefaultValue="True" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DistributionID" Type="Int32" />
                    <asp:Parameter Name="DistributionDate" Type="DateTime" />
                    <asp:Parameter Name="PaymentMethodID" Type="Int32" />
                    <asp:Parameter Name="PaymentNumber" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="gvServicingDistributions" runat="server"
                AutoGenerateColumns="False"
                Font-Size="10px"
                CellPadding="2"
                Width="100%"
                DataKeyNames="DistributionID"
                DataSourceID="odsServicingDistributions"
                CssClass="DataWebControlStyle"
                OnRowCommand="gvServicingDistributions_RowCommand">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:BoundField DataField="Servicer" HeaderText="Servicer" ItemStyle-Width="125px" />
                    <asp:TemplateField HeaderText="Servicing Amount">
                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbAmount" runat="server"
                                Text='<%# Eval("ServicingAmount", "{0:c}") %>'>
                            </asp:LinkButton>
                            <ajaxToolkit:HoverMenuExtender ID="hveAmount" runat="Server" 
                                HoverCssClass="popupHover"
                                OffsetX="50"
                                PopDelay="25" 
                                PopupControlID="pnlAmount"
                                PopupPosition="Right" 
                                TargetControlID="lbAmount" />
                            <asp:Panel ID="pnlAmount" runat="server" CssClass="popupMenu">
                                <div style="border:1px outset white;padding:2px;">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                From Investor (@<%# Eval("ServicingRate", "{0:p}") %>):</label>
                                            </td>
                                            <td align="right">
                                                <%# Eval("Investor")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Payment Amount:</label>
                                            </td>
                                            <td align="right">
                                                <%# Eval("Amount", "{0:c}")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Servicing Amount:</label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblServicingAmount" runat="server"
                                                    Text='<%# Eval("ServicingAmount", "{0:c}")%>'>
                                                </asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DistributionDate" HeaderText="Date" DataFormatString="{0:d}" ItemStyle-Width="175px" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="Method" HeaderText="Payment Method" ItemStyle-Width="175px" />
                    <asp:BoundField DataField="PaymentNumber" HeaderText="Payment #" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsDistributionTotal" runat="server"
                SelectMethod="GetPayment"
                TypeName="LoansBLL">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter Name="PaymentID" Type="Int32" ControlID="gvPayments" PropertyName="SelectedValue" DefaultValue="-1" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:GridView ID="gvTotal" runat="server"
                AutoGenerateColumns="False"
                Font-Size="12px"
                CellPadding="2"
                Width="100%"
                ShowHeader="false"
                DataSourceID="odsDistributionTotal"
                CssClass="DataWebControlStyle">
                <RowStyle Font-Bold="true" />
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:TemplateField ItemStyle-Width="125px">
                        <ItemTemplate>
                            Total
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Amount" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:c}" />
                    <asp:TemplateField ItemStyle-Width="175px">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="175px">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="btnFinishDistributions" runat="server" Text="Finished Updating" 
                Visible="false"
                onclick="btnFinishDistributions_Click" />
        </p>
    </div>
</asp:Panel>
</ContentTemplate>
</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="tpPenalties" runat="server" HeaderText="Penalties">
<ContentTemplate>
<p>
<asp:LinkButton ID="lbAddPenalty" runat="server"
    Text="Add Penalty">
</asp:LinkButton>
</p>
<ajaxtoolkit:modalpopupextender ID="mpePenalty" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="ctl00$ctl00$MainContent$MainContent$tcLoanDetails$tpPenalties$dvPenalty$btnCancelPenalty"
    PopupControlID="pnlPenalty"
    TargetControlID="lbAddPenalty"
    DynamicServicePath=""
    Enabled="True" />
<asp:Panel ID="pnlPenalty" runat="server"
    Height="400px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <p>
        Use the form below to add a Penalty.
    </p>
    <asp:ValidationSummary ID="vsPenalty" runat="server" CssClass="failureNotification" 
            ValidationGroup="Penalty"/>
    <div>
        <fieldset class="servicer">
            <legend>Penalty Information</legend>
            <asp:ObjectDataSource ID="odsPenalty" runat="server"
                SelectMethod="GetPayment"
                InsertMethod="UpdatePenalty"
                UpdateMethod="UpdatePenalty"
                TypeName="LoansBLL">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
                    <asp:ControlParameter Name="PenaltyID" Type="Int32" ControlID="gvPenalties" DefaultValue="-1" PropertyName="SelectedValue" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="PenaltyID" Type="Int32" />
                    <asp:ControlParameter Name="LoanID" Type="Int32" ControlID="dvLoan" DefaultValue="-1" PropertyName="SelectedValue" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="PenaltyDate" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="dvPenalty" runat="server"
                DefaultMode="Insert"
                AutoGenerateRows="False"
                DataSourceID="odsPenalty"
                DataKeyNames="PenaltyID,LoanID"
                GridLines="None"
                Width="100%"
                oniteminserted="dvPenalty_ItemInserted" 
                onitemupdated="dvPenalty_ItemUpdated" >
                <Fields>
                    <asp:TemplateField HeaderText="Penalty Date:">
                        <EditItemTemplate>
                            <userControls:calendarBox ID="ucPenaltyDate" runat="server"
                                ValidationGroup="Penalty"
                                Date='<%# Bind("PenaltyDate") %>'
                                Required="true" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <userControls:calendarBox ID="ucPenaltyDate" runat="server"
                                ValidationGroup="Penalty"
                                Date='<%# Bind("PenaltyDate") %>'
                                Required="true" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Penalty Amount:">
                        <EditItemTemplate>
                            <userControls:CurrencyBox ID="ucPenaltyAmount" runat="server"
                                Required="true"
                                ValidationGroup="Penalty"
                                Value='<%# Bind("Amount") %>'
                                RequiredErrorMessage="Please enter a Penalty Amount"
                                ValueErrorMessage="Enter a valid Penalty Amount" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <userControls:CurrencyBox ID="ucPenaltyAmount" runat="server"
                                Required="true"
                                ValidationGroup="Penalty"
                                Value='<%# Bind("Amount") %>'
                                RequiredErrorMessage="Please enter a Penalty Amount"
                                ValueErrorMessage="Enter a valid Penalty Amount" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server"
                                Text="Save Penalty"
                                CommandName="Update"
                                ValidationGroup="Penalty" />
                            <asp:Button ID="btnCancelPenalty" runat="server"
                                Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button ID="btnInsert" runat="server"
                                Text="Save Penalty"
                                CommandName="Insert"
                                ValidationGroup="Penalty" />
                            <asp:Button ID="btnCancelPenalty" runat="server"
                                Text="Cancel" />
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </fieldset>
    </div>
</asp:Panel>
    <asp:ObjectDataSource ID="odsPenalties" runat="server"
        SelectMethod="GetPenalties"
        DeleteMethod="DeletePenalty"
        TypeName="LoansBLL"
        ondeleted="odsPenalties_Deleted">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="gvPenalties" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="PenaltyID"
        DataSourceID="odsPenalties"
        CssClass="DataWebControlStyle">
        <HeaderStyle CssClass="HeaderStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
        <Columns>
            <asp:BoundField DataField="PenaltyDate" HeaderText="Penalty Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="Amount" HeaderText="Penalty Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
            <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnDelete" runat="server"
                    Text="Delete"
                    CommandName="Delete"
                    OnClientClick="javascript:return confirm('Are you sure you want to delete this Payment?')" />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</ContentTemplate>
</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="tpInvestors" runat="server" HeaderText="Investors">
<ContentTemplate>
<p>
<asp:LinkButton ID="lbAddInvestor" runat="server"
    Text="Add Investor">
</asp:LinkButton>
</p>
<ajaxtoolkit:modalpopupextender ID="mpeInvestor" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="btnCancelInvestor"
    PopupControlID="pnlInvestor"
    TargetControlID="lbAddInvestor"
    DynamicServicePath=""
    Enabled="True" />
<asp:Panel ID="pnlInvestor" runat="server" DefaultButton="btnSaveInvestor" 
    Height="400px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <p>
        Use the form below to add a Investor.
    </p>
    <asp:ValidationSummary ID="vsInvestor" runat="server" CssClass="failureNotification" 
            ValidationGroup="Investor"/>
    <div>
        <fieldset class="servicer">
            <legend>Investor Information</legend>
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="ddlInvestor">Investors:</asp:Label>
                    </td>
                    <td>
                        <asp:ObjectDataSource ID="odsInvestor" runat="server"
                            SelectMethod="Search"
                            TypeName="InvestorsBLL">
                        </asp:ObjectDataSource>
                        <asp:DropDownList ID="ddlInvestor" runat="server"
                            DataSourceID="odsInvestor"
                            DataTextField="Investor"
                            DataValueField="InvestorID"
                            AppendDataBoundItems="True">
                            <asp:ListItem Text="-- Select a Investor --" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="ucInvestment$tbValue">Investment:</asp:Label>
                    </td>
                    <td>
                        <userControls:CurrencyBox ID="ucInvestment" runat="server"
                            Required="true"
                            ValidationGroup="Investor"
                            RequiredErrorMessage="Please enter an Investment Amount"
                            ValueErrorMessage="Enter a valid Investment Amount" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="ucServicingRate$tbValue">Servicing Rate:</asp:Label>
                    </td>
                    <td>
                        <userControls:PercentBox ID="ucServicingRate" runat="server"
                            Required="true"
                            ValidationGroup="Investor"
                            RequiredErrorMessage="Please enter a Servicing Rate"
                            ValueErrorMessage="Enter a valid Servicing Rate" />
                    </td>
                </tr>
            </table>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="btnSaveInvestor" runat="server" Text="Save Investor" 
                    ValidationGroup="Investor"
                    onclick="btnSaveInvestor_Click" />
            <asp:Button ID="btnCancelInvestor" runat="server" Text="Cancel" />
        </p>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsInvestors" runat="server"
    SelectMethod="GetInvestors"
    UpdateMethod="UpdateInvestor"
    DeleteMethod="DeleteInvestor"
    TypeName="LoansBLL">
    <SelectParameters>
        <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:GridView ID="gvInvestors" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="InvestorID, LoanID"
    EmptyDataText="No Investors Assigned"
    DataSourceID="odsInvestors"
    CssClass="DataWebControlStyle">
    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    <RowStyle Height="100%" />
    <Columns>
        <asp:BoundField DataField="Investor" HeaderText="Investor" ReadOnly="true" />
        <asp:TemplateField HeaderText="Investment Amount">
            <ItemStyle HorizontalAlign="Right" />
            <ItemTemplate>
                <%# Eval("Investment", "{0:c}") %>
            </ItemTemplate>
            <EditItemTemplate>
                <userControls:CurrencyBox ID="ucInvestment" runat="server"
                    Value='<%# Bind("Investment") %>' />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="LoanPercentage" HeaderText="% of Loan" ReadOnly="true" DataFormatString="{0:p}" />
        <asp:TemplateField HeaderText="Servicing Rate">
            <ItemStyle HorizontalAlign="Right" />
            <ItemTemplate>
                <%# Eval("ServicingRate", "{0:p}")%>
            </ItemTemplate>
            <EditItemTemplate>
                <userControls:PercentBox ID="ucServicingRate" runat="server"
                    Value='<%# Bind("ServicingRate") %>' />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Edit" />
        <asp:TemplateField>
        <ItemTemplate>
            <asp:Button ID="btnDelete" runat="server"
                Text="Delete"
                CommandName="Delete"
                OnClientClick="javascript:return confirm('Are you sure you want to delete this Group?')" />
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</ContentTemplate>
</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="tpServicers" runat="server" HeaderText="Servicers">
<ContentTemplate>
<p>
    <asp:LinkButton ID="lbAddServicer" runat="server" Text="Add Servicer"></asp:LinkButton>
</p>
<ajaxtoolkit:modalpopupextender ID="mpeServicer" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="btnCancelServicer"
    PopupControlID="pnlServicer"
    TargetControlID="lbAddServicer"
    DynamicServicePath=""
    Enabled="True" />
<asp:Panel ID="pnlServicer" runat="server" DefaultButton="btnSaveServicer" 
    Height="200px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <p>
        Use the form below to add a Servicer.
    </p>
    <asp:ValidationSummary ID="vsServicer" runat="server" CssClass="failureNotification" 
            ValidationGroup="Servicer"/>
    <div>
        <fieldset class="servicer">
            <legend>Servicer Information</legend>
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" AssociatedControlID="ddlServicers">Servicers:</asp:Label>
                    </td>
                    <td>
                        <asp:ObjectDataSource ID="odsNewServicers" runat="server"
                            SelectMethod="Search"
                            TypeName="ServicersBLL">
                        </asp:ObjectDataSource>
                        <asp:DropDownList ID="ddlServicers" runat="server"
                            DataSourceID="odsNewServicers"
                            DataTextField="Servicer"
                            DataValueField="ServicerID"
                            AppendDataBoundItems="True">
                            <asp:ListItem Text="-- Select a Servicer --" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="btnSaveServicer" runat="server" Text="Save Servicer" 
                    ValidationGroup="Servicer"
                    onclick="btnSaveServicer_Click" />
            <asp:Button ID="btnCancelServicer" runat="server" Text="Cancel" />
        </p>
    </div>
</asp:Panel>
<asp:ObjectDataSource ID="odsServicers" runat="server"
    SelectMethod="GetServicers"
    UpdateMethod="UpdateServicer"
    DeleteMethod="DeleteServicer"
    TypeName="LoansBLL">
    <SelectParameters>
        <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:GridView ID="gvServicers" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="ServicerID, LoanID"
    EmptyDataText="No Servicers Assigned"
    DataSourceID="odsServicers"
    CssClass="DataWebControlStyle">
    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    <RowStyle Height="100%" />
    <Columns>
        <asp:BoundField DataField="Servicer" HeaderText="Servicer" ReadOnly="true" />
        <asp:TemplateField>
        <ItemTemplate>
            <asp:Button ID="btnDelete" runat="server"
                Text="Delete"
                CommandName="Delete"
                OnClientClick="javascript:return confirm('Are you sure you want to delete this Servicer?')" />
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</ContentTemplate>
</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="tpSchedule" runat="server" HeaderText="Loan Schedule">
<ContentTemplate>
<asp:ObjectDataSource ID="odsLoanSchedule" runat="server"
    SelectMethod="GetSchedule"
    TypeName="LoansBLL">
    <SelectParameters>
        <asp:QueryStringParameter QueryStringField="lid" Name="LoanID" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:GridView ID="gvSchedule" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="LoanScheduleID"
    DataSourceID="odsLoanSchedule"
    AllowPaging="true"
    PageSize="100"
    Width="100%"
    CssClass="DataWebControlStyle">
    <HeaderStyle CssClass="HeaderStyle" />
    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
    <PagerStyle CssClass="pager" Font-Size="14px" HorizontalAlign="Right" />
    <PagerSettings Mode="Numeric" PageButtonCount="10" Position="TopAndBottom" />
    <Columns>
        <asp:BoundField DataField="LoanDay" HeaderText="Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="Interest" HeaderText="Daily Interest" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="AccruedInterest" HeaderText="Total Interest" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="PenaltyAmount" HeaderText="Penalty" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="TotalPenalty" HeaderText="Total Penalty" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="Payment" HeaderText="Payment" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="TotalPayments" HeaderText="Total Payments" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="Total" HeaderText="Balance" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
    </Columns>
</asp:GridView>
</ContentTemplate>
</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="tpPayoff" runat="server" HeaderText="Payoff Calculator">
<ContentTemplate>
    <table>
        <tr>
            <td>
                <label><b>Payoff Date:</b></label>
            </td>
            <td>
                <userControls:calendarBox ID="ucPayoffDate" runat="server"
                    ValidationGroup="Payoff"
                    Required="true" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnCalculate" runat="server" Text="Calculate Payoff" ValidationGroup="Payoff" OnClick="btnCalculate_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <label><b>Balance:</b></label>
            </td>
            <td align="right">
                <asp:Label ID="lblBalance" runat="server" Text="0"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <label><b>Daily Interest:</b></label>
            </td>
            <td align="right">
                <asp:Label ID="lblInterest" runat="server" Text="0"></asp:Label>
            </td>
        </tr>
    </table>
</ContentTemplate>
</ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

