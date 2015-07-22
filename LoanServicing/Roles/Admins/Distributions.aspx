<%@ Page Title="" Language="C#" MasterPageFile="~/Roles/Admins/administrator.master" AutoEventWireup="true" CodeFile="Distributions.aspx.cs" Inherits="Roles_Admins_Distributions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>Distributions</h2>
<asp:UpdatePanel ID="upDistributions" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<asp:ObjectDataSource ID="odsMethods" runat="server"
    SelectMethod="GetPaymentMethods"
    TypeName="SystemBLL">
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsDistributions" runat="server"
    SelectMethod="SearchDistributions"
    UpdateMethod="UpdateDistribution"
    TypeName="PaymentsBLL">
    <SelectParameters>
        <asp:Parameter Name="PaymentID" Type="Int32" />
        <asp:Parameter Name="InvestorID" Type="Int32" />
        <asp:ControlParameter Name="Paid" ControlID="ddlPaid" PropertyName="SelectedValue" Type="Boolean" />
        <asp:Parameter Name="PaymentMethodID" Type="Int32" />
        <asp:Parameter Name="PaymentNumber" Type="String" />
        <asp:Parameter Name="ServicingFee" Type="Boolean" />
        <asp:ControlParameter Name="LoanID" ControlID="ddlLoans" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter Name="IndividualID" ControlID="ddlIndividuals" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter Name="DistributionDate" ControlID="ucSearchDistributionDate" PropertyName="Date" Type="DateTime" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="DistributionID" Type="Int32" />
        <asp:Parameter Name="DistributionDate" Type="DateTime" />
        <asp:Parameter Name="PaymentMethodID" Type="Int32" />
        <asp:Parameter Name="PaymentNumber" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
<table>
    <tr>
        <td>
            Loan:
        </td>
        <td>
            <asp:ObjectDataSource ID="odsLoans" runat="server"
                SelectMethod="Search"
                TypeName="LoansBLL">
            </asp:ObjectDataSource>
            <asp:DropDownList ID="ddlLoans" runat="server"
                DataSourceID="odsLoans"
                DataTextField="Name"
                DataValueField="LoanID"
                AutoPostBack="true"
                AppendDataBoundItems="true">
                <asp:ListItem Text="-- Select a Loan --" Value="" Selected="True"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            Paid:
        </td>
        <td>
            <asp:DropDownList ID="ddlPaid" runat="server"
                AutoPostBack="true" onselectedindexchanged="ddlPaid_SelectedIndexChanged">
                <asp:ListItem Text="All" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Paid" Value="true"></asp:ListItem>
                <asp:ListItem Text="Not Paid" Value="false"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            Payee:
        </td>
        <td>
            <asp:ObjectDataSource ID="odsIndividuals" runat="server"
                SelectMethod="SearchByRoles"
                TypeName="IndividualsBLL">
                <SelectParameters>
                    <asp:Parameter Name="Roles" Type="String" DefaultValue="Investor<>Servicer" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DropDownList ID="ddlIndividuals" runat="server"
                DataSourceID="odsIndividuals"
                DataTextField="Individual"
                DataValueField="IndividualID"
                AutoPostBack="true"
                AppendDataBoundItems="true">
                <asp:ListItem Text="-- Select a Payee --" Value="" Selected="True"></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            Distribution Date:
        </td>
        <td>
            <userControls:calendarBox ID="ucSearchDistributionDate" runat="server" />
        </td>
        <td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" />
        </td>
    </tr>
</table>
<p>
<asp:Button ID="btnMock" runat="server" Text="" Style="visibility:hidden;"  />
<asp:Button ID="btnAddDistributionPayment" runat="server" 
        Text="Create Distribution Payment" onclick="btnAddDistributionPayment_Click">
</asp:Button>
<ajaxtoolkit:modalpopupextender ID="mpeDistributionPayment" runat="server" 
    BackgroundCssClass="modalBackground"
    CancelControlID="btnCancelDistributionPayment" 
    PopupControlID="pnlDistributionPayment"
    TargetControlID="btnMock" />
<asp:Panel ID="pnlDistributionPayment" runat="server" DefaultButton="btnSaveDistributionPayment" 
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <asp:ValidationSummary ID="vsDistributionPayment" runat="server" CssClass="failureNotification" 
            ValidationGroup="DistributionPayment"/>
    <div>
        <fieldset class="DistributionPayment">
            <legend>Distribution Payment</legend>
            <table width="100%">
                <%--<tr>
                    <td>
                        Payee:
                    </td>
                    <td>
                        <asp:Label ID="lblPayee" runat="server"></asp:Label>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        Amount:
                    </td>
                    <td>
                        <asp:Label ID="lblAmount" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        # of Distributions:
                    </td>
                    <td>
                        <asp:Label ID="lblDistributions" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Distribution Date:
                    </td>
                    <td>
                        <userControls:calendarBox ID="cbDistributionDate" runat="server"
                            ValidationGroup="DistributionPayment"
                            Required="true" />
                    </td>
                </tr>
                <%--<tr>
                    <td>
                        Payment Method:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlMethod" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="odsMethods"
                            DataTextField="Method" 
                            DataValueField="PaymentMethodID">
                            <asp:ListItem Selected="True" Text="-- Select Method --" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvMethod" runat="server"
                            ControlToValidate="ddlMethod"
                            ValidationGroup="DistributionPayment"
                            Display="dynamic"
                            ErrorMessage="*Required">*
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>--%>
                <%--<tr>
                    <td>
                        Payment #:
                    </td>
                    <td>
                        <asp:TextBox ID="tbNumber" runat="server" CssClass="textEntry" Width="50px"></asp:TextBox>
                    </td>
                </tr>--%>
            </table>
        </fieldset>
        <p class="submitButton">
            <asp:Button ID="btnSaveDistributionPayment" runat="server" Text="Save Distribution Payment" 
                    ValidationGroup="DistributionPayment"
                    onclick="btnSaveDistributionPayment_Click" />
            <asp:Button ID="btnCancelDistributionPayment" runat="server" Text="Cancel" />
        </p>
    </div>
