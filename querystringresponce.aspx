﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="querystringresponce.aspx.vb" Inherits="querystringresponce" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Hi, <%=Request.QueryString("myValue")%>.
    </div>
    </form>
</body>
</html>
