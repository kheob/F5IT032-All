<%@ Page Language="C#" MasterPageFile="~/Ass1/MasterPage.master" Title="Site Map" Theme="SkinFile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text">
        <h2>Site Map</h2>
        <div id="sitemapdiv">
            <asp:TreeView HoverNodeStyle-CssClass="sitemapHover" CssClass="links" DataSourceID="siteMapDataSource1" runat="server">
                <NodeStyle CssClass="sitemap" />
            </asp:TreeView>
        </div>
    </div>
</asp:Content>
