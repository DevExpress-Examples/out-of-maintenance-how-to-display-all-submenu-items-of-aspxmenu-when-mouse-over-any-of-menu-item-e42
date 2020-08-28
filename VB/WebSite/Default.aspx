<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxSiteMapControl" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to display all submenu items of ASPxMenu when mouse over any of menu item</title>
	<script type="text/javascript">
		function menu_OnItemMouseOver(s, e) {
			popup.Show();
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxMenu ID="menu" runat="server">
			<ClientSideEvents ItemMouseOver="menu_OnItemMouseOver" />
			<ItemStyle Width="60px" />
		</dx:ASPxMenu>
		<dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" ShowHeader="false"
			PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below" PopupElementID="menu"
			Width="158" CloseAction="MouseOut">
			<ContentStyle>
				<Paddings Padding="0px" PaddingBottom="9px" PaddingLeft="2px" PaddingRight="2px" PaddingTop="9px" />
			</ContentStyle>
			<ContentCollection>
				<dx:PopupControlContentControl>
					<asp:Repeater ID="columnsRpt" runat="server" OnItemDataBound="columnsRpt_ItemDataBound">
						<ItemTemplate>
							<div style="float: left; margin: 0 2px 0 0; padding: 0 7px; width: 60px;">
								<asp:Repeater ID="rowsRpt" runat="server">
									<HeaderTemplate>
										<ul style="list-style-type: none; margin: 0; padding: 0; width: 60px;">
									</HeaderTemplate>
									<ItemTemplate>
										<li style="margin: 0; padding: 0;">
											<dx:ASPxHyperLink ID="hl" runat="server" Text='<% #Eval("Title")%>' NavigateUrl='<% #Eval("Url")%>'>
											</dx:ASPxHyperLink>
										</li>
									</ItemTemplate>
									<FooterTemplate>
										</ul>
									</FooterTemplate>
								</asp:Repeater>
							</div>
						</ItemTemplate>
					</asp:Repeater>
					<div style="clear: both;"></div>
				</dx:PopupControlContentControl>
			</ContentCollection>
		</dx:ASPxPopupControl>
		<dx:ASPxSiteMapDataSource ID="siteMap" runat="server" SiteMapFileName="~/Web.sitemap" />
	</form>
</body>
</html>