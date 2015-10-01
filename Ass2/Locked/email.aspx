<%@ Page Language="C#" MasterPageFile="~/Ass2/MasterPage.master" Title="Send an Email" Theme="SkinFile" %>

<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>

<script runat="server">

    protected void emailButton_Click(object sender, EventArgs e)
    {
        MailMessage message = new MailMessage();
        foreach (GridViewRow row in customerGV.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("emailCheckBox");

            if (checkbox != null && checkbox.Checked)
            {
                message.To.Add(new MailAddress(row.Cells[3].Text, row.Cells[1].Text + " " + row.Cells[2].Text));
            }
        }

        message.From = new MailAddress("administrator@quotees.com.au", "Administrator");
        message.Subject = subjectBox.Text;
        message.Body = messageBox.Text;

        try
        {
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.monash.edu.au";
            client.Port = 25;
            client.Send(message);
            emailLabel.Text = "Message sent.";
        }
        catch (Exception ex)
        {
            emailLabel.Text = ex.Message;
        }
    }
</script>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:AccessDataSource ID="customerDS" runat="server" DataFile="~/Ass2/Customers.accdb"
        SelectCommand="SELECT [customerID], [firstname], [lastname], [email] FROM [Customer]" />

    <h2>Send an Email</h2>
    <p>Select email recipients from the list below: </p>
    <asp:GridView ID="customerGV" SkinID="SkinFile" runat="server" DataSourceID="customerDS" DataKeyNames="customerID"
        AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="customerID" Visible="false" />
            <asp:BoundField DataField="firstname" HeaderText="First Name" />
            <asp:BoundField DataField="lastname" HeaderText="Last Name" />
            <asp:BoundField DataField="email" HeaderText="Email Address" />
            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="emailCheckBox" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <div>
        <table id="emailTable">
            <tr>
                <td>From: </td>
                <td>Quotee's</td>
            </tr>
            <tr>
                <td>Subject: </td>
                <td><asp:TextBox runat="server" ID="subjectBox" SkinID="SkinFile" /></td>
            </tr>
            <tr>
                <td>Message: </td>
                <td><asp:TextBox runat="server" ID="messageBox" SkinID="SkinFile" Rows="15" TextMode="MultiLine" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="emailButton" runat="server" Text="Send" OnClick="emailButton_Click" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Label ID="emailLabel" runat="server" /></td>
            </tr>
        </table>
    </div>
    <br /><a href="~/Ass2/displaycode.aspx?filename=~/Ass2/Locked/email.aspx" target="_blank" runat="server"><img src="../../Images/codebuttonEmail.jpg" /></a>
</asp:Content>