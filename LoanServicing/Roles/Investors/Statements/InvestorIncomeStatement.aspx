<%@ Page Title="" Language="C#" MasterPageFile="~/Roles/Investors/investor.master" AutoEventWireup="true" CodeFile="InvestorIncomeStatement.aspx.cs" Inherits="Roles_Investors_Statements_InvestorIncomeStatement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <userControls:InvestorStatementList ID="ucStatements" runat="server"></userControls:InvestorStatementList>
</asp:Content>

