Imports System.Data.SqlClient
Imports System.Data
Imports System.Web.Configuration

Partial Class Sqlserver
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Lets create a connection to our SQL Server database file
        Dim connStr As String = "Data Source=.\SQLExpress;" +
"User Instance=true;" +
"Integrated Security=true;" +
"AttachDbFilename=|DataDirectory|Finance.mdf;"

        'Now lets declare our variables and open the connection
        Dim conn As New SqlConnection(connStr)
        'conn.Open()

        'With the connection open, lets run a query on the Products table
        Dim sqlAccounts As String = "SELECT AccountID, AccountName, UnitPrice FROM Accounts"
        'We will use a Dataadapter to show the results of our query.
        'The DataAdapter is used either to fill a DataTable or a DataSet with data from the database 
        'using it's Fill method
        'Dim da As New SqlDataAdapter(sqlAccounts, conn)
        'Dim ds As New DataSet()
        'da.Fill(ds, "Accounts")

        'The results of our query is displayed within a Gridview control
        'GridView1.DataSource = ds.Tables("Accounts")
        'GridView1.DataBind()

    End Sub
End Class