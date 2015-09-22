<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script Language="c#" runat="server">
void Page_Load()
{
    if (!Page.IsPostBack)
    {
        BindData("CustID");
    }
}

void BindData(string SortFieldName)
{
    DataSet objDS = new DataSet();
    string strConn = @"Provider=Microsoft.Jet.OleDb.4.0;Data Source=" +(string)Server.MapPath("customer.mdb");
    string strSQL ="SELECT CustID, Firstname, Surname " +
        "FROM Customer ORDER BY " + SortFieldName;

    OleDbConnection objConn = new OleDbConnection(strConn);
    OleDbDataAdapter objDataAdapter = new OleDbDataAdapter(strSQL, strConn);
    objDataAdapter.Fill(objDS);

    dgCustomer.DataSource = objDS;
    dgCustomer.DataBind();  
}

void SortDataGrid(object sender, DataGridSortCommandEventArgs e)
{
    BindData(e.SortExpression);
}
</script>
<html>
  <body>
    <form id="Form1" runat="server">
    <asp:datagrid id="dgCustomer"
        runat="server"
        CellPadding="3"
        Font-Name="arial"
        Font-Size="8pt"
        HeaderStyle-BackColor="#dcdcdc"
        HeaderStyle-ForeColor="blue"
	    AllowSorting="true"
	    OnSortCommand="SortDataGrid">
	</asp:datagrid>
    </form>
  </body>
</html>
