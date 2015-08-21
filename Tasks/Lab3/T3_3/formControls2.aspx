<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void register(object sender, EventArgs e)
    {
        givenName.Text = givenNameBox.Text;
        address.Text = addressBox.Text;
        email.Text = emailBox.Text;
        password.Text = passwordBox.Text;
        state.Text = DDL1.SelectedValue;
        phone.Text = phoneBox.Text;
        familyName.Text = familyNameBox.Text;
        panel1.Visible = true;
    }

    protected void reset(object sender, EventArgs e)
    {
        givenNameBox.Text = "";
        addressBox.Text = "";
        emailBox.Text = "";
        passwordBox.Text = "";
        phoneBox.Text = "";
        familyNameBox.Text = "";
        panel1.Visible = false;
    }

    protected void fun(object sender, EventArgs e)
    {
        funlabel.Visible = true;
        if (!hotels.Checked && !meals.Checked && !entertainment.Checked)
        {
            if (radio1.SelectedItem == null)
            {
                funlabel.Text = "You don't want to have any fun";
            } else {
                switch (radio1.SelectedValue)
                {
                    case "Melbourne": funlabel.Text = "You don't want to have fun in Melbourne"; break;
                    case "Sydney": funlabel.Text = "You don't want to have fun in Sydney"; break;
                    case "Brisbane": funlabel.Text = "You don't want to have fun in Brisbane"; break;
                    default: break;
                }
            }
        }
        else
        {
            if (radio1.SelectedItem == null)
            {
                funlabel.Text = "Please select a city";
            }
            else
            {
                funlabel.Text = "";
                if (hotels.Checked)
                {
                    funlabel.Text += "You have selected Cheap Hotels" + "<br />";
                }
                if (meals.Checked)
                {
                    funlabel.Text += "You have selected Cheap Meals" + "<br />";
                }
                if (entertainment.Checked)
                {
                    funlabel.Text += "You have selected Cheap Entertainment" + "<br />";
                }
                funlabel.Text += "in " + radio1.SelectedValue;
            }
        }
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
            <asp:TextBox cssclass="boxes" id="givenNameBox" runat="server" Columns="25" /> <br /> <br />

            <asp:Label runat="server" Text="Address:" CssClass="headings" /> <br />
            <asp:TextBox cssclass="boxes" ID="addressBox" runat="server" TextMode="MultiLine" Columns="30" Rows="7" /> <br /> <br />

            <asp:Label runat="server" Text="Email Address:" CssClass="headings" /> <br />
            <asp:TextBox cssclass="boxes" ID="emailBox" runat="server" Columns="35" /> <br /> <br />

            <asp:Label runat="server" Text="Password:" CssClass="headings" /> <br />
            <asp:TextBox cssclass="boxes" id="passwordBox" runat="server" TextMode="Password" Columns="35" /> <br /> <br />
        </div>
        <div class="textboxes">
            <asp:Label runat="server" Text="Family Name:" CssClass="headings" /> <br />
            <asp:TextBox cssclass="boxes" id="familyNameBox" runat="server" Columns="25" /> <br /> <br />        

            <asp:Label runat="server" Text="State:" CssClass="headings" /> <br />
            <asp:DropDownList cssclass="boxes" ID="DDL1" runat="server">
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
            <asp:TextBox cssclass="boxes" id="phoneBox" runat="server" Columns="25" />
        </div>

        <div id="buttons">
            <asp:Button runat="server" Text="Register" OnClick="register" />
            <asp:Button runat="server" Text="Reset" OnClick="reset" />
        </div>
        <asp:Panel ID="panel1" runat="server" CssClass="panel1" Visible="false">
            <div class="results">
                <asp:Label cssclass="resultlabels" runat="server" Text="Given Name: " />
                <asp:Label cssclass="resulttext" id="givenName" runat="server" Text="" /> <br /> <br />
                <asp:Label cssclass="resultlabels" runat="server" Text="Address: " />
                <asp:Label cssclass="resulttext" ID="address" runat="server" Text="" /> <br /> <br />
                <asp:Label cssclass="resultlabels" runat="server" Text="Email: " />
                <asp:Label cssclass="resulttext" id="email" runat="server" Text="" /> <br /> <br />
                <asp:Label cssclass="resultlabels" runat="server" Text="Password: " />
                <asp:Label cssclass="resulttext" ID="password" runat="server" Text="" /> <br /> <br />
            </div>
            <div class="results">
                <asp:Label cssclass="resultlabels" runat="server" Text="Family Name: " />
                <asp:Label cssclass="resulttext" id="familyName" runat="server" Text="" /> <br /> <br />
                <asp:Label cssclass="resultlabels" runat="server" Text="State: " />
                <asp:Label cssclass="resulttext" ID="state" runat="server" Text="" /> <br /> <br />
                <asp:Label cssclass="resultlabels" runat="server" Text="Phone: " />
                <asp:Label cssclass="resulttext" id="phone" runat="server" Text="" /> <br /> <br />
            </div>
        </asp:Panel> <br />

        <asp:Calendar runat="server" CssClass="calendar" CellPadding="3">
            <DayHeaderStyle CssClass="DayHeaderStyle-BackColor" />
            <TitleStyle CssClass="TitleStyle-BackColor" />
            <TodayDayStyle CssClass="TodayDayStyle-BackColor" />
            <WeekendDayStyle CssClass="WeekendDayStyle-BackColor" />
            <OtherMonthDayStyle CssClass="OtherMonthDayStyle-BackColor" />
            <SelectedDayStyle CssClass="SelectedDayStyle-BackColor" />
        </asp:Calendar> <br /> <br />

        <p><strong>City Fun</strong></p> <br /> <br />
        Cheap Hotels <asp:CheckBox id="hotels" runat="server" /> <br />
        Cheap Meals <asp:CheckBox ID="meals" runat="server" /> <br />
        Cheap Entertainment <asp:CheckBox ID="entertainment" runat="server" /> <br /> <br />
        <asp:RadioButtonList  id="radio1" runat="server">
            <asp:ListItem Text="Melbourne" />
            <asp:ListItem Text="Sydney" />
            <asp:ListItem Text="Brisbane" />
        </asp:RadioButtonList> <br /> <br />
        <asp:Button runat="server" Text="Find the Fun" onclick="fun"/> <br /> <br />
        <asp:Label ID="funlabel" runat="server" Visible="false" />
    </form>
</body>
</html>
