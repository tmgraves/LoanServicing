﻿<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/publicmaster.master" AutoEventWireup="true"
    CodeFile="ChangePasswordSuccess.aspx.cs" Inherits="Account_ChangePasswordSuccess" %>

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
