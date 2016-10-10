Imports System.Data
Imports System.Data.OleDb

Partial Class gethint
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim query As String = Request.QueryString("query")

        If query = "" Then
            label1.Text = "No query param provided"
        End If

        If query <> "" Then
            label1.Text = "You searched for " & query
        End If

        Dim objConnection As OleDb.OleDbConnection
        Dim objAdapter As OleDb.OleDbDataAdapter
        Dim objDataset As New DataSet
        Dim strConnection As String
        Dim strSQL As String

        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " &
           "Data Source=" & Server.MapPath("App_Data/Finance.mdb") & ";"
        strSQL = "Select customerid, fname, sname, address1, address2, city, mobile FROM customers WHERE fname LIKE '%" & query & "%' ORDER BY fname ASC;"


        objConnection = New OleDb.OleDbConnection(strConnection)
        objConnection.Open()

        objAdapter = New OleDb.OleDbDataAdapter(strSQL, objConnection)
        objAdapter.Fill(objDataset)
        objAdapter.Dispose()
        objConnection.Close()

        For i = 0 To objDataset.Tables(0).Rows.Count - 1
            label1.Text = (objDataset.Tables(0).Rows(i).Item(0))
            label1.Text = label1.Text & "  --  " & objDataset.Tables(0).Rows(i).Item(1)
            label1.Text = label1.Text & "  --  " & objDataset.Tables(0).Rows(i).Item(2)
            label1.Text = label1.Text & "  --  " & objDataset.Tables(0).Rows(i).Item(3)
            label1.Text = label1.Text & "  --  " & objDataset.Tables(0).Rows(i).Item(4)
            label1.Text = label1.Text & "  --  " & objDataset.Tables(0).Rows(i).Item(5)
            label1.Text = label1.Text & "  --  " & objDataset.Tables(0).Rows(i).Item(6)

        Next


    End Sub

    Public Sub ReadData(ByVal connectionString As String,
    ByVal queryString As String)
        Using connection As New OleDbConnection(connectionString)
            Dim command As New OleDbCommand(queryString, connection)

            connection.Open()

            Dim reader As OleDbDataReader = command.ExecuteReader()
            While reader.Read()
                label1.Text = reader(0).ToString() & reader(1).ToString() & reader(2).ToString() & reader(3).ToString() & reader(4).ToString() & reader(5).ToString() & reader(6).ToString()
            End While
            reader.Close()
        End Using
    End Sub
End Class
