<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Currency.aspx.vb" Inherits="Currency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <p>Click the button to open XML file displayed via HTML/CSS</p>

<button onclick="myFunction()">Currency</button>

    <script>
        function myFunction() {
        window.open("currency.html");
        }
    </script>
    <div>
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/currency.jpg" Width="1190px" />
    </div>
</asp:Content>

