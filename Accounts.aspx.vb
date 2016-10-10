Imports System.Data
Imports System.Data.OleDb

Partial Class Accounts
    Inherits System.Web.UI.Page



    Sub Submit(Sender As Object, E As EventArgs)
        Dim objConnection As OleDbConnection
        Dim objCmd As OleDbCommand
        Dim strConnection As String
        Dim strSQL As String

        Dim accountid As String
        Dim customerid As String
        Dim account_type As String
        accountid = Request.Form("accountid")
        customerid = Request.Form("customerid")
        account_type = Request.Form("account_type")
        strConnection = "Provider=Microsoft.Jet.OLEDB.4.0;" &
        "Data Source=|DataDirectory|Finance.mdb;"

        ' Create and open the connection object
        objConnection = New OleDbConnection(strConnection)
        objConnection.Open()
        ' set the SQL string
        strSQL = "INSERT INTO accounts (accountid, customerid, account_type)" &
        " VALUES ('" + accountid + "','" + customerid + "','" + account_type + "');"


        ' Create the Command and set its properties
        objCmd = New OleDbCommand(strSQL, objConnection)
        ' execute the command
        objCmd.ExecuteNonQuery()

        Label1.Text = "Command has been run and the record has been added"

    End Sub

End Class
