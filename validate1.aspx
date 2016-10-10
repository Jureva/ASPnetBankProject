<%@ Page Language="VB" AutoEventWireup="false" CodeFile="validate1.aspx.vb" Inherits="validate1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Enter details"></asp:Label>
        <br />
        <asp:TextBox ID="Submit" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" />
        <br />
        <asp:RangeValidator ID="RangeValidator" runat="server" ControlToValidate="Submit" ErrorMessage="Please enter a number between 1 – 10" MaximumValue="10" MinimumValue="1" Type="Integer"></asp:RangeValidator>
    
    </div>
    </form>
</body>
</html>
