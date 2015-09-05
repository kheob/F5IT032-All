<%@ Page Language="C#" MasterPageFile="~/Ass1/MasterPage.master" Title="Quotees" Theme="SkinFile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <asp:AdRotator SkinID="SkinFile" ID="adRotator1" AdvertisementFile="~/Ass1/Ads.xml" runat="server" />
    
    <p>Quotees is a t-shirt design company based in Melbourne, Australia. We specialise in pop culture inspired prints as well as original artwork. Welcome!</p>
    <a href="index.aspx"><img id="smallLogo" src="Logo.gif" /></a> <br />

    <asp:HyperLink CssClass="links" runat="server" NavigateUrl="http://users.monash.edu.au/sgrose/msh/disclaimer.htm">Monash Disclaimer</asp:HyperLink> <br />
    Email: <asp:HyperLink CssClass="links" runat="server" NavigateUrl="mailto:bckhe1@student.monash.edu">Author</asp:HyperLink> <br />
    Email: <asp:HyperLink CssClass="links" runat="server" NavigateUrl="mailto:bckhe1@student.monash.edu">Webmaster</asp:HyperLink> <br /> <br />
</asp:Content>