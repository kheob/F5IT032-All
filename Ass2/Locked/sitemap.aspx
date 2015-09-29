<%@ Page Language="C#" MasterPageFile="~/Ass2/MasterPage.master" Title="Site Map" Theme="SkinFile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text">
        <h2>Site Map</h2>
        <div id="sitemapdiv">
            <asp:TreeView HoverNodeStyle-CssClass="sitemapHover" CssClass="links" DataSourceID="siteMapDataSource1" runat="server">
                <NodeStyle CssClass="sitemap" />
            </asp:TreeView>
        </div>
        <br /><a href="~/Ass2/displaycode.aspx?filename=~/Ass2/Locked/sitemap.aspx" target="_blank" runat="server"><img src="../../Images/codebuttonSiteMap.jpg" /></a>
    </div>
</asp:Content>
