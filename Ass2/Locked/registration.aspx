<%@ Page Language="C#" MasterPageFile="~/Ass2/MasterPage.master" Title="Registration" Theme="SkinFile" %>

<script runat="server">

    protected void firstName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (firstNameBox.Text.Trim().Length >= 2)
        {
            args.IsValid = true;
            return;
        }
        else
        {
            return;
        }
    }

    protected void lastName_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (lastNameBox.Text.Trim().Length >= 2)
        {
            args.IsValid = true;
            return;
        }
        else
        {
            return;
        }
    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            customerDS.Insert();
            userInformation.Visible = true;
            firstNameLabel.Text = "<strong>First Name: </strong>" + firstNameBox.Text;
            lastNameLabel.Text = "<strong>Last Name: </strong>" + lastNameBox.Text;
            emailLabel.Text = "<strong>Email: </strong>" + emailBox1.Text;
            ageLabel.Text = "<strong>Age: </strong>" + ageBox.Text;
            genderLabel.Text = "<strong>Gender: </strong>" + genderList.SelectedItem.Text;
            stateLabel.Text = "<strong>State: </strong>" + stateList.SelectedItem.Text;
            ArrayList values = new ArrayList();
            hearLabel.Text = "<strong>Source: </strong>";
            foreach (int i in hearList.GetSelectedIndices()) 
            {
                hearLabel.Text += hearList.Items[i].Text + " ";
            }
            if (subscribeCheckBox.Checked) {
                subscribeLabel.Text = "<strong>Subscribed: </strong>" + subscribeCheckBox.Text;
            }
            else
            {
                subscribeLabel.Text = "<strong>Subscribed: </strong>No";
            }
        }
        else
        {
            userInformation.Visible = false;
        }
    }

    protected void emailCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        customerDS.SelectCommand = "SELECT * FROM [Customer] WHERE [email] = '" + emailBox1.Text + "'";
        GridView gv = new GridView();
        gv.DataSource = customerDS;
        gv.DataBind();
        if (gv.Rows.Count == 0)
        {
            args.IsValid = true;
            return;
        }
        else
        {
            return;
        }
    }

