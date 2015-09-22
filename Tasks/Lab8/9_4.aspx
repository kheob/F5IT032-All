<%@ Page Language="C#" %>

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
        <asp:AccessDataSource ID="customerDS" runat="server" SelectCommand="SELECT * FROM Customer" DataFile="~/Tasks/Lab8/Customer.accdb" />
        <asp:GridView ID="customerGV" AllowPaging="true" PageSize="5" runat="server" DataSourceID="customerDS">
            <PagerSettings Mode="Numeric" PageButtonCount="3" />
            <PagerStyle BackColor="LightGray" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
