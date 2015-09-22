<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void searchButton_Click(object sender, EventArgs e)
    {
        customerDS.SelectCommand = "SELECT * FROM Customers WHERE Customer_name LIKE '%" + searchName.Text.Trim() + "%'";
        customerLV.DataSource = customerDS;
        customerLV.DataBind();
        if (customerLV.Items.Count == 0)
        {
            noEntries.Visible = true;
        }
        else
        {
            noEntries.Visible = false;
        }
    }

    private void findBook(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        switch (btn.CommandName)
        {
            case "ISBN":
                lothian.SelectCommand = "SELECT * FROM Books WHERE ISBN LIKE '%" +
                  txtISBN.Text.Trim(' ') + "%'";
                break;
            case "Title":
                lothian.SelectCommand = "SELECT * FROM Books WHERE book_title LIKE '%" +
                  txtTitle.Text.Trim(' ') + "%'";
                break;
            case "Author":
                lothian.SelectCommand = "SELECT * FROM Books WHERE book_author LIKE '%" +
                  txtAuthor.Text.Trim(' ') + "%'";
                break;
        }

        lv.DataSource = lothian;
        lv.DataBind();
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        div {
            padding-bottom: 50px;
        }
    </style>
</head>
<body>
    <asp:accessdatasource runat="server" id="customerDS" DataFile="~/Tasks/Lab8/Customers.mdb" SelectCommand="SELECT * FROM [Customers]"></asp:accessdatasource>
            <asp:accessdatasource runat="server"
    DataFile="lothian.mdb" 
    id="lothian">
  </asp:accessdatasource>
    <form id="form1" runat="server">
    <div>
        <h3>Search for a customer</h3>
        <p>Please enter the customer's name to see if they are in the database!</p>
        Name: <asp:TextBox runat="server" ID="searchName" /> <asp:Button runat="server" ID="searchButton" text="Submit" OnClick="searchButton_Click" />
        <asp:ListView runat="server" ID="customerLV">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="customerImage" runat="server" ImageUrl='<%# Eval("Customer_pic", "{0}") %>' />
                        </td>
                        <td>
                            <strong>Customer ID: </strong><%# Eval("Customer_id") %><br />
                            <strong>Customer Name: </strong><%# Eval("Customer_name") %><br />
                            <strong>Customer E-mail: </strong><%# Eval("Customer_email") %><br />

                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView> 
        <br /> <asp:Label ID="noEntries" runat="server" Visible="false" Text="No entries found!" />
    </div>
    <div>
        <h2>Find a book!</h2>

    <table>
    <tr>
      <td colspan="2"> Please enter part, or all, of the book's 
        ISBN (without any spaces).<br/> 
      </td>
    </tr>
    <tr>
      <td class="text">   
        <asp:TextBox id="txtISBN" runat="server" 
          width = "100" ></asp:TextBox>
      </td>
      <td>
        <asp:Button id="btnISBN" onclick="findBook" 
          runat="server" 
          Text="Click to find book from its ISBN"
          CssClass="button" CommandName="ISBN" />
        </td>
    </tr>
    <tr>
      <td><b>or</b></td>
    </tr>
    <tr>
      <td colspan="2">Please enter part, or all, of the book's 
        title.<br/>
      </td>    
    </tr>
    <tr>
      <td>
        <asp:TextBox id="txtTitle" runat="server" 
          width = "200" ></asp:TextBox>
      </td>
      <td>
        <asp:Button id="btnTitle" onclick="findBook" 
            runat="server" 
            Text="Click to find book from its title"
            CssClass="button" CommandName="Title" />
        </td>
     </tr>
    <tr>
      <td colspan="2">Please enter part, or all, of the author's 
        name.<br/> 
      </td>
    </tr>
    <tr>
      <td>   
        <asp:TextBox id="txtAuthor" runat="server" 
          width = "150" ></asp:TextBox>
      </td>
      <td>
        <asp:Button id="btnAuthor" onclick="findBook" 
          runat="server" 
          Text="Click to find book from its author" 
          CssClass="button" CommandName="Author" />
      </td>
    </tr>
    <tr>
      <td><b>or</b></td>
    </tr>
    </table>
    <br /><br /><br />
            
    <asp:listView id="lv" runat="server">
      <ItemTemplate>
        <table>
        <tr>
          <td>
            <asp:Image ID="imgCover" runat="server" 
              ImageUrl='<%# Eval("cover_image", "pix/{0}") %>' 
              CssClass="image"  /> 
          </td>
          <td>
            <b>Title: <%# Eval("book_title") %><br />
            Author: <%# Eval("book_author") %><br />
            <%# Eval("illustrator") %></b>
            ISBN: <%# Eval("ISBN") %><br />
            APN: <%# Eval("APN") %><p />
            <%# Eval("book_description") %><p />
            Price: <%# Eval("book_price") %>
            Pages: <%# Eval("number_pages") %>  
            <%# Eval("book_dimensions") %>  
            <%# Eval("book_cover") %><p />
          </td>
        </tr>
        <tr>
          <td colspan="2"><hr /></td>
        </tr>
        </table>
      </ItemTemplate>
    </asp:listView>
    </div>
    </form>
</body>
</html>
