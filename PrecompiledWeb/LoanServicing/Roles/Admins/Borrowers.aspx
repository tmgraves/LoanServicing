<%@ page title="" language="C#" masterpagefile="~/Roles/Admins/administrator.master" autoeventwireup="true" inherits="Roles_Borrowers, App_Web_wlj5i3du" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h1>Borrowers</h1>
<p>
<asp:LinkButton ID="lbAddBorrower" runat="server" Text="Create a Borrower"></asp:LinkButton>
</p>
<ajaxtoolkit:modalpopupextender ID="mpeBorrower" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="btnCancelBorrower" 
    PopupControlID="pnlBorrower"
    TargetControlID="lbAddBorrower" />
<asp:Panel ID="pnlBorrower" runat="server" DefaultButton="btnSaveBorrower" 
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <h2>
        Setup a New Borrower
    </h2>
    <p>
        Use the form below to create a New Borrower.
    </p>
    <asp:ValidationSummary ID="vsBorrower" runat="server" CssClass="failureNotification" 
            ValidationGroup="Borrower"/>
    <div>
        <fieldset class="Borrower">
            <legend>Borrower Information</legend>
            <table width="100%">
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
                            ValidationGroup="Borrower">*</asp:RequiredFieldValidator>
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
                            ValidationGroup="Borrower">*</asp:RequiredFieldValidator>
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
                            ValidationGroup="Borrower">*</asp:RequiredFieldValidator>
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
                            ValidationGroup="Borrower">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblState" runat="server" AssociatedControlID="ucState">State:</asp:Label>
                    </td>
                    <td>
                        <userControls:StateComboBox ID="ucState" runat="server"
                            ValidationGroup="Borrower"
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
                            ValidationGroup="Borrower">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="ucEmail">Email:</asp:Label>
                    </td>
                    <td>
                        <userControls:Email ID="ucEmail" runat="server" ValidationGroup="Borrower" Required="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="ucPhone">Phone Number:</asp:Label>
                    </td>
                    <td>
                        <userControls:Phone ID="ucPhone" runat="server" ValidationGroup="Borrower" Required="false" />
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
            </table>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="btnSaveBorrower" runat="server" Text="Save Borrower" 
                    ValidationGroup="Borrower"
                    onclick="btnSaveBorrower_Click" />
            <asp:Button ID="btnCancelBorrower" runat="server" Text="Cancel" />
        </p>
    </div>
</asp:Panel>
<table width="100%">
    <tr valign="top">
        <td width="50%">
            <asp:ObjectDataSource ID="odsBorrowers" runat="server"
                SelectMethod="Search"
                DeleteMethod="Delete"
                TypeName="BorrowersBLL">
            </asp:ObjectDataSource>
            <asp:GridView ID="gvBorrowers" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="BorrowerID"
                DataSourceID="odsBorrowers"
                Width="100%"
                CssClass="DataWebControlStyle"
                onselectedindexchanged="gvBorrowers_SelectedIndexChanged">
                <HeaderStyle CssClass="HeaderStyle" />
                <AlternatingRowStyle CssClass="AlternatingRowStyle" />
                <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
                <Columns>
                    <asp:BoundField DataField="Borrower" HeaderText="Borrower" HeaderStyle-HorizontalAlign="Left" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbLoans" runat="server"
                                Text="Loans">
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
                                        EmptyDataText="No Loans for this Borrower"
                                        DataKeyNames="LoanID"
                                        Font-Size="11px"
                                        DataSource='<%# LoansBLL.SearchByBorrower(Convert.ToInt32(Eval("BorrowerID"))) %>'>
                                        <AlternatingRowStyle BackColor="#eeeeee" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Loan" />
                                            <asp:BoundField DataField="Principal" HeaderText="Loan Amount" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="Balance" HeaderText="Current Balance" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Right" />
                                            <asp:BoundField DataField="StartDate" HeaderText="Loan Date" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Right" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server"
                            Text="Delete"
                            CommandName="Delete"
                            Enabled='<%# Convert.ToInt32(Eval("Loans")) == 0 ? true : false %>'
                            ToolTip='<%# Convert.ToInt32(Eval("Loans")) == 0 ? "" : "This Borrower is assigned to " + Eval("Loans") + " Loan(s). You cannot delete this Borrower." %>'
                            OnClientClick="javascript:return confirm('Are you sure you want to delete this Borrower?')" />
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
        <td width="50%">
            <asp:ObjectDataSource ID="odsBorrower" runat="server"
                SelectMethod="Get"
                UpdateMethod="Update"
                TypeName="BorrowersBLL">
                <SelectParameters>
                    <asp:ControlParameter Name="BorrowerID" Type="Int32" ControlID="gvBorrowers" DefaultValue="-1" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="dvBorrower" runat="server"
                DefaultMode="Edit"
                AutoGenerateRows="False"
                DataSourceID="odsBorrower"
                DataKeyNames="BorrowerID, IndividualID"
                Visible="false"
                onitemupdated="dvBorrower_ItemUpdated" 
                onitemcommand="dvBorrower_ItemCommand" >
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
                                ValidationGroup="Borrower"
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
</asp:Content>

