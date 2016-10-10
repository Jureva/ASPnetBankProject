Imports System.Data
Imports System.Xml
Partial Class Loans
    Inherits System.Web.UI.Page
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        createXMLFile()
        Response.Write("File Created<br><a href='loans.xml'>View XML file</a>")
    End Sub

    Private Sub createXMLFile()

        ' Target .xml File
        Dim writer As New XmlTextWriter(Server.MapPath("loans.xml"), System.Text.Encoding.UTF8)
        Dim customerid As String
        Dim loanid As String
        Dim amount As String
        Dim type As String


        ' Create a xml file
        writer.WriteStartDocument(True)

        ' Make it neat
        writer.Formatting = Formatting.Indented
        writer.Indentation = 2

        ' Create the opening Document Tag
        writer.WriteStartElement("loans")


        createNode("102", "l17", "900", "personal", writer)
        createNode("106", "l13", "20000", "car", writer)
        createNode("109", "l10", "1100", "student", writer)

        ' Closing TAG + Table + File
        writer.WriteEndElement()
        writer.WriteEndDocument()
        writer.Close()

    End Sub

    Private Sub createNode(ByVal customerid As String, ByVal loanid As String, ByVal amount As String, ByVal type As String, ByVal writer As XmlTextWriter)
        writer.WriteStartElement("loan")
        writer.WriteStartElement("customerid")
        writer.WriteString(customerid)
        writer.WriteEndElement()
        writer.WriteStartElement("loanid")
        writer.WriteString(loanid)
        writer.WriteEndElement()
        writer.WriteStartElement("amount")
        writer.WriteString(amount)
        writer.WriteEndElement()
        writer.WriteStartElement("type")
        writer.WriteString(type)
        writer.WriteEndElement()
        writer.WriteEndElement()

    End Sub

End Class


