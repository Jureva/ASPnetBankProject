<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Customers.aspx.vb" Inherits="Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p> <a href="Customerdetails.aspx" class="btn btn-primary btn-lg"> Customer details </a></p> 

    <p> <a href="Transactions.aspx" class="btn btn-primary btn-lg"> Transactions </a>
        <asp:Button ID="Button1" runat="server" Text="Create XML" />
    </p>

    <p> <a href="dataentry.aspx" class="btn btn-primary btn-lg"> New/Edit/Delete Data </a></p>

    <p> <a href="Accounts.aspx" class="btn btn-primary btn-lg"> Accounts </a></p>

</asp:Content>

