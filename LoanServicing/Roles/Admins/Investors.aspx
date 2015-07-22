<%@ Page Title="" Language="C#" MasterPageFile="~/Roles/Admins/administrator.master" AutoEventWireup="true" CodeFile="Investors.aspx.cs" Inherits="Roles_Admins_Investors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:UpdatePanel ID="upServicer" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<h1>Investors</h1>
<p>
<asp:LinkButton ID="lbAddInvestor" runat="server" Text="Create a Investor"></asp:LinkButton>
</p>
<ajaxtoolkit:modalpopupextender ID="mpeInvestor" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="btnCancelInvestor" 
    PopupControlID="pnlInvestor"
    TargetControlID="lbAddInvestor" />
<asp:Panel ID="pnlInvestor" runat="server" DefaultButton="btnSaveInvestor" 
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <h2>
        Setup a New Investor
    </h2>
    <p>
        Use the form below to create a New Investor.
    </p>
    <asp:ValidationSummary ID="vsInvestor" runat="server" CssClass="failureNotification" 
            ValidationGroup="Investor"/>
    <div>
        <fieldset class="Investor">
            <legend>Investor Information</legend>
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="rblInvestor">Is this a New Individual:</asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblInvestor" runat="server" 
                            RepeatDirection="Horizontal"
                            CssClass="radioWithProperWrap"
                            AutoPostBack="true" 
                            onselectedindexchanged="rblInvestor_SelectedIndexChanged">
                            <asp:ListItem Text="New" Value="true" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Existing" Value="false"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <asp:MultiView ID="mvInvestor" runat="server" ActiveViewIndex="0">
                <asp:View ID="vNew" runat="server">
                <tr>
                    <td>
                        <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="tbFirstName">First Name:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbFirstName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                            ControlToValidate="tbFirstName"
                            CssClass="failureNotification" 
                            ErrorMessage="Please enter First Name"
                            ToolTip="Please enter a First Name" 
                            ValidationGroup="Investor">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblLastName" runat="server" AssociatedControlID="tbLastName">Last Name:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbLastName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                            ControlToValidate="tbLastName" CssClass="failureNotification" 
                            ErrorMessage="Please enter Last Name" ToolTip="Please enter a Last Name" 
                            ValidationGroup="Investor">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAddress" runat="server" AssociatedControlID="tbAddress">Address:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbAddress" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                            ControlToValidate="tbAddress" CssClass="failureNotification" 
                            ErrorMessage="Please enter Address" ToolTip="Please enter a Address" 
                            ValidationGroup="Investor">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCity" runat="server" AssociatedControlID="tbCity">City:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbCity" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                            ControlToValidate="tbCity" CssClass="failureNotification" 
                            ErrorMessage="Please enter City" ToolTip="Please enter a City" 
                            ValidationGroup="Investor">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblState" runat="server" AssociatedControlID="ucState">State:</asp:Label>
                    </td>
                    <td>
                        <userControls:StateComboBox ID="ucState" runat="server"
                            ValidationGroup="Investor"
                            Required="true" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbZipCode" runat="server" AssociatedControlID="tbZipCode">Zip Code:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbZipCode" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server" 
                            ControlToValidate="tbZipCode" CssClass="failureNotification" 
                            ErrorMessage="Please enter Zip Code" ToolTip="Please enter a Zip Code" 
                            ValidationGroup="Investor">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="ucEmail">Email:</asp:Label>
                    </td>
                    <td>
                        <userControls:Email ID="ucEmail" runat="server" ValidationGroup="Investor" Required="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="ucPhone">Phone Number:</asp:Label>
                    </td>
                    <td>
                        <userControls:Phone ID="ucPhone" runat="server" ValidationGroup="Investor" Required="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" AssociatedControlID="tbSSN">SSN:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbSSN" runat="server" CssClass="textEntry"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" AssociatedControlID="tbBankName">Bank Name:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbBankName" runat="server" CssClass="textEntry"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" AssociatedControlID="tbAccountNumber">Account Number:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbAccountNumber" runat="server" CssClass="textEntry"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" AssociatedControlID="tbRoutingNumber">Routing Number:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbRoutingNumber" runat="server" CssClass="textEntry"></asp:TextBox>
                    </td>
                </tr>
                </asp:View>
                <asp:View ID="vExisting" runat="server">
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" AssociatedControlID="ddlIndividual">Individual:</asp:Label>
                    </td>
                    <td>
                        <asp:ObjectDataSource ID="odsIndividuals" runat="server"
                            TypeName="IndividualsBLL"
                            SelectMethod="Search">
                        </asp:ObjectDataSource>
                        <asp:DropDownList ID="ddlIndividual" runat="server"
                            DataSourceID="odsIndividuals"
                            DataTextField="Individual"
                            DataValueField="IndividualID"
                            AppendDataBoundItems="true">
                            <asp:ListItem Text="-- Please Select an Individual --" Value="" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvIndividual" runat="server" 
                            ControlToValidate="ddlIndividual" CssClass="failureNotification" 
                            ErrorMessage="Please select a Individual" ToolTip="Please select a Individual" 
                            ValidationGroup="Investor"
                            Enabled="false">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                </asp:View>
                </asp:MultiView>
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
<table width="100%">
    <tr valign="top">
        <td width="50%">
            <asp:ObjectDataSource ID="odsInvestors" runat="server"
                SelectMethod="Search"
                UpdateMethod="Update"
                TypeName="InvestorsBLL">
            </asp:ObjectDataSource>
            <asp:GridView ID="gvInvestors" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="InvestorID"
                DataSourceID="odsInvestors"
                Width="100%"
                CssClass="DataWebControlStyle" 
                onselectedindexchanged="gvInvestors_SelectedIndexChanged">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:TemplateField HeaderText="Investor">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbInvestor" runat="server"
                                Text='<%# Eval("Investor") %>'>
                            </asp:LinkButton>
                            <ajaxToolkit:HoverMenuExtender ID="hveInvestor" runat="Server" 
                                HoverCssClass="popupHover"
                                OffsetX="50"
                                PopDelay="25" 
                                PopupControlID="pnlInvestor"
                                PopupPosition="Right" 
                                TargetControlID="lbInvestor" />
                            <asp:Panel ID="pnlInvestor" runat="server" CssClass="popupMenu">
                                <div style="border:1px outset white;padding:2px;">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                First Name:</label>
                                            </td>
                                            <td>
                                                <%# Eval("FirstName")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Last Name:</label>
                                            </td>
                                            <td>
                                                <%# Eval("LastName")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Email:</label>
                                            </td>
                                            <td>
                                                <%# Eval("Email")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Phone Number:</label>
                                            </td>
                                            <td>
                                                <%# Utilities.FormatPhone(Eval("PhoneNumber")) %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Address:</label>
                                            </td>
                                            <td>
                                                <%# Eval("Address")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                City:</label>
                                            </td>
                                            <td>
                                                <%# Eval("City")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                State:</label>
                                            </td>
                                            <td>
                                                <%# Eval("State")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Zipcode:</label>
                                            </td>
                                            <td>
                                                <%# Eval("Zip")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                SSN:</label>
                                            </td>
                                            <td>
                                                <%# Utilities.FormatSSN(Eval("SSN")) %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Bank Name:</label>
                                            </td>
                                            <td>
                                                <%# Eval("BankName")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Account Number:</label>
                                            </td>
                                            <td>
                                                <%# Eval("AccountNumber")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Routing Number:</label>
                                            </td>
                                            <td>
                                                <%# Eval("RoutingNumber")%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loans">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbLoans" runat="server"
                                Text='<%# Eval("Loans", "Loans({0})") + Eval("TotalInvestment", " ({0:c})") %>'>
                            </asp:LinkButton>
                            <ajaxToolkit:HoverMenuExtender ID="hveLoans" runat="Server" 
                                HoverCssClass="popupHover"
                                OffsetX="50"
                                PopDelay="25" 
                                PopupControlID="pnlLoans"
                                PopupPosition="Right" 
                                TargetControlID="lbLoans" />
                            <asp:Panel ID="pnlLoans" runat="server" CssClass="popupMenu">
                                <div style="border:1px outset white;padding:2px;">
                                    <asp:GridView ID="gvLoans" runat="server"
                                        AutoGenerateColumns="False" 
                                        CellPadding="2"
                                        CellSpacing="2"
                                        DataKeyNames="LoanID"
                                        Font-Size="11px"
                                        DataSource='<%# LoansBLL.SearchByInvestor(Convert.ToInt32(Eval("InvestorID"))) %>'>
                                        <AlternatingRowStyle BackColor="#eeeeee" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Loan" />
                                            <asp:BoundField DataField="Borrower" HeaderText="Borrower" />
                                            <asp:BoundField DataField="Principal" HeaderText="Loan Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="Balance" HeaderText="Current Balance" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="StartDate" HeaderText="Loan Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="Investment" HeaderText="Investment Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="LoanPercentage" HeaderText="% of Loan" DataFormatString="{0:p}" ItemStyle-HorizontalAlign="Right" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                </Columns>
            </asp:GridView>
        </td>
        <td width="50%">
            <asp:ObjectDataSource ID="odsInvestor" runat="server"
                SelectMethod="Get"
                UpdateMethod="Update"
                TypeName="InvestorsBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="InvestorID" Type="Int32" ControlID="gvInvestors" DefaultValue="-1" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="dvInvestor" runat="server"
                DefaultMode="Edit"
                AutoGenerateRows="False"
                DataSourceID="odsInvestor"
                DataKeyNames="InvestorID, IndividualID"
                Visible="false"
                onitemupdated="dvInvestor_ItemUpdated" 
                onitemcommand="dvInvestor_ItemCommand" >
                <FieldHeaderStyle BackColor="#EEEEEE" Font-Bold="True" Width="200px" />
                <Fields>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" HeaderStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" HeaderStyle-HorizontalAlign="Left" />
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <%# Eval("Email") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:Email ID="ucEmail" runat="server"
                                Email='<%# Bind("Email") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone Number">
                        <ItemTemplate>
                            <%# Eval("PhoneNumber") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:Phone ID="ucPhone" runat="server"
                                Phone='<%# Bind("PhoneNumber") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <%# Eval("State") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <userControls:StateComboBox ID="ucState" runat="server"
                                State='<%# Bind("State") %>'
                                ValidationGroup="Investor"
                                Required="true" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Zip" HeaderText="Zipcode" />
                    <asp:BoundField DataField="SSN" HeaderText="SSN" />
                    <asp:BoundField DataField="BankName" HeaderText="Bank Name" />
                    <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" />
                    <asp:BoundField DataField="RoutingNumber" HeaderText="Routing Number" />
                    <asp:CommandField ShowEditButton="true" ItemStyle-HorizontalAlign="Right" />
                </Fields>
            </asp:DetailsView>
        </td>
    </tr>
</table>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

