<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Editxml.aspx.vb" Inherits="Editxml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loans</title>
</head>
<body>
    <form id="form1" runat="server">
   
        <p> Here You edit or delete loan data from xml file: </p>
        <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />

        <p> Here You add new loan data for xml file: </p>
        <asp:TextBox ID="customerid" runat="server"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Customer Id"></asp:Label>
            <br />
        <asp:TextBox ID="loanid" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Loan Id"></asp:Label>
            <br />
        <asp:TextBox ID="amount" runat="server"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="Amount"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="personal">Personal</asp:ListItem>
                <asp:ListItem Value="car">Car</asp:ListItem>
                <asp:ListItem Value="student">Student</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label4" runat="server" Text="Type of loan"></asp:Label>
            <p>
        <asp:Button ID="Button1" runat="server" Text="Add Data" />
            </p>
        </div>
    </form>
</body>
</html>
