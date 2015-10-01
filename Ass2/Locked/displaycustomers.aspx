<%@ Page Language="C#" Theme="SkinFile" %>

<!DOCTYPE html>

<script runat="server">

    protected void customerGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int selectedRow = Convert.ToInt32(e.CommandArgument);
        String link = ((HyperLink)customerGV.Rows[selectedRow].Cells[10].Controls[0]).NavigateUrl;
        customerLabel.Text = "<h2>Customer Information: </h2>" +
                             "<strong>Customer ID: </strong>" + customerGV.Rows[selectedRow].Cells[1].Text +
                             "<br /><strong>Customer Name: </strong>" + customerGV.Rows[selectedRow].Cells[2].Text + " " + customerGV.Rows[selectedRow].Cells[3].Text +
                             "<br /><strong>Email Address: </strong>" + customerGV.Rows[selectedRow].Cells[4].Text +
                             "<br /><strong>Age: </strong>" + customerGV.Rows[selectedRow].Cells[5].Text +
                             "<br /><strong>Gender: </strong>" + customerGV.Rows[selectedRow].Cells[6].Text +
                             "<br /><strong>State: </strong>" + customerGV.Rows[selectedRow].Cells[7].Text +
                             "<br /><strong>Source: </strong>" + customerGV.Rows[selectedRow].Cells[8].Text +
                             "<br /><strong>Subscription: </strong>" + customerGV.Rows[selectedRow].Cells[9].Text +
                             "<br /><strong>URL: </strong><a href='" + link + "'>" + link + "</a>";
        customerPanel.Visible = true;
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <link type="text/css" rel="stylesheet" href="~/Ass2/StyleSheet2.css" />
        <title>Display Customers</title>
    </head>
    <body>
        <form runat="server">
            <asp:AccessDataSource ID="customerDS" runat="server" DataFile="~/Ass2/Customers.accdb"
                SelectCommand="SELECT * FROM [Customer]" />
            <h2>List of Quotee's Customers</h2>
            <asp:GridView ID="customerGV" SkinID="SkinFile" OnRowCommand="customerGV_RowCommand" CssClass="customerGV" runat="server" DataSourceID="customerDS" DataKeyNames="customerID" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true">
                <Columns>
                    <asp:ButtonField HeaderText="View" ButtonType="Button" Text="Select" />
                    <asp:BoundField DataField="customerID" ReadOnly="true"
                        HeaderText="Customer ID" SortExpression="customerID" />
                    <asp:BoundField DataField="firstname" HeaderText="First Name" SortExpression="firstname" />
                    <asp:BoundField DataField="lastname" HeaderText="Last Name" SortExpression="lastname" />
                    <asp:BoundField DataField="email" HeaderText="Email Address" SortExpression="email" />
                    <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                    <asp:BoundField DataField="hear" HeaderText="Source" SortExpression="hear" />
                    <asp:BoundField DataField="subscribe" HeaderText="Subscription" SortExpression="subscribe" />
                    <asp:HyperLinkField DataTextField="url" HeaderText="URL" Target="_blank" DataNavigateUrlFields="url" SortExpression="url" />
                </Columns>
            </asp:GridView>
            <asp:Panel ID="customerPanel" runat="server" CssClass="customerPanel" Visible="false">
                <asp:Label ID="customerLabel" runat="server" CssClass="customerLabel" />
            </asp:Panel>
            <br /><a href="~/Ass2/displaycode.aspx?filename=~/Ass2/Locked/displaycustomers.aspx" target="_blank" runat="server"><img src="../../Images/codebuttondisplayrecords.jpg" /></a>
            
        </form>
    </body>
</html>

