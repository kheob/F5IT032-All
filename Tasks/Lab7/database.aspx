<%@ Page Language="C#" %>

<asp:accessdatasource runat="server" id="accessCustomers" datafile="Customers.accdb"
    SelectCommand="SELECT cust_id, cust_givenName, cust_familyName FROM customers" />

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
        <asp:GridView runat="server" ID="gridViewCustomers" DataSourceID="accessCustomers">

        </asp:GridView>
    </div>
    </form>
</body>
</html>
