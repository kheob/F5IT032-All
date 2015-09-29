<%@ Page Language="C#" Theme="SkinFile" %>
<%@ Import Namespace="System.IO" %>

<!-- Code reference: FIT5032 Course Material -->

<script language="C#" runat="server">
    
    void Page_Load()
    {
        String filePath = Server.MapPath(Request.QueryString["filename"]);
        String filePath2 = Server.MapPath(Request.QueryString["filename2"]);
        String filePath3 = Server.MapPath(Request.QueryString["filename3"]);
        fileName.Text = "<strong>Source Code: </strong>" + Request.QueryString["filename"];
        codeLabel.Text = ReadFile(filePath);
        String file2 = "";
        file2 += Request.QueryString["filename2"];
        if (file2.Length > 0) // Only displays code for the second file if it is in the query string.
        {
            fileName2.Text += "<strong>Source Code: </strong>" + Request.QueryString["filename2"];
            codeLabel2.Text = ReadFile(filePath2);
            fileName2.Visible = true;
            codeLabel2.Visible = true;
            codePanel2.Visible = true;
        }
        String file3 = "";
        file3 += Request.QueryString["filename3"];
        if (file3.Length > 0) // Only displays code for the third file if it is in the query string.
        {
            fileName3.Text += "<strong>Source Code: </strong>" + Request.QueryString["filename3"];
            codeLabel3.Text = ReadFile(filePath3);
            fileName3.Visible = true;
            codeLabel3.Visible = true;
            codePanel3.Visible = true;
        }
    }

    private String ReadFile(String filePath)
    {
        String fileOutput = "";
        try
        {
            StreamReader fileReader = new StreamReader(filePath);
            while (fileReader.Peek() > -1)
            {
                fileOutput += fileReader.ReadLine().Replace("<", "&lt;").Replace("  ", "&nbsp;&nbsp;&nbsp;&nbsp;") +
                    "<br />";
            }
            fileReader.Close();
        }
        catch (Exception e)
        {
            fileOutput = e.Message;
        }
        return fileOutput;
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <link type="text/css" rel="stylesheet" href="~/Ass2/StyleSheet.css" />
        <title>Display Code</title>
    </head>
    <body>
        <div class="codePanelWrapper">
            <asp:Label ID="fileName" CssClass="codeHeader" runat="server" /><br /><br />
            <div>
                <asp:Panel ID="codePanel" CssClass="codePanel" runat="server">
                    <asp:Label ID="codeLabel" CssClass="codeLabel" runat="server" />
                </asp:Panel>
            </div>
        </div>
        <div class="codePanelWrapper">
            <asp:Label ID="fileName2" CssClass="codeHeader" runat="server" Visible="false" /><br /><br />
            <div>
                <asp:Panel ID="codePanel2" CssClass="codePanel" runat="server" Visible="false">
                    <asp:Label ID="codeLabel2" CssClass="codeLabel" runat="server" Visible="false" />
                </asp:Panel>
            </div>
        </div>
        <div class="codePanelWrapper">
            <asp:Label ID="fileName3" CssClass="codeHeader" runat="server" Visible="false" /><br /><br />
            <div>
                <asp:Panel ID="codePanel3" CssClass="codePanel" runat="server" Visible="false">
                    <asp:Label ID="codeLabel3" CssClass="codeLabel" runat="server" Visible="false" />
                </asp:Panel>
            </div>
        </div>
    </body>
</html>