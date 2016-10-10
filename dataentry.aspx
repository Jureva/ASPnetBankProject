<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dataentry.aspx.vb" Inherits="dataentry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">   
    <div>

        <br />
        <asp:Label ID="Label1" runat="server" Text="Type the custumer name in "></asp:Label>
        <br />

        <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Search" />
        <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceCustomers %>" DeleteCommand="DELETE FROM [customers] WHERE [customerid] = ?" InsertCommand="INSERT INTO [customers] ([customerid], [fname], [sname], [address1], [address2], [city], [mobile]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:FinanceCustomers.ProviderName %>" SelectCommand="SELECT * FROM [customers] WHERE ([fname] LIKE '%' + ? + '%')" UpdateCommand="UPDATE [customers] SET [fname] = ?, [sname] = ?, [address1] = ?, [address2] = ?, [city] = ?, [mobile] = ? WHERE [customerid] = ?">
            <DeleteParameters>
                <asp:Parameter Name="customerid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="customerid" Type="String" />
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="sname" Type="String" />
                <asp:Parameter Name="address1" Type="String" />
                <asp:Parameter Name="address2" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtsearch" Name="fname" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="sname" Type="String" />
                <asp:Parameter Name="address1" Type="String" />
                <asp:Parameter Name="address2" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="customerid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="customerid" DataSourceID="SqlDataSource1" GridLines="Both">
            <EditItemTemplate>
                customerid:
                <asp:Label ID="customeridLabel1" runat="server" Text='<%# Eval("customerid") %>' />
                <br />
                fname:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                sname:
                <asp:TextBox ID="snameTextBox" runat="server" Text='<%# Bind("sname") %>' />
                <br />
                address1:
                <asp:TextBox ID="address1TextBox" runat="server" Text='<%# Bind("address1") %>' />
                <br />
                address2:
                <asp:TextBox ID="address2TextBox" runat="server" Text='<%# Bind("address2") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                <br />
                mobile:
                <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                customerid:
                <asp:TextBox ID="customeridTextBox" runat="server" Text='<%# Bind("customerid") %>' />
                <br />
                fname:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                sname:
                <asp:TextBox ID="snameTextBox" runat="server" Text='<%# Bind("sname") %>' />
                <br />
                address1:
                <asp:TextBox ID="address1TextBox" runat="server" Text='<%# Bind("address1") %>' />
                <br />
                address2:
                <asp:TextBox ID="address2TextBox" runat="server" Text='<%# Bind("address2") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                <br />
                mobile:
                <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                customerid:
                <asp:Label ID="customeridLabel" runat="server" Text='<%# Eval("customerid") %>' />
                <br />
                fname:
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                sname:
                <asp:Label ID="snameLabel" runat="server" Text='<%# Bind("sname") %>' />
                <br />
                address1:
                <asp:Label ID="address1Label" runat="server" Text='<%# Bind("address1") %>' />
                <br />
                address2:
                <asp:Label ID="address2Label" runat="server" Text='<%# Bind("address2") %>' />
                <br />
                city:
                <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' />
                <br />
                mobile:
                <asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("mobile") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle ForeColor="#000066" HorizontalAlign="Left" BackColor="White" />
            <RowStyle ForeColor="#000066" />
        </asp:FormView>
        <br />

    </div>
    </form>
</body>
</html>
