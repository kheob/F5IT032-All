<%@ Page Language="C#" Theme="SkinFile" %>

<!DOCTYPE html>

<script runat="server">

    protected void findCustomer(object sender, EventArgs e)
    {
        Button button = (Button)sender;

        switch (button.CommandName)
        {
            case "ID":
                if (customerIDBox.Text.Trim().Length == 0)
                {
                    labelLV.Text = "<h3>You haven't entered anything</h3>";
                    labelLV.Visible = true;
                    customerLV.Visible = false;
                    return;
                }
                else
                {
                    customerDS.SelectCommand = "SELECT * FROM [Customer] WHERE [customerID] LIKE '" + customerIDBox.Text.Trim() + "'";
                    break;
                }
            case "firstname":
                if (firstnameBox.Text.Trim().Length == 0)
                {
                    labelLV.Text = "<h3>You haven't entered anything</h3>";
                    labelLV.Visible = true;
                    customerLV.Visible = false;
                    return;
                }
                else
                {
                    customerDS.SelectCommand = "SELECT * FROM [Customer] WHERE [firstname] LIKE '%" + firstnameBox.Text.Trim() + "%'";
                    break;
                }
                
            case "lastname":
                if (lastnameBox.Text.Trim().Length == 0)
                {
                    labelLV.Text = "<h3>You haven't entered anything</h3>";
                    labelLV.Visible = true;
                    customerLV.Visible = false;
                    return;
                }
                else
                {
                    customerDS.SelectCommand = "SELECT * FROM [Customer] WHERE [lastname] LIKE '%" + lastnameBox.Text.Trim() + "%'";
                    break;
                }
            default:
                break;
        }

        customerLV.DataSource = customerDS;
        customerLV.DataBind();
        customerLV.Visible = true;
        if (customerLV.Items.Count > 0)
        {
            labelLV.Text = "<h3>Customer Information: </h3>";
            labelLV.Visible = true;
        }
        else
        {
            labelLV.Visible = true;
            labelLV.Text = "<h3>No customers found</h3>";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link type="text/css" rel="stylesheet" href="~/Ass2/StyleSheet2.css" />
        <title>Search Customers</title>
</head>
<body>
    <asp:AccessDataSource runat="server" ID="customerDS" DataFile="~/Ass2/Customers.accdb" />
    <form id="form1" runat="server">
    <div>
        <h2>Search Quotee's Customer Database</h2>
        <div id="table">
            <table>
                <tr>
                    <td>Customer ID: </td>
                    <td><asp:TextBox ID="customerIDBox" runat="server" /></td>
                    <td><asp:Button ID="customerIDButton" runat="server" Text="Search" CommandName="ID" OnClick="findCustomer" /></td>
                </tr>
                <tr>
                    <td>Customer First Name: </td>
                    <td><asp:TextBox ID="firstnameBox" runat="server" /></td>
                    <td><asp:Button ID="firstnameButton" runat="server" Text="Search" CommandName="firstname" OnClick="findCustomer" /></td>
                </tr>
                <tr>
                    <td>Customer Last Name: </td>
                    <td><asp:TextBox ID="lastnameBox" runat="server" /></td>
                    <td><asp:Button ID="lastnameButton" runat="server" Text="Search" CommandName="lastname" OnClick="findCustomer" /></td>
                </tr>
            </table>
        </div>
        <asp:Label ID="labelLV" runat="server" Text="<h3>Customer Information:</h3>" Visible="false" />
        <asp:ListView ID="customerLV" runat="server">
            <ItemTemplate>
                <div id="divLV">
                    <strong>Customer ID: </strong><%# Eval("customerID") %>
                    <br /><strong>Customer Name: </strong><%# Eval("firstname") %> <%# Eval("lastname") %>
                    <br /><strong>Email Address: </strong><%# Eval("email") %>
                    <br /><strong>Age: </strong><%# Eval("age") %>
                    <br /><strong>Gender: </strong><%# Eval("gender") %>
                    <br /><strong>State: </strong><%# Eval("state") %>
                    <br /><strong>Source: </strong><%# Eval("hear") %>
                    <br /><strong>Subscription: </strong><%# Eval("subscribe") %>
                    <br /><strong>URL: </strong><a href="<%# Eval("url") %>"><%# Eval("url") %></a>
                </div>
                <br />
            </ItemTemplate>
        </asp:ListView>
        <br /><a href="~/Ass2/displaycode.aspx?filename=~/Ass2/Locked/searchcustomers.aspx" target="_blank" runat="server"><img src="../../Images/codebuttonsearchrecords.jpg" /></a>
    </div>
    </form>
</body>
</html>
