using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    private Dictionary<string, SiteMapNode> nodes = new Dictionary<string, SiteMapNode>();

    protected void Page_Init(object sender, EventArgs e) {
        SiteMapNodeCollection smNodeCollection = siteMap.Provider.RootNode.GetAllNodes();
        foreach(SiteMapNode node in smNodeCollection) {
            if(node.ParentNode.Title == string.Empty) {
                nodes.Add(node.Title, node);
                menu.Items.Add(node.Title);
            }
        }
        columnsRpt.DataSource = nodes.Keys;
        columnsRpt.DataBind();
    }

    protected void columnsRpt_ItemDataBound(object sender, RepeaterItemEventArgs e) {
        if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            Repeater rpt = (Repeater)e.Item.FindControl("rowsRpt");
            rpt.DataSource = nodes[e.Item.DataItem.ToString()].ChildNodes;
            rpt.DataBind();
        }
    }
}