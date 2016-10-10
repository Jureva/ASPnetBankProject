<%@ Page Language="VB" AutoEventWireup="false" CodeFile="createxml.aspx.vb" Inherits="createxml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>xmlpage</title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="3" DataSourceID="XmlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/customers.xml"></asp:XmlDataSource>
        <br />
        <br />
        <br />
        <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtsname" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtcity" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Button" /></div>
    </form>
    
</body>
</html>
