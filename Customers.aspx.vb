Imports System.Data
Imports System.Xml
Partial Class Customers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Page.User.Identity.IsAuthenticated Then
            FormsAuthentication.RedirectToLoginPage()
        End If
    End Sub
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        createXMLFile()
        Response.Write("File Created<br><a href='transactions.xml'>View XML file</a>")
    End Sub

    Private Sub createXMLFile()

        ' Target .xml File
        Dim writer As New XmlTextWriter(Server.MapPath("transactions.xml"), System.Text.Encoding.UTF8)

        ' Source data is an Access .mdb file
        Dim objConnection As OleDb.OleDbConnection
        Dim objAdapter As OleDb.OleDbDataAdapter
        Dim objDataset As New DataSet
        Dim strConnection As String
        Dim strSQL As String
        Dim transactionid As String
        Dim accountid As String
        Dim customerid As String
        Dim amount As String
        Dim transaction_type As String

        ' Create a xml file
        writer.WriteStartDocument(True)

        ' Make it neat
        writer.Formatting = Formatting.Indented
        writer.Indentation = 2

        ' Create the opening Document Tag
        writer.WriteStartElement("transactions")

        ' Get access db file contents
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " &
            "Data Source=" & Server.MapPath("App_Data/Finance.mdb") & ";"
        strSQL = "Select transactionid, accountid, customerid, amount, transaction_type FROM transactions;"

        objConnection = New OleDb.OleDbConnection(strConnection)
        objAdapter = New OleDb.OleDbDataAdapter(strSQL, objConnection)
        objAdapter.Fill(objDataset)

        ' For Each Row add to XML
        For Each row As DataRow In objDataset.Tables(0).Rows
            transactionid = row.Item("transactionid").ToString()
            accountid = row.Item("accountid").ToString()
            customerid = row.Item("customerid").ToString()
            amount = row.Item("amount").ToString()
            transaction_type = row.Item("transaction_type").ToString()
            createNode(transactionid, accountid, customerid, amount, transaction_type, writer)
        Next

        ' Closing TAG + Table + File
        writer.WriteEndElement()
        writer.WriteEndDocument()
        writer.Close()

    End Sub

    Private Sub createNode(ByVal transactionid As String, ByVal accountid As String, ByVal customerid As String, ByVal amount As String, ByVal transaction_type As String, ByVal writer As XmlTextWriter)
        writer.WriteStartElement("trasaction")
        writer.WriteStartElement("transactionid")
        writer.WriteString(transactionid)
        writer.WriteEndElement()
        writer.WriteStartElement("accountid")
        writer.WriteString(accountid)
        writer.WriteEndElement()
        writer.WriteStartElement("customerid")
        writer.WriteString(customerid)
        writer.WriteEndElement()
        writer.WriteStartElement("amount")
        writer.WriteString(amount)
        writer.WriteEndElement()
        writer.WriteStartElement("transaction_type")
        writer.WriteString(transaction_type)
        writer.WriteEndElement()
        writer.WriteEndElement()

    End Sub

End Class

