<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    /**
     * Page Load Method
     **/
    void Page_Load()
    {
        if (Page.IsPostBack)
        {
            Label4.Text = DropDownList1.SelectedValue;
            Label4.Visible = true;
        }
    }

    void Button1_Click(object sender, EventArgs e)
    {
        Button1.Text = "I've been clicked";
        Label1.BackColor = System.Drawing.Color.Green;
        Label1.ForeColor = System.Drawing.Color.White;
        Label1.BorderStyle = System.Web.UI.WebControls.BorderStyle.Dashed;
        Label1.ToolTip = "this is Label 1";
        Label2.Text = "I've changed the text";
        Label2.ForeColor = System.Drawing.Color.Blue;
        Label2.BackColor = System.Drawing.Color.White;
        Label2.BorderStyle = System.Web.UI.WebControls.BorderStyle.Outset;
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family: Arial">
        <asp:Label id="Label1" runat="server" text="Welcome!" BackColor="Blue" ForeColor="Yellow" BorderWidth="5px" BorderColor="Black" BorderStyle="Dotted" ToolTip="Label 1" /> <br /> <br />
        <asp:Label ID="Label2" runat="server" Text="Welcome to my webpage. Enjoy your stay." BackColor="#FF3279" ForeColor="#CCFF99" BorderWidth="10px" BorderColor="Red" BorderStyle="Ridge" Height="50px" Width="450px" ToolTip="Label 2" /> <br /> <br />
        <asp:Button ID="Button1" runat="server" Text="Click here and something happens" OnClick="Button1_Click" BackColor="Black" ForeColor="White" BorderWidth="10px" BorderStyle="Outset" Height="50px" /> <br /> <br /> <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Text="Monday" />
            <asp:ListItem Text="Tuesday" />
            <asp:ListItem Text="Wednesday" />
            <asp:ListItem Text="Thursday" />
            <asp:ListItem Text="Friday" />
            <asp:ListItem Text="Saturday" />
            <asp:ListItem Text="Sunday" />
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="Select an option and click the Display Choice button" /> <br /> <br />
        <asp:Label ID="Label4" runat="server" BackColor="Blue" ForeColor="Yellow" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" Visible="false" /> <br /> <br />
        <asp:Button ID="Button2" runat="server" text="Display Choice" BackColor="Black" ForeColor="White" BorderWidth="10px" BorderColor="Gold" BorderStyle="Outset" Height="50px"/>
    </div>
    </form>
</body>
</html>
