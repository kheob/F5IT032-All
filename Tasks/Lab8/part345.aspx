<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void searchButton_Click(object sender, EventArgs e)
    {
        customerDS.SelectCommand = "SELECT * FROM Customers WHERE Customer_name LIKE '%" + searchBox.Text.Trim() + "%'";
        customerLV.DataSource = customerDS;
        customerLV.DataBind();
        if (customerLV.Items.Count == 0)
        {
            customerLabel.Visible = true;
        }
        else
        {
            customerLabel.Visible = false;
        }
    }

    protected void findFruit(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        int fruitID = 0;
        if (fruitIDBox.Text.Length > 0)
        {
            fruitID = Int32.Parse(fruitIDBox.Text);
        }
        switch (button.CommandName)
        {
            case "ID":
                fruitDS.SelectCommand = "SELECT * FROM Fruit WHERE Fruit_ID = " + fruitID; break;
            case "Name":
                fruitDS.SelectCommand = "SELECT * FROM Fruit WHERE Fruit_NAME LIKE '%" + fruitNameBox.Text.Trim() + "%'"; break;
        }
        fruitLV.DataSource = fruitDS;
        fruitLV.DataBind();
        if (fruitLV.Items.Count == 0)
        {
            fruitlabel.Visible = true;
        }
        else
        {
            fruitlabel.Visible = false;
        }
    }

    protected void productButton_Click(object sender, EventArgs e)
    {
        int productID = 0;
        if (productBox.Text.Length > 0) {
            productID = Int32.Parse(productBox.Text);
        }
        productDS.SelectCommand = "SELECT * FROM list WHERE product_id = " + productID;
        productGV.DataSource = productDS;
        productGV.DataBind();
        if (productGV.Rows.Count == 0)
        {
            productLabel.Visible = true;
        }
        else
        {
            productLabel.Visible = false;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:AccessDataSource ID="customerDS" DataFile="~/Tasks/Lab8/Customers2.mdb" runat="server" />

    <form id="form1" runat="server">
    <div>
        <h3>Part 3</h3> <p>Look for a customer</p>
        Name: <asp:TextBox runat="server" ID="searchBox" /> <asp:Button ID="searchButton" runat="server" text="Submit" OnClick="searchButton_Click"/>
        <br />
        <asp:ListView runat="server" ID="customerLV">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:image runat="server" ImageURL='<%# Eval("Customer_pic", "pix/{0}") %>' />
                        </td>
                        <td>
                            <strong>Customer ID: </strong><%# Eval("Customer_id") %><br />
                            <strong>Customer Name: </strong><%# Eval("Customer_name") %> <br />
                            <strong> Customer Email: </strong><%# Eval("Customer_email") %>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>    
        </asp:ListView>
        <asp:Label ID="customerLabel" runat="server" Text="Customer not found!" Visible="false" />
    </div>
    <asp:AccessDataSource ID="fruitDS" SelectCommand="SELECT Fruit_ID AS ID, Fruit_Name AS Fruit FROM Fruit" DataFile="~/Tasks/Lab8/Fruit.accdb" runat="server" />
        <asp:AccessDataSource ID="AccessDataSource1" SelectCommand="SELECT Fruit_ID AS ID, Fruit_Name AS Fruit FROM Fruit" DataFile="~/Tasks/Lab8/Fruit.accdb" runat="server" />

        <div>
        <h3>Part 4</h3>
        <asp:GridView ID="fruitGV" runat="server" DataSourceID="accessdatasource1" AutoGenerateColumns="true" /><br />
        <h4>Find fruit details by searching either fruit ID or fruit name</h4>
        <strong>Search by ID: </strong><asp:TextBox runat="server" ID="fruitIDBox" /><asp:Button runat="server" ID="fruitIDButton" CommandName="ID" OnClick="findFruit" text="Search"/><br />
        <strong>Search by Name: </strong><asp:TextBox runat="server" ID="fruitNameBox" /> <asp:Button runat="server" ID="fruitNameButton" CommandName="Name" OnClick="findFruit" Text="Search" /><br />
        <asp:ListView ID="fruitLV" runat="server">
            <ItemTemplate>
                Name: <%# Eval("Fruit_Name") %><br />
                Description: <%# Eval("Fruit_Desc") %><br />
            </ItemTemplate>
        </asp:ListView>
        <asp:Label runat="server" ID="fruitlabel" Text="No fruits found" Visible="false" />
    </div>


    <div>
        <asp:AccessDataSource ID="productDS" DataFile="~/Tasks/Lab8/shop.mdb" runat="server" />
        <h3>Part 5</h3>
        <h4>Search Product</h4>
        <p>Please enter a product number to search: (e.g. 1, 2, 3)</p>
        <asp:TextBox ID="productBox" runat="server" /> <asp:Button ID="productButton" text="Search" OnClick="productButton_Click" runat="server" /> <br />
        <asp:gridview ID="productGV" runat="server" /> <br />
        <asp:Label ID="productLabel" runat="server" Text="No records were found!" Visible="false" />
    </div>
    </form>
</body>
</html>