</script>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:AccessDataSource ID="customerDS" runat="server" DataFile="~/Ass2/Customers.accdb" 
        DeleteCommand="DELETE FROM [Customer] WHERE [customerID] = ?" 
        InsertCommand="INSERT INTO [Customer] ([firstname], [lastname], [email], [age], [gender], [state], [hear], [subscribe], [url]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [firstname] = ?, [lastname] = ?, [email] = ?, [age] = ?, [gender] = ?, [state] = ?, [hear] = ?, [subscribe] = ?, [url] = ? WHERE [customerID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="customerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="firstname" ControlID="firstNameBox" />
            <asp:ControlParameter Name="lastname" ControlID="lastNameBox" />
            <asp:ControlParameter Name="email" ControlID="emailBox1" />
            <asp:ControlParameter Name="age" ControlID="ageBox" />
            <asp:ControlParameter Name="gender" ControlID="genderList" />
            <asp:ControlParameter Name="state" ControlID="stateList" />
            <asp:ControlParameter Name="hear" ControlID="hearList" />
            <asp:ControlParameter Name="subscribe" ControlID="subscribeCheckBox" />
            <asp:Parameter Name="url" DefaultValue="http://www.google.com" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstname" Type="String" />
            <asp:Parameter Name="lastname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="hear" Type="String" />
            <asp:Parameter Name="subscribe" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="customerID" Type="Int32" />
        </UpdateParameters>

    </asp:AccessDataSource>
    <div class="text">       
         <h2>
            Registration
        </h2>
        <table id="table">
            <tr>
                <td>First Name: </td>
                <td><asp:TextBox ID="firstNameBox" runat="server" Columns="20" CausesValidation="true" /></td>
                <td>
                    <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="firstNameBox" runat="server"
                        ErrorMessage="*" />
                    <asp:CustomValidator ID="firstNameValidator" ControlToValidate="firstNameBox" runat="server" 
                    ErrorMessage="First name too short"  ForeColor="Red"
                    OnServerValidate="firstName_ServerValidate" />
                </td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td><asp:TextBox ID="lastNameBox" runat="server" Columns="20" /></td>
                <td><asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="lastNameBox" runat="server"
                        ErrorMessage="*" />
                    <asp:CustomValidator ID="lastValidator" ControlToValidate="lastNameBox" runat="server" 
                    ErrorMessage="Last name too short"  ForeColor="Red"
                    OnServerValidate="lastName_ServerValidate" />
                </td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><asp:TextBox ID="emailBox1" runat="server" Columns="20" /></td>
                <td><asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="emailBox1" runat="server"
                        ErrorMessage="*" />
                    <asp:RegularExpressionValidator ForeColor="Red" ControlToValidate="emailBox1" runat="server"
                        ErrorMessage="Invalid email address"
                        ValidationExpression=".*@.*\..*" />
                </td>
            </tr>
            <tr>
                <td></td><td><asp:CustomValidator ID="emailCustomValidator" ControlToValidate="emailBox1" runat="server"
                        ErrorMessage="Email already exists" ForeColor="Red"
                        OnServerValidate="emailCustomValidator_ServerValidate" /></td>
            </tr>
            <tr>
                <td>Confirm Email: </td>
                <td><asp:TextBox ID="emailBox2" runat="server" Columns="20" /></td>
                <td><asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="emailBox2" runat="server"
                        ErrorMessage="*" />
                    <asp:CompareValidator ForeColor="Red" ControlToValidate="emailBox2" ControlToCompare="emailBox1" runat="server"
                        ErrorMessage="Email addresses don't match" />
                </td>
            </tr>
            <tr>
                <td>Age: </td>
                <td><asp:TextBox ID="ageBox" runat="server" Columns="3" /></td>
                <td><asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="ageBox" runat="server"
                        ErrorMessage="*" />
                    <asp:RangeValidator ForeColor="Red" ControlToValidate="ageBox" runat="server" 
                        ErrorMessage="Invalid age" MinimumValue="5" MaximumValue="100" Type="Integer" />
                </td>
            </tr>
            <tr>
                <td>Gender: </td>
                <td><asp:RadioButtonList ID="genderList" runat="server">
                        <asp:ListItem Text="Male" Selected="True" />
                        <asp:ListItem Text="Female" />
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td>State: </td>
                <td><asp:DropDownList ID="stateList" runat="server">
                        <asp:ListItem Text="VIC" />
                        <asp:ListItem Text="NSW" />
                        <asp:ListItem Text="QLD" />
                        <asp:ListItem Text="NT" />
                        <asp:ListItem Text="WA" />
                        <asp:ListItem Text="SA" />
                        <asp:ListItem Text="ACT" />
                        <asp:ListItem Text="TAS" />
                    </asp:DropDownList> </td>
            </tr>
            <tr>
                <td>How did you hear about us? </td>
                <td><asp:ListBox ID="hearList" SelectionMode="Single" runat="server">
                        <asp:ListItem Text="Family/Friends" />
                        <asp:ListItem Text="Google" />
                        <asp:ListItem Text="Other" />
                    </asp:ListBox></td>
            </tr>
            <tr>
                <td>Subscribe to newsletter? </td>
                <td><asp:CheckBox ID="subscribeCheckBox" Text="Yes" runat="server" /></td>
            </tr>
            <tr>
                <td><span id="red">*</span> = Required Field</td>
                <td><asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" /></td>
            </tr>
        </table>
    </div>
    <asp:Panel ID="userInformation" CssClass="panel" Visible="false" runat="server">
        <h2>Registered Information:</h2>
        <asp:Label ID="firstNameLabel" runat="server" /> <br />
        <asp:Label ID="lastNameLabel" runat="server" /> <br />
        <asp:Label ID="emailLabel" runat="server" /> <br />
        <asp:Label ID="ageLabel" runat="server" /> <br />
        <asp:Label ID="genderLabel" runat="server" /> <br />
        <asp:Label ID="stateLabel" runat="server" /> <br />
        <asp:Label ID="hearLabel" runat="server" /> <br />
        <asp:Label ID="subscribeLabel" runat="server" /> <br />
        <asp:HyperLink ID="registrationSuccess" CssClass="links2" runat="server" NavigateUrl="http://www.google.com" Text="Click Here!" />
    </asp:Panel>
    <br /><a href="~/Ass2/Locked/displaycustomers.aspx" target="_black" runat="server"><input type="button" value="Click here to see all the customers" /></a> <br />
    <br /><a href="~/Ass2/Locked/searchcustomers.aspx" target="_black" runat="server"><input type="button" value="Click here to search for customers" /></a> <br />
    <br /><a href="~/Ass2/displaycode.aspx?filename=~/Ass2/Locked/registration.aspx" target="_blank" runat="server"><img src="../../Images/codebuttonAddRecords.jpg" /></a>
</asp:Content>
