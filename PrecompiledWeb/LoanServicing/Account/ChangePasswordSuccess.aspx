<%@ page title="Change Password" language="C#" masterpagefile="~/publicmaster.master" autoeventwireup="true" inherits="Account_ChangePasswordSuccess, App_Web_tu3ivthh" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Change Password
    </h2>
    <p>
        Your password has been changed successfully.
    </p>
    <p>
        <asp:Button ID="btnReturn" runat="server" Text="Return" 
            onclick="btnReturn_Click" />
    </p>
</asp:Content>
