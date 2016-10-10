<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sajax.aspx.vb" Inherits="sajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>


<body>
  
    <form action="0">
Searching for: <input type="text" id="txt1" onkeyup="showHint(this.value)"/>
</form>

<p>Suggestions: <span id="txtHint"></span></p>

<script>
function showHint(str) {
  var xhttp;
  if (str.length == 0) {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("txtHint").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "gethint.aspx?query="+str, true);
  xhttp.send();
}
</script>

     <div>
        <br />
        <asp:Image ID="GIF" runat="server" ImageUrl="~/Content/GIF.gif" Width="1190px" Height="540px" />
    </div>
   
</body>
</html>




