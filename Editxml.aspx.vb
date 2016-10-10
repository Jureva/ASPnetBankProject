Imports System.Data
Partial Class Editxml
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object,
          ByVal e As System.EventArgs) Handles Me.Load
            If Page.IsPostBack = False Then
                BindGrid()
            End If
        End Sub

    Sub BindGrid()
        Dim oDs As New DataSet
        oDs.ReadXml(Request.PhysicalApplicationPath + "loans.xml")
        GridView1.DataSource = oDs
        GridView1.DataBind()

    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object,
         ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) _
         Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        BindGrid()
    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object,
      ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) _
      Handles GridView1.RowDeleting
        BindGrid()
        Dim oDs As DataSet = GridView1.DataSource
        oDs.Tables(0).Rows(GridView1.Rows(e.RowIndex).DataItemIndex).Delete()
        oDs.WriteXml(Request.PhysicalApplicationPath + "loans.xml")
        BindGrid()
    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object,
        ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) _
        Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        BindGrid()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object,
       ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
       Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        BindGrid()
    End Sub

    Protected Sub GridView1_RowUpdating(ByVal sender As Object,
         ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) _
         Handles GridView1.RowUpdating
        ' Get the new values from the GridView controls
        Dim i As Integer = GridView1.Rows(e.RowIndex).DataItemIndex
        Dim customerid As String = CType(GridView1.Rows(e.RowIndex).Cells(2).Controls(0), TextBox).Text
        Dim loanid As String = CType(GridView1.Rows(e.RowIndex).Cells(3).Controls(0), TextBox).Text
        Dim amount As String = CType(GridView1.Rows(e.RowIndex).Cells(4).Controls(0), TextBox).Text
        Dim type As String = CType(GridView1.Rows(e.RowIndex).Cells(5).Controls(0), TextBox).Text
        GridView1.EditIndex = -1
        BindGrid()
        ' Update the XML file using the new values

        Dim oDs As DataSet = GridView1.DataSource
        oDs.Tables(0).Rows(i).Item(0) = customerid 'strTitle 
        oDs.Tables(0).Rows(i).Item(1) = loanid 'strISBN 
        oDs.Tables(0).Rows(i).Item(2) = amount 'strPublisher 
        oDs.Tables(0).Rows(i).Item(3) = type
        oDs.WriteXml(Request.PhysicalApplicationPath + "loans.xml")
        BindGrid()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object,
          ByVal e As System.EventArgs) Handles Button1.Click
        BindGrid()
        Dim oDs As DataSet = GridView1.DataSource
        Dim oDr As DataRow = oDs.Tables(0).NewRow
        oDr("customerid") = customerid.Text
        oDr("loanid") = loanid.Text
        oDr("amount") = amount.Text
        oDr("type") = DropDownList1.SelectedValue
        oDs.Tables(0).Rows.Add(oDr)
        oDs.WriteXml(Request.PhysicalApplicationPath + "loans.xml")
        BindGrid()
        customerid.Text = ""
        loanid.Text = ""
        amount.Text = ""

    End Sub
    Protected Sub amount_TextChanged(sender As Object, e As EventArgs) Handles amount.TextChanged

    End Sub
End Class
