<%@ control language="C#" autoeventwireup="true" inherits="UserControls_UpdatePayment, App_Web_yhazxaa4" %>
<asp:ObjectDataSource ID="odsMethods" runat="server"
    SelectMethod="GetPaymentMethods"
    TypeName="SystemBLL">
</asp:ObjectDataSource>
<asp:HiddenField ID="hfLoanID" runat="server" />
<div style="visibility: hidden;">
<asp:LinkButton ID="lbPaymentDummy" runat="server" >Dummy</asp:LinkButton>
</div>
<ajaxtoolkit:modalpopupextender ID="mpePayment" runat="server" 
    BackgroundCssClass="modalBackground"
    PopupControlID="pnlPayment"
    TargetControlID="lbPaymentDummy" DynamicServicePath="" Enabled="True" />
<asp:Panel ID="pnlPayment" runat="server"
    Height="600px" 
    Style="display: none; background: #FFFFFF; color: #000000; border: solid 1px gray; padding-top: 10px; padding-left: 10px;" 
    Width="600px">
    <p>
        Use the form below to create a Payment.
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="failureNotification" 
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
                    <asp:Parameter Name="LoanID" Type="Int32" DefaultValue="-1" />
                    <asp:Parameter Name="PaymentID" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="PaymentID" Type="Int32" />
                    <asp:ControlParameter Name="LoanID" Type="Int32" DefaultValue="-1" ControlID="hfLoanID" PropertyName="Value" />
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
                oniteminserted="dvPayment_ItemInserted" 
                onitemupdated="dvPayment_ItemUpdated" ondatabound="dvPayment_DataBound" >
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
                    <asp:BoundField DataField="PaymentNumber" HeaderText="Payment Number:" />
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
