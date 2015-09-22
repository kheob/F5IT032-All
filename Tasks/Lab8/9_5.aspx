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
        <asp:GridView ID="customerGV" runat="server" DataSourceID="customerDS" AllowSorting="true" AutoGenerateColumns="false">
            <columns>
                <asp:BoundField DataField="CustID" HeaderText="CustID" SortExpression="CustID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                <asp:BoundField DataField="Surname" headertext="Surname" SortExpression="Surname" />
            </columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