</asp:Panel>

    <p>
    </p>
    <p>
    </p>
    <p class="submitButton">
        <asp:Button ID="btnFinishDistributions" runat="server" 
            Visible="false"
            onclick="btnFinishDistributions_Click" Text="Finished Updating" />
    </p>
    <asp:GridView ID="gvDistributions" runat="server"
        AllowPaging="True" 
        AutoGenerateColumns="False"
        CellPadding="2"
        CssClass="DataWebControlStyle" 
        DataKeyNames="DistributionID"
        DataSourceID="odsDistributions" 
        OnRowDataBound="gvDistributions_RowDataBound"
        OnRowCommand="gvDistributions_RowCommand"
        PageSize="300"
        ShowFooter="true" 
        Width="100%">
        <HeaderStyle CssClass="HeaderStyle" />
        <AlternatingRowStyle CssClass="AlternatingRowStyle" />
        <SelectedRowStyle BackColor="#EEEEEE" CssClass="SelectedRowStyle" />
        <PagerStyle CssClass="pager" Font-Size="14px" HorizontalAlign="Right" />
        <PagerSettings Position="TopAndBottom" />
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="checkAll" runat="server" onclick="checkAll(this);" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="cbCheck" runat="server"
                        onclick="Check_Click(this)"
                        Enabled='<%# Eval("DistributionDate").ToString() == "" %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loan">
                <ItemTemplate>
                    <asp:LinkButton ID="lbLoan" runat="server"
                        Text='<%# Eval("Name") %>'
                        PostBackUrl='<%# Eval("LoanID", "~/Roles/Admins/Loan.aspx?lid={0}") %>'>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PaymentDate" DataFormatString="{0:d}" HeaderText="Payment Date" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="PaymentNumber" DataFormatString="{0:d}" HeaderText="Payment Number" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="PaymentAmount" DataFormatString="{0:c}" 
                HeaderText="Payment Amount" ItemStyle-HorizontalAlign="Right" />
            <asp:TemplateField HeaderText="Payee">
                <ItemStyle Width="125px" />
                <ItemTemplate>
                    <%# bool.Parse(Eval("ServicingFee").ToString()) ? Eval("Servicer") : Eval("Investor")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Type">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="lblType" runat="server" 
                        ToolTip='<%# bool.Parse(Eval("ServicingFee").ToString()) ? "Servicing Fee" : "Regular Payment" %>'>
                    <%# bool.Parse(Eval("ServicingFee").ToString()) ? "S" : "R" %>
                </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount">
                <ItemStyle HorizontalAlign="Right" Width="100px" />
                <ItemTemplate>
                    <asp:LinkButton ID="lbAmount" runat="server" 
                        Text='<%# bool.Parse(Eval("ServicingFee").ToString()) ? Eval("ServicingAmount", "{0:c}") : Eval("NetAmount", "{0:c}") %>'>
                </asp:LinkButton>
                    <ajaxToolkit:HoverMenuExtender ID="hveAmount" runat="Server" 
                        HoverCssClass="popupHover" OffsetX="50" PopDelay="25" 
                        PopupControlID="pnlAmount" PopupPosition="Right" TargetControlID="lbAmount" />
                    <asp:Panel ID="pnlAmount" runat="server" CssClass="popupMenu">
                        <asp:MultiView ID="mvAmount" runat="server" 
                            ActiveViewIndex='<%# bool.Parse(Eval("ServicingFee").ToString()) ? 0 : 1 %>'>
                            <asp:View ID="vServicing" runat="server">
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
                                            <asp:Label ID="Label1" runat="server" 
                                                Text='<%# Eval("ServicingAmount", "{0:c}")%>'>
                                    </asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="vRegular" runat="server">
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
                                                    Text='<%# String.Format("{0:c}", Convert.ToDecimal(Eval("LoanPercentage")) * (Convert.ToDecimal(Eval("InterestPaid")) + Convert.ToDecimal(Eval("PenaltyPaid"))))  %>'>
                                    </asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="searchLabel" style="font-weight: bold;">
                                                Servicing Amount:</label>
                                            </td>
                                            <td align="right">
                                                <asp:Label ID="lblServicingAmount" runat="server" ForeColor="Red" 
                                                    Text='<%# Eval("ServicingAmount", "-{0:c}")%>'>
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
                            </asp:View>
                        </asp:MultiView>
                    </asp:Panel>
                </ItemTemplate>
                <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
                <FooterTemplate>
                    <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DistributionDate" DataFormatString="{0:d}" HeaderText="Distribution Date" ItemStyle-HorizontalAlign="Right" />
            <asp:BoundField DataField="Method" HeaderText="Payment Method" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnReset" runat="server"
                        Text="Reset Distribution"
                        ToolTip="Click Here to reset the Payout information for this distribution"
                        CommandName="Reset" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <p class="submitButton">
        <asp:Button ID="btnFinishDistributions2" runat="server" 
            Visible="false"
            onclick="btnFinishDistributions_Click" Text="Finished Updating" />
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

    <p>
    </p>

</p>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

