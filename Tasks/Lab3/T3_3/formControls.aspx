<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void register(object sender, EventArgs e)
    {
        givenName.Text = giveNameBox.Text;
        address.Text = addressBox.Text;
        email.Text = emailBox.Text;
        password.Text = passwordBox.Text;
        state.Text = DDL1.SelectedValue;
        phone.Text = phoneBox.Text;
        familyName.Text = familyNameBox.Text;
    }

    protected void reset(object sender, EventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="stylesheet" href="formStyle.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Daydream Holidays Registration</h1> <br />
        <div class="textboxes">
            <asp:Label runat="server" Text="Given Name:" CssClass="headings" /> <br />
            <asp:TextBox id="giveNameBox" runat="server" Columns="25" /> <br /> <br />

            <asp:Label runat="server" Text="Address:" CssClass="headings" /> <br />
            <asp:TextBox ID="addressBox" runat="server" TextMode="MultiLine" Columns="30" Rows="7" /> <br /> <br />

            <asp:Label runat="server" Text="Email Address:" CssClass="headings" /> <br />
            <asp:TextBox ID="emailBox" runat="server" Columns="35" /> <br /> <br />

            <asp:Label runat="server" Text="Password:" CssClass="headings" /> <br />
            <asp:TextBox id="passwordBox" runat="server" TextMode="Password" Columns="35" /> <br /> <br />
        </div>
        <div class="textboxes">
            <asp:Label runat="server" Text="Family Name:" CssClass="headings" /> <br />
            <asp:TextBox id="familyNameBox" runat="server" Columns="25" /> <br /> <br />        

            <asp:Label runat="server" Text="State:" CssClass="headings" /> <br />
            <asp:DropDownList ID="DDL1" runat="server">
                <asp:ListItem Text="Victoria" />
                <asp:ListItem Text="New South Wales" />
                <asp:ListItem Text="Queensland" />
                <asp:ListItem Text="South Australia" />
                <asp:ListItem Text="Northern Territory" />
                <asp:ListItem Text="Western Australia" />
                <asp:ListItem Text="Tasmania" />
                <asp:ListItem Text="ACT" />
            </asp:DropDownList> <br /> <br />

            <asp:Label runat="server" Text="Phone Number:" CssClass="headings" /> <br />
            <asp:TextBox id="phoneBox" runat="server" Columns="25" />
        </div>

        <div id="buttons">
            <asp:Button runat="server" Text="Register" OnClick="register" />
            <asp:Button runat="server" Text="Reset" OnClick="reset" />
        </div>

        <div class="results">
            <asp:Label runat="server" Text="Given Name: " />
            <asp:Label id="givenName" runat="server" Text="" /> <br /> <br />
            <asp:Label runat="server" Text="Address: " />
            <asp:Label ID="address" runat="server" Text="" /> <br /> <br />
            <asp:Label runat="server" Text="Email: " />
            <asp:Label id="email" runat="server" Text="" /> <br /> <br />
            <asp:Label runat="server" Text="Password: " />
            <asp:Label ID="password" runat="server" Text="" /> <br /> <br />
        </div>
        <div class="results">
            <asp:Label runat="server" Text="Family Name: " />
            <asp:Label id="familyName" runat="server" Text="" /> <br /> <br />
            <asp:Label runat="server" Text="State: " />
            <asp:Label ID="state" runat="server" Text="" /> <br /> <br />
            <asp:Label runat="server" Text="Phone: " />
            <asp:Label id="phone" runat="server" Text="" /> <br /> <br />
        </div>
    </form>
</body>
</html>
