<%@ Page Title="Register" Language="C#" MasterPageFile="~/publicmaster.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .long-states .ob_iCboICBC li
        {
            float: left;
            width: 105px;
        }
        
        .short-states .ob_iCboICBC li
        {
            float: left;
            width: 35px;
        }
        
        /* For IE6 */
        * HTML .long-states .ob_iCboICBC li
        {
            -width: 95px;
        }
        
        * HTML .short-states .ob_iCboICBC li
        {
            -width: 25px;
        }
        
        * HTML .ob_iCboICBC li i
        {
            -visibility: hidden;
        }
        td
        {
            vertical-align: top;
        }
    </style>
<script type="text/javascript" language="javascript">
    function rblSiteDisclaimerClick() {
        var list = document.getElementById("ctl00_ctl00_MainContent_MainContent_RegisterUser_CreateUserStepContainer_rblSiteDisclaimer");
        var inputs = list.getElementsByTagName("input");
        var selected;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].checked) {
                selected = inputs[i];
                break;
            }
        }
        var button = document.getElementById("ctl00_ctl00_MainContent_MainContent_RegisterUser_CreateUserStepContainer_CreateUserButton");
        if (selected.value == "true") {
            button.disabled = false;
            button.title = "";
        }
        else {
            button.disabled = true;
            button.title = "Please agree to the Site Disclaimer";
        }
    }
</script>
<asp:ObjectDataSource ID="odsStates" runat="server"
    TypeName="SystemBLL"
    SelectMethod="States">
