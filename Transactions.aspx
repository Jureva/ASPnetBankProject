<%@ Page Trace="false" Language="VB" AutoEventWireup="false" CodeFile="Transactions.aspx.vb" Inherits="debugging" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>New transaction validation</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label" runat="server" Text="TransactionID"></asp:Label>
        <br />
        <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
        <br />
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtnumber" ErrorMessage="Please enter the number" MaximumValue="800" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="AccountID"></asp:Label>
        <br />
        <asp:TextBox ID="textnumber" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="textnumber" ErrorMessage="Please enter your accID"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Amount"></asp:Label>
        <br />
        <asp:TextBox ID="txtamount" runat="server"></asp:TextBox>
        <br />
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtamount" ErrorMessage="Amount required " MaximumValue="2000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="CustomerID"></asp:Label>
        <br />
        <asp:TextBox ID="TextNR" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextNR" ErrorMessage="Please enter your customer ID"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button" runat="server" Text="Submit" />
        <br />
        <br />
        <br />
    
    </div>

        <div>
            <br />
            <br />
        </div>

    </form>
</body>
</html>
