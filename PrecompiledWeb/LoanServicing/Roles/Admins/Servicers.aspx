<%@ page title="" language="C#" masterpagefile="~/Roles/Admins/administrator.master" autoeventwireup="true" inherits="Roles_Admins_Servicers, App_Web_wlj5i3du" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:UpdatePanel ID="upServicer" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<h1>Servicers</h1>
<p>
<asp:LinkButton ID="lbAddServicer" runat="server" Text="Create a Servicer"></asp:LinkButton>
</p>
<ajaxtoolkit:modalpopupextender ID="mpeServicer" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="btnCancelServicer" 
    PopupControlID="pnlServicer"
    TargetControlID="lbAddServicer" />
<asp:Panel ID="pnlServicer" runat="server" DefaultButton="btnSaveServicer" 
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <h2>
        Setup a New Servicer
    </h2>
    <p>
        Use the form below to create a New Servicer.
    </p>
    <asp:ValidationSummary ID="vsServicer" runat="server" CssClass="failureNotification" 
            ValidationGroup="Servicer"/>
    <div>
        <fieldset class="servicer">
            <legend>Servicer Information</legend>
            <table width="100%">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="rblServicer">Is this a New Individual:</asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblServicer" runat="server" 
                            RepeatDirection="Horizontal"
                            CssClass="radioWithProperWrap"
                            AutoPostBack="true" 
                            onselectedindexchanged="rblServicer_SelectedIndexChanged">
                            <asp:ListItem Text="New" Value="true" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Existing" Value="false"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <asp:MultiView ID="mvServicer" runat="server" ActiveViewIndex="0">
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
                            ValidationGroup="Servicer">*</asp:RequiredFieldValidator>
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
                            ValidationGroup="Servicer">*</asp:RequiredFieldValidator>
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
                            ValidationGroup="Servicer">*</asp:RequiredFieldValidator>
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
                            ValidationGroup="Servicer">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblState" runat="server" AssociatedControlID="cbState">State:</asp:Label>
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
                            ErrorMessage="Please enter State" ToolTip="Please enter a State" 
                            ValidationGroup="Servicer">*</asp:RequiredFieldValidator>
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
                            ValidationGroup="Servicer">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="ucEmail">Email:</asp:Label>
                    </td>
                    <td>
                        <userControls:Email ID="ucEmail" runat="server" ValidationGroup="Servicer" Required="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="ucPhone">Phone Number:</asp:Label>
                    </td>
                    <td>
                        <userControls:Phone ID="ucPhone" runat="server" ValidationGroup="Servicer" Required="false" />
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
                            ValidationGroup="Servicer"
                            Enabled="false">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                </asp:View>
                </asp:MultiView>
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
    SelectMethod="Search"
    DeleteMethod="Delete"
    TypeName="ServicersBLL">
</asp:ObjectDataSource>
<asp:GridView ID="gvServicers" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="ServicerID"
    DataSourceID="odsServicers"
    Width="100%"
    CssClass="DataWebControlStyle">
    <HeaderStyle CssClass="HeaderStyle" />
    <AlternatingRowStyle CssClass="AlternatingRowStyle" />
    <SelectedRowStyle CssClass="SelectedRowStyle" BackColor="#EEEEEE" />
    <Columns>
        <asp:BoundField DataField="Servicer" HeaderText="Servicer" />
        <asp:CommandField ShowDeleteButton="true" />
    </Columns>
</asp:GridView>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

