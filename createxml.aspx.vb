Imports System.Data
Partial Class createxml
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(Sender As Object, e As EventArgs)

        'Lets declare our variables
        Dim strConnection As String
        Dim strSQL As String
        Dim objDataSet As New DataSet()
        Dim objConnection As OleDb.OleDbConnection
        Dim objAdapter As OleDb.OleDbDataAdapter

        ' set the connection and query details
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " &
                   "Data Source=|DataDirectory|Finance.mdb;"
        strSQL = "SELECT fName, sName, City FROM Customers;"

        ' open the connection and set the command
        objConnection = New OleDb.OleDbConnection(strConnection)
        objAdapter = New OleDb.OleDbDataAdapter(strSQL, objConnection)

        ' fill the dataset with the data
        objAdapter.Fill(objDataSet, "Customers")

        'Lets create the XML file called Customers

        objDataSet.WriteXml(Server.MapPath("customers.xml"))

        'Now let’s show a link to the XML we have just created

        Response.Write("<a href='Customers.xml'>View XML file</a>")

    End Sub

End Class
