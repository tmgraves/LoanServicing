<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TimeBox.ascx.cs" Inherits="Controls_TimeBox" %>
<asp:TextBox ID="tbTime" runat="server"
    Width="100px"></asp:TextBox>
<ajaxToolkit:MaskedEditExtender ID="meeTime" runat="server"
    AcceptAMPM="true" 
    AutoComplete="true"
    Mask="99:99"
    MaskType="Time"
    TargetControlID="tbTime" />
<asp:RequiredFieldValidator ID="rfvTime" runat="server" 
    ControlToValidate="tbTime"
    ErrorMessage="*Required"
    Enabled="false">*</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="rvTime" runat="server"
    ControlToValidate="tbTime"
    ErrorMessage="*Please enter a valid time"
    ValidationExpression="^(([0]?[1-9])|([1][0-2])):(([0-5][0-9])|([1-9])) [AP][M]$"></asp:RegularExpressionValidator>
