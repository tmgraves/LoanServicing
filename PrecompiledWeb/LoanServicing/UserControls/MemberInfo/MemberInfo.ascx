<%@ control language="C#" autoeventwireup="true" inherits="Roles_CommonControls_MemberInfo, App_Web_yjixoubz" %>
<asp:Label ID="lbStatus" runat="server" Text="Your Information has been Updated!" Font-Size="12px" ForeColor="Red" Visible="false"></asp:Label>
<asp:ObjectDataSource ID="odsIndividual" runat="server"
    TypeName="IndividualsBLL"
    SelectMethod="Get" 
    UpdateMethod="Update">
    <SelectParameters>
        <asp:ProfileParameter PropertyName="IndividualID" Name="IndividualID" Type="Int32" DefaultValue="-1" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="IndividualID" Type="Int32" />
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="PhoneNumber" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="State" Type="String" />
        <asp:Parameter Name="Zip" Type="String" />
        <asp:Parameter Name="SSN" Type="String" />
        <asp:Parameter Name="BankName" Type="String" />
        <asp:Parameter Name="AccountNumber" Type="String" />
        <asp:Parameter Name="RoutingNumber" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
<ajaxToolkit:TabContainer ID="tcInfo" runat="server" ActiveTabIndex="0">
<ajaxToolkit:TabPanel ID="tpBasic" runat="server" HeaderText="Basic Info">
<ContentTemplate>
<asp:DetailsView ID="dvIndividual" runat="server"
    AutoGenerateRows="False" 
    CellPadding="2"
    CssClass="DataWebControlStyle"
    DataKeyNames="IndividualID" 
    DataSourceID="odsIndividual"
    Font-Size="11px"
    Width="600px" onitemupdated="dvIndividual_ItemUpdated">
    <RowStyle CssClass="GridViewRow" />
    <FieldHeaderStyle BackColor="#EEEEEE" Font-Bold="True" Width="150px" />
    <Fields>
        <asp:CommandField ShowEditButton="True" UpdateText="Save Information" EditText="Edit Information" ItemStyle-CssClass="GridViewRow" ItemStyle-HorizontalAlign="Right" />
        <asp:BoundField DataField="FirstName" HeaderText="First Name" ItemStyle-CssClass="GridViewRow" />
        <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-CssClass="GridViewRow" />
        <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-CssClass="GridViewRow" />
        <asp:BoundField DataField="City" HeaderText="City" ItemStyle-CssClass="GridViewRow" />
        <asp:TemplateField HeaderText="State" ItemStyle-CssClass="GridViewRow" >
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
        <asp:BoundField DataField="Zip" HeaderText="Zip" ItemStyle-CssClass="GridViewRow" />
        <asp:TemplateField HeaderText="Phone Number" ItemStyle-CssClass="GridViewRow">
            <ItemTemplate>
                <%# Utilities.FormatPhone(Eval("PhoneNumber"))%>
            </ItemTemplate>
            <EditItemTemplate>
                <userControls:Phone ID="ucPhone" runat="server"
                    Phone='<%# Bind("PhoneNumber") %>'
                    ValidationGroup="EditMember" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email" ItemStyle-CssClass="GridViewRow">
            <ItemTemplate>
                <%# Eval("Email") %>
            </ItemTemplate>
            <EditItemTemplate>
                <userControls:Email ID="ucEmail" runat="server"
                    Email='<%# Bind("Email") %>'
                    ValidationGroup="EditMember"
                    Required="true" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" UpdateText="Save Information" EditText="Edit Information" ItemStyle-CssClass="GridViewRow" ItemStyle-HorizontalAlign="Right" />
    </Fields>
</asp:DetailsView>
</ContentTemplate>
</ajaxToolkit:TabPanel>
<ajaxToolkit:TabPanel ID="tpPassword" runat="server" HeaderText="Change Password">
<ContentTemplate>
<asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server"
    CssClass="failureNotification" 
    ValidationGroup="ChangeUserPasswordValidationGroup"
    Font-Size="12px"/>
<asp:ChangePassword ID="ChangeUserPassword" runat="server" 
CancelDestinationPageUrl="~/" EnableViewState="false" RenderOuterTable="false" >
    <ChangePasswordTemplate>
        <span class="failureNotification">
            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
        </span>
        <p>
            Use the form below to change your password.
        </p>
        <p>
            New passwords are required to be:<br/>
                    <ul>
                    <li>a minimum of <b><asp:Label ID="lblPasswordLength" runat="server" Text="0"></asp:Label></b> characters in length</li>
                    <li>and have at least <b><asp:Label ID="lblSymbols" runat="server" Text="0"></asp:Label></b> non-alphanumeric character such as !, $, &, or #</li>
                    </ul>
        </p>
        <div class="accountInfo">
            <fieldset class="changePassword">
                <legend>Account Information</legend>
                <p>
                    <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                    <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                            CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required." 
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvCheckCurrentPassword" runat="server"
                        ControlToValidate="CurrentPassword"
                        CssClass="failureNotification"
                        ErrorMessage="Your entry for Old Password is incorrect."
                        OnServerValidate="cvCheckCurrentPassword_ServerValidate"
                        ValidationGroup="ChangeUserPasswordValidationGroup">*
                    </asp:CustomValidator>
                </p>
                <p>
                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                    <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                            CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." 
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvChangePassword" runat="server"
                        ControlToCompare="CurrentPassword"
                        ControlToValidate="NewPassword" 
                        CssClass="failureNotification"
                        Display="Dynamic"
                        Operator="NotEqual"
                        ErrorMessage="New Password must be different from Old Password."
                        ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                </p>
                <p>
                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                            CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                            ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                            CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                            ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                </p>
            </fieldset>
            <p class="submitButton">
                <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" 
                        ValidationGroup="ChangeUserPasswordValidationGroup"/>
            </p>
        </div>
    </ChangePasswordTemplate>
    <SuccessTemplate>
        Your password was changed!
    </SuccessTemplate>
</asp:ChangePassword>
</ContentTemplate>
</ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>