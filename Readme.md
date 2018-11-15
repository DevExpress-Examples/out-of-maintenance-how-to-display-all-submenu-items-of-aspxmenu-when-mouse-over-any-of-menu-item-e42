<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to display all submenu items of ASPxMenu when mouse over any of menu item


<p>An ASPxMenu does not allow this by default. But there is the following workaround. You can add ASPxPopupControl and prepare a dictionary of sitemap items. Then, bind this datasource (dictionary) to the Repeater placed on the ASPxPopupControl to display sub-menu items when the popup window is shown.</p>

<br/>


