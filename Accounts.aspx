<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Accounts.aspx.vb" Inherits="Accounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <h3 dir="ltr">Using SQL directly</h3>
        <div>

            <br />

    <asp:TextBox ID="accountid" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="acc &amp; number"></asp:Label>
    <br/>
    <asp:TextBox ID="customerid" runat="server"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="3 numbers"></asp:Label>
    <br/>
    <asp:TextBox ID="account_type" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="account type(current)"></asp:Label>
    <br/>
    <asp:Button ID="Button1" OnClick="submit" runat="server" Text="Submit" BackColor="#00CCFF" BorderColor="#000099" BorderStyle="Groove" ForeColor="#0000CC"/>

    <asp:Label ID="Label1" runat="server"></asp:Label>

</div>
</form>

</body>
</html>

 