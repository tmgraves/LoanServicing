<%@ control language="C#" autoeventwireup="true" inherits="Controls_Phone, App_Web_1skrkizd" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:TextBox ID="tbPhone" MaxLength="14" runat="server">
</asp:TextBox>
<ajaxToolkit:MaskedEditExtender ID="meePhone" runat="server"
    TargetControlID="tbPhone"
    Mask="(999) 999-9999"
    ClearMaskOnLostFocus="true" />
<asp:RequiredFieldValidator ID="rfvPhone" runat="server"
    CssClass="failureNotification"
    ControlToValidate="tbPhone"
    ValidationGroup="Address"
    Enabled="false"
    ToolTip="Please enter a Phone Number"
    ErrorMessage="Phone Number is Required">*
</asp:RequiredFieldValidator>
<ajaxToolkit:TextBoxWatermarkExtender ID="tbwePhone" runat="server"
    TargetControlID="tbPhone"
    WatermarkText="(818)555-1212"
    WatermarkCssClass="watermarked textEntry">
</ajaxToolkit:TextBoxWatermarkExtender>
