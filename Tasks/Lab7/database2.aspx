<%@ Page Language="C#" %>

<asp:accessdatasource runat="server" id="accessCustomers" datafile="Customers.accdb"
    SelectCommand="SELECT * FROM customers" />

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Customers</h3>
        <asp:GridView runat="server" ID="gridViewCustomers" AutoGenerateColumns="false" DataSourceID="accessCustomers">
            <Columns>
                <asp:BoundField DataField="cust_id" ReadOnly="true" HeaderText="Cust ID" SortExpression="cust_id" />
                <asp:BoundField DataField="cust_givenName" HeaderText="Given Name" SortExpression="cust_givenName" />
                <asp:BoundField DataField="cust_familyName" HeaderText="Family Name" SortExpression="cust_familyName" />
                <asp:ImageField DataImageUrlField="cust_image" DataImageUrlFormatString="pics/{0}" HeaderText="Image" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