</asp:ObjectDataSource>

    <asp:CreateUserWizard ID="RegisterUser" runat="server"
        LoginCreatedUser="false"
        EnableViewState="false"
        RequireEmail="false"
        ContinueDestinationPageUrl="~/Account/ConfirmRegistration.aspx"
        OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
            <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                <ContentTemplate>
                    <h2>
                        Create a New Account
                    </h2>
                    <p>
                        Use the form below to create a new account.
                    </p>
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">
                        <fieldset class="register">
                            <legend>Account Information</legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="FirstName">First Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="FirstName" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="FirstName" 
                                             CssClass="failureNotification" ErrorMessage="First Name is required." ToolTip="First Name is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="LastNameLabel" runat="server" AssociatedControlID="LastName">Last Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="LastName" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" ControlToValidate="LastName" 
                                             CssClass="failureNotification" ErrorMessage="Last Name is required." ToolTip="Last Name is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="GenderLabel" runat="server" AssociatedControlID="rblGender">Gender:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" CssClass="radioWithProperWrap">
                                            <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rblGender" 
                                             CssClass="failureNotification" ErrorMessage="Gender is required." ToolTip="Gender is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="AgencyLabel" runat="server" AssociatedControlID="ddlAgency">Agency:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:ObjectDataSource ID="odsAgencies" runat="server"
                                            SelectMethod="Search"
                                            TypeName="AgenciesBLL">
                                            <SelectParameters>
                                                <asp:SessionParameter SessionField="OrganizationID" Name="OrganizationID" Type="int32" DefaultValue="-1"/>
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                        <asp:DropDownList ID="ddlAgency" runat="server"
                                            DataSourceID="odsAgencies"
                                            DataTextField="Agency"
                                            DataValueField="AgencyID">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvAgency" runat="server" ControlToValidate="ddlAgency" 
                                             CssClass="failureNotification" ErrorMessage="Agency is required." ToolTip="Agency is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblProgram" runat="server" AssociatedControlID="tbProgram">Program Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbProgram" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvProgram" runat="server" ControlToValidate="tbProgram" 
                                             CssClass="failureNotification" ErrorMessage="Program is required."
                                             ToolTip="Please enter a Program."
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblProgramType" runat="server" AssociatedControlID="ddlProgramType">Program Type:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:ObjectDataSource ID="odsProgramTypes" runat="server"
                                            SelectMethod="GetProgramTypes"
                                            TypeName="SystemBLL">
                                        </asp:ObjectDataSource>
                                        <asp:DropDownList ID="ddlProgramType" runat="server"
                                            DataSourceID="odsProgramTypes"
                                            DataTextField="Type"
                                            DataValueField="ProgramTypeID"
                                            AutoPostBack="true"
                                            onselectedindexchanged="ddlProgramType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="tbProgramType" runat="server" CssClass="textEntry" Visible="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvProgramType" runat="server" ControlToValidate="tbProgramType" 
                                             CssClass="failureNotification" ErrorMessage="Please enter a Program Type."
                                             ToolTip="Please enter a Program Type."
                                             Enabled="false"
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPositionType" runat="server" AssociatedControlID="ddlPositionType">Position Type:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:ObjectDataSource ID="odsPositionTypes" runat="server"
                                            SelectMethod="GetPositionTypes"
                                            TypeName="SystemBLL">
                                        </asp:ObjectDataSource>
                                        <asp:DropDownList ID="ddlPositionType" runat="server"
                                            DataSourceID="odsPositionTypes"
                                            DataTextField="Type"
                                            DataValueField="PositionTypeID"
                                            AutoPostBack="true"
                                            onselectedindexchanged="ddlPositionType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="tbPositionType" runat="server" CssClass="textEntry" Visible="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPositionType" runat="server" ControlToValidate="tbPositionType" 
                                             CssClass="failureNotification" ErrorMessage="Please enter a Position Type."
                                             ToolTip="Please enter a Position Type."
                                             Enabled="false"
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTitle" runat="server" AssociatedControlID="tbTitle">Title:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbTitle" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbTitle" 
                                             CssClass="failureNotification" ErrorMessage="Title is required." ToolTip="Title is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDegree" runat="server" AssociatedControlID="ddlDegree">Degree:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlDegree" runat="server">
                                            <asp:ListItem Text="-- Select a Degree --" Value="" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="HS" Value="HS"></asp:ListItem>
                                            <asp:ListItem Text="AA/AS" Value="AA/AS"></asp:ListItem>
                                            <asp:ListItem Text="BA/BS" Value="BA/BS"></asp:ListItem>
                                            <asp:ListItem Text="MA/MS" Value="MA/MS"></asp:ListItem>
                                            <asp:ListItem Text="PhD" Value="PhD"></asp:ListItem>
                                            <asp:ListItem Text="PsyD" Value="PsyD"></asp:ListItem>
                                            <asp:ListItem Text="MD" Value="MD"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDegree" runat="server" ControlToValidate="ddlDegree" 
                                             CssClass="failureNotification" ErrorMessage="Degree is required." ToolTip="Please select a Degree." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMajor" runat="server" AssociatedControlID="tbMajor">Major:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbMajor" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvMajor" runat="server" ControlToValidate="tbMajor" 
                                             CssClass="failureNotification" ErrorMessage="Major is required." ToolTip="Please enter your degree major." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDegreeYear" runat="server" AssociatedControlID="tbDegreeYear">Degree Year:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbDegreeYear" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <ajaxToolkit:MaskedEditExtender ID="meeDegreeYear" runat="server"
                                            Mask="9999"
                                            MaskType="Number"
                                            TargetControlID="tbDegreeYear" />
                                        <asp:RequiredFieldValidator ID="rfvDegreeYear" runat="server" ControlToValidate="tbDegreeYear" 
                                             CssClass="failureNotification" ErrorMessage="Degree Year is required." ToolTip="Please fill in the year you received your degree." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPosition" runat="server" AssociatedControlID="tbPosition">Position:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbPosition" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPosition" runat="server" ControlToValidate="tbPosition" 
                                             CssClass="failureNotification" ErrorMessage="Position is required." ToolTip="Please fill in a Position." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLicenseType" runat="server" AssociatedControlID="tbLicenseType">Type of License:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbLicenseType" runat="server" CssClass="textEntry"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLicense" runat="server" AssociatedControlID="tbLicense">License #:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbLicense" runat="server" CssClass="textEntry"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSupervisor" runat="server" AssociatedControlID="tbSupervisor">If unlicensed, who is supervising you:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbSupervisor" runat="server" CssClass="textEntry"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblSupervisionResponsibilities" runat="server" AssociatedControlID="rblSupervisionResponsibilities">Supervision Responsibilities:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rblSupervisionResponsibilities" runat="server" RepeatDirection="Horizontal" CssClass="radioWithProperWrap">
                                            <asp:ListItem Text="No" Value="false" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="true"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWorkPosition" runat="server" AssociatedControlID="ddlWorkPosition">Work Position:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:ObjectDataSource ID="odsWorkPositions" runat="server"
                                            SelectMethod="GetWorkPositions"
                                            TypeName="SystemBLL">
                                        </asp:ObjectDataSource>
                                        <asp:DropDownList ID="ddlWorkPosition" runat="server"
                                            DataSourceID="odsWorkPositions"
                                            DataTextField="Position"
                                            DataValueField="WorkPositionID">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvWorkPosition" runat="server" ControlToValidate="ddlWorkPosition" 
                                             CssClass="failureNotification" ErrorMessage="Please pick a Work Position."
                                             ToolTip="Please pick a Work Position."
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCaseload" runat="server" AssociatedControlID="tbCaseload">Caseload:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbCaseload" runat="server" CssClass="textEntry" Width="50px"></asp:TextBox># of clients per week
                                        <asp:RequiredFieldValidator ID="rfvCaseload" runat="server" ControlToValidate="tbCaseload" 
                                             CssClass="failureNotification" ErrorMessage="Caseload is required."
                                             ToolTip="Please enter a Caseload."
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvCaseload" runat="server" ControlToValidate="tbCaseload" 
                                             CssClass="failureNotification" ErrorMessage="Please enter a valid caseload number"
                                             ToolTip="Please pick a valid number."
                                             Operator="GreaterThan"
                                             Type="Integer"
                                             ValueToCompare="0"
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblGroupExperience" runat="server" AssociatedControlID="rblGroupExperience">Group Experience:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rblGroupExperience" runat="server" RepeatDirection="Horizontal" CssClass="radioWithProperWrap">
                                            <asp:ListItem Text="No" Value="false" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="true"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblLanguages" runat="server" AssociatedControlID="lbxLanguages">Languages:<br />(hold control key to select multiple)</asp:Label>
                                    </td>
                                    <td>
                                        <asp:ObjectDataSource ID="odsLanguages" runat="server"
                                            SelectMethod="GetLanguages"
                                            TypeName="SystemBLL">
                                        </asp:ObjectDataSource>
                                        <asp:ListBox ID="lbxLanguages" runat="server"
                                            DataSourceID="odsLanguages"
                                            SelectionMode="Multiple"
                                            DataTextField="Language"
                                            DataValueField="LanguageID"
                                            Width="200px"
                                            Height="100px"></asp:ListBox>
                                        <asp:RequiredFieldValidator ID="rfvLanguages" runat="server" ControlToValidate="lbxLanguages" 
                                             CssClass="failureNotification" ErrorMessage="Language is required." ToolTip="Please select at least one Language." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbAddress" runat="server" AssociatedControlID="tbAddress">Address:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbAddress" runat="server" CssClass="textEntry"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbAddress2" runat="server" CssClass="textEntry"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbCity" runat="server" AssociatedControlID="tbCity">City:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbCity" runat="server" CssClass="textEntry"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbState" runat="server" AssociatedControlID="cbState">State:</asp:Label>
                                    </td>
                                    <td>
                                        <obout:ComboBox runat="server" ID="cbState"
                                            DataSourceID="odsStates"
                                            DataTextField="State"
                                            DataValueField="StateCode"
                                            Width="150" MenuWidth="550" EmptyText="Select a state ...">
                                            <CssSettings ItemsContainer="ob_iCboIC long-states" />
                                        </obout:ComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbZipCode" runat="server" AssociatedControlID="tbZipCode">Zip Code:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbZipCode" runat="server" CssClass="textEntry"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="tbPhoneNumber">Phone Number:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbPhoneNumber" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <ajaxToolkit:MaskedEditExtender ID="meePhoneNumber" runat="server"
                                            TargetControlID="tbPhoneNumber"
                                            Mask="(999) 999-9999"
                                            ClearMaskOnLostFocus="true" />
                                        <ajaxToolkit:MaskedEditValidator ID="mevPhoneNumber" runat="server"
                                            ControlExtender="meePhoneNumber"
                                            ControlToValidate="tbPhoneNumber"
                                            IsValidEmpty="false"
                                            ValidationGroup="RegisterUserValidationGroup"
                                            ErrorMessage="Enter a Phone Number"
                                            EmptyValueMessage="Phone Number is Required"
                                            EmptyValueBlurredText="*"
                                            InvalidValueMessage="Enter a Valid Phone Number"
                                            ToolTip="Enter a Valid Phone Number"
                                            CssClass="failureNotification">*</ajaxToolkit:MaskedEditValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="UserName">E-mail:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="UserName" 
                                            CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required." 
                                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator id="revEmail" runat="server"
                                            ControlToValidate="UserName"
                                            CssClass="failureNotification"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ErrorMessage="Enter a Valid Email"
                                            ToolTip="Please enter a Valid Email"
                                            ValidationGroup="RegisterUserValidationGroup">*</asp:RegularExpressionValidator>
                                      <asp:CustomValidator ID="cvEmail" runat="server"
                                            ControlToValidate="UserName"
                                            CssClass="failureNotification"
                                            ErrorMessage="That Email has already been used"
                                            OnServerValidate="cvEmail_ServerValidate"
                                            ValidationGroup="RegisterUserValidationGroup">*</asp:CustomValidator>
                                        <ajaxToolkit:TextBoxWatermarkExtender ID="tbweEmail" runat="server"
                                            TargetControlID="UserName"
                                            WatermarkText="joesmith@email.com"
                                            WatermarkCssClass="watermarked textEntry">
                                        </ajaxToolkit:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        (Passwords must be at least <b>(<%= Membership.MinRequiredPasswordLength %>)</b> characters long, contain at least <b>(1)</b> number and contain at least <b>(1)</b> non-alphanumeric character)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                             ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired" runat="server" 
                                             ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border: 1px solid #333333;">
                                        <p>
                                        <asp:Panel ID="pnlDisclaimer" runat="server" Width="600px" Height="150px" Style="overflow:auto;">
                                        <asp:Label ID="lblDisclaimer" runat="server"></asp:Label>
                                        </asp:Panel>
                                        </p>
                                        Do you agree to the use terms of the site?
                                        <asp:RadioButtonList ID="rblSiteDisclaimer" runat="server" RepeatDirection="Horizontal" CssClass="radioWithProperWrap" onclick="rblSiteDisclaimerClick(this);">
                                            <asp:ListItem Text="Yes" Value="true"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="false"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="rfvSiteDisclaimer" runat="server" ControlToValidate="rblSiteDisclaimer" 
                                             CssClass="failureNotification" ErrorMessage="Site Dislaimer response is required." ToolTip="Please indicate your response" 
                                             ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <%--<p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                     CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>--%>
                        </fieldset>
                        <p class="submitButton">
                            <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Create Account" 
                                ValidationGroup="RegisterUserValidationGroup"/>
                        </p>
                    </div>
                </ContentTemplate>
                <CustomNavigationTemplate>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>