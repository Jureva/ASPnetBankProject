Imports System.Web.Services
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class ajax
    Inherits Page

    <WebMethod()>
    Public Shared Function GetCustomers(prefix As String) As String()
        Dim customers As New List(Of String)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select fname, customerid from Customers where fname like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        customers.Add(String.Format("{0}-{1}", sdr("fname"), sdr("customerid")))
                    End While
                End Using
                conn.Close()
            End Using
        End Using
        Return customers.ToArray()
    End Function

    Protected Sub Submit(sender As Object, e As EventArgs)
        Dim fname As String = Request.Form(txtSearch.UniqueID)
        Dim customerid As String = Request.Form(hfCustomerId.UniqueID)
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Name: " & fname & "\nID: " & customerid & "');", True)
    End Sub

End Class
