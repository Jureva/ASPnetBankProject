<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ajax.aspx.vb" Inherits="ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css"
    rel="Stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("[id$=txtSearch]").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/ajax.aspx/GetCustomers") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("[id$=hfcustomerid]").val(i.item.val);
            },
            minLength: 1
        });
    });  
</script>
Enter search term:
<asp:TextBox ID="txtSearch" runat="server" />
<asp:HiddenField ID="hfcustomerid" runat="server" />
<br />
         
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Customers.xml"></asp:XmlDataSource>
        <asp:TreeView ID="TreeView1" runat="server" DataSourceID="XmlDataSource1"></asp:TreeView>
        <br />
        <br />
<asp:Button ID="Button1" Text="Submit" runat="server" OnClick="Submit" />
    </div>
    </form>
</body>
</html>
