<%@ Page Language="C#" Debug="true" %>

<script language="c#" runat="server">

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



<html>
  <head>
    <title>Book Search</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
        <asp:accessdatasource runat="server"
    DataFile="lothian.mdb" 
    id="lothian">
  </asp:accessdatasource>
  <form runat="server">
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
  </form>
  </body>
</html>