<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void insertButton_Click(object sender, EventArgs e)
    {
        customerDS.Insert();
    }

    protected void customerDV_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        customerGV.DataBind();
    }

    protected void customerDV_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        customerGV.DataBind();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:AccessDataSource ID="customerDS" runat="server" SelectCommand="SELECT * FROM [Customers]" DataFile="~/Tasks/Lab8/Customerscopy.mdb" DeleteCommand="DELETE FROM [Customers] WHERE [Customer_id] = ?" InsertCommand="INSERT INTO [Customers] ([Customer_id], [Customer_name], [Customer_email], [Customer_pic]) VALUES (?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Customers] SET [Customer_name] = ?, [Customer_email] = ?, [Customer_pic] = ? WHERE [Customer_id] = ?" >
        <DeleteParameters>
            <asp:Parameter Name="Customer_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:FormParameter Name="Customer_id" FormField="idBox" />
            <asp:FormParameter Name="Customer_name" FormField="nameBox" />
            <asp:FormParameter Name="Customer_email" FormField="emailBox" />
            <asp:FormParameter Name="Customer_pic" FormField="imageBox" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Customer_name" Type="String" />
            <asp:Parameter Name="Customer_email" Type="String" />
            <asp:Parameter Name="Customer_pic" Type="String" />
            <asp:Parameter Name="Customer_id" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="customerDS2" runat="server" UpdateCommand="UPDATE [Customers] SET [Customer_name] = ?, [Customer_email] = ?, [Customer_pic] = ? WHERE [Customer_id] = ?" DeleteCommand="DELETE FROM [Customers] WHERE [Customer_id] = ?" SelectCommand="SELECT * FROM Customers WHERE Customer_id = ?" DataFile="~/Tasks/Lab8/Customerscopy.mdb">
        <SelectParameters>
            <asp:ControlParameter ControlID="customerGV" Name="Customer_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="Customer_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Customer_name" Type="String" />
            <asp:Parameter Name="Customer_email" Type="String" />
            <asp:Parameter Name="Customer_pic" Type="String" />
            <asp:Parameter Name="Customer_id" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="customerGV" runat="server" DataKeyNames="Customer_id" AutoGenerateSelectButton="true" DataSourceID="customerDS" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Customer_id" HeaderText="Customer_id" SortExpression="Customer_id" />
                <asp:BoundField DataField="Customer_name" HeaderText="Customer_name" SortExpression="Customer_name" />
                <asp:BoundField DataField="Customer_email" HeaderText="Customer_email" SortExpression="Customer_email" />
                <asp:imagefield DataImageUrlField="Customer_pic" HeaderText="Customer_pic" DataImageUrlFormatString="{0}" SortExpression="Customer_pic" />
            </Columns>
        </asp:GridView>
        <br />
        <table>
            <tr>
                <td>Customer ID: </td><td><asp:TextBox ID="idBox" runat="server" /></td>
            </tr>
            <tr>
                <td>Customer Name: </td><td><asp:TextBox ID="nameBox" runat="server" /></td>
            </tr>
            <tr>
                <td>Customer Email: </td><td><asp:TextBox ID="emailBox" runat="server" /></td>
            </tr>
            <tr>
                <td>Customer Image: </td><td><asp:TextBox ID="imageBox" runat="server" /></td>
            </tr>
        </table>
        <br /> <asp:Button ID="insertButton" runat="server" Text="Add Record" OnClick="insertButton_Click" />
    </div>
    <div>
        <h3>FormView</h3>
        <asp:FormView ID="customerFV" runat="server" DataSourceID="customerDS" DefaultMode="Insert">
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>Customer ID: </td><td><asp:TextBox ID="idBox2" runat="server" Text='<%# Bind("Customer_id") %>' /></td>
                    </tr>
                    <tr>
                        <td>Customer Name: </td><td><asp:TextBox ID="nameBox2" runat="server" Text='<%# Bind("Customer_name") %>' /></td>
                    </tr>
                    <tr>
                        <td>Customer Email: </td><td><asp:TextBox ID="emailBox2" runat="server" Text='<%# Bind("Customer_email") %>' /></td>
                    </tr>
                    <tr>
                        <td>Customer Image: </td><td><asp:TextBox ID="imageBox2" runat="server" Text='<%# Bind("Customer_pic") %>' /></td>
                    </tr>
                </table>
                <asp:Button ID="insertButton" runat="server" CausesValidation="true" CommandName="Insert" Text="Add" />
                <asp:Button ID="cancelButton" runat="server" CausesValidation="true" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    <div>
        <h3>DetailsView</h3>
        <asp:DetailsView runat="server" ID="customerDV" AutoGenerateDeleteButton="true" OnItemDeleted="customerDV_ItemDeleted" OnItemUpdated="customerDV_ItemUpdated" DataSourceID="customerDS2" DataKeyNames="Customer_id" AutoGenerateEditButton="true"></asp:DetailsView>
    </div>
    </form>
</body>
</html>
