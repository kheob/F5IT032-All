<%@ Page Language="C#" MasterPageFile="~/Ass1/MasterPage.master" Title="Registration" Theme="SkinFile" %>

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
</script>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                        ErrorMessage="invalid email address"
                        ValidationExpression=".*@.*\..*" />
                </td>
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
                <td><asp:ListBox ID="hearList" SelectionMode="Multiple" runat="server">
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
</asp:Content>
