Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private nodes As New Dictionary(Of String, SiteMapNode)()

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim smNodeCollection As SiteMapNodeCollection = siteMap.Provider.RootNode.GetAllNodes()
		For Each node As SiteMapNode In smNodeCollection
			If node.ParentNode.Title = String.Empty Then
				nodes.Add(node.Title, node)
				menu.Items.Add(node.Title)
			End If
		Next node
		columnsRpt.DataSource = nodes.Keys
		columnsRpt.DataBind()
	End Sub

	Protected Sub columnsRpt_ItemDataBound(ByVal sender As Object, ByVal e As RepeaterItemEventArgs)
		If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
			Dim rpt As Repeater = CType(e.Item.FindControl("rowsRpt"), Repeater)
			rpt.DataSource = nodes(e.Item.DataItem.ToString()).ChildNodes
			rpt.DataBind()
		End If
	End Sub
End Class