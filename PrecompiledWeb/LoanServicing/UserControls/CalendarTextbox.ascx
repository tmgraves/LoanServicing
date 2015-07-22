<%@ control language="C#" autoeventwireup="true" inherits="Controls_CalendarTextbox, App_Web_1skrkizd" %>
<asp:TextBox ID="tbDate" runat="server" CssClass="dateEntry" Width="100px" ></asp:TextBox>
<asp:ImageButton ID="ibCalendar" runat="server"
    ImageUrl="~/images/calendar_icon.png"
    CausesValidation="false" />
<ajaxToolkit:CalendarExtender ID="ceDate" runat="server"
    Format="MM/dd/yyyy"
    TargetControlID="tbDate"
    PopupButtonID="ibCalendar">
</ajaxToolkit:CalendarExtender>
<asp:RequiredFieldValidator ID="rfvDate" runat="server"
    ControlToValidate="tbDate"
    Display="dynamic"
    Enabled="false"
    ErrorMessage="*Required">*
</asp:RequiredFieldValidator>
<asp:CompareValidator ID="cvDate" runat="server"
    ErrorMessage="Please enter your Date in the format MM/DD/YY"
    ControlToValidate="tbDate"
    Display="None"
    Operator="DataTypeCheck"
    Type="Date"></asp:CompareValidator>
<asp:RangeValidator ID="rvDate" runat="server"
    ErrorMessage="Please pick a date within the range"
    ControlToValidate="tbDate"
    Type="Date"
    MinimumValue="1/1/1900"
    MaximumValue="1/1/2100"
    Display="Dynamic"
    Enabled="false">*
</asp:RangeValidator>
<ajaxToolkit:TextBoxWatermarkExtender ID="tbweDate" runat="server"
    TargetControlID="tbDate"
    WatermarkText="10/13/1970"
    WatermarkCssClass="watermarked">
</ajaxToolkit:TextBoxWatermarkExtender>
<ajaxToolkit:ValidatorCalloutExtender ID="cvDateE" runat="server"
    TargetControlID="cvDate"
    HighlightCssClass="validatorCalloutHighlight">
</ajaxToolkit:ValidatorCalloutExtender>