<%@ Page Language="C#" MasterPageFile="~/Ass2/MasterPage.master" Title="Login" Theme="SkinFile" %>

<script language="C#" runat="server">

    protected void login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        userDS.SelectCommand = "SELECT * FROM [User] WHERE Username = '" + login.UserName +
            "' AND Password = '" + login.Password + "'";
        userDS.Select(DataSourceSelectArguments.Empty);
    }

    protected void userDS_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            FormsAuthentication.RedirectFromLoginPage(login.UserName, false);
        }
        else
        {
            login.FailureText = "Invalid login";
        }
    }
    
</script>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:AccessDataSource ID="userDS" runat="server" DataFile="~/Ass2/Users.accdb" OnSelected="userDS_Selected" />

    <h2>Login</h2>
    <div class="login">
        <asp:Login ID="login" runat="server" OnAuthenticate="login_Authenticate"
            TitleText="<p>Please login to continue</p>" 
            UserNameLabelText="Username: "
            UserNameRequiredErrorMessage="Username required"
            PasswordLabelText="Password: "
            PasswordRequiredErrorMessage="Password required"
            LoginButtonText="Login" DisplayRememberMe="false" >
        </asp:Login>
        <asp:ValidationSummary ID="loginValidationSummary" runat="server" Visible="true"
            ValidationGroup="login"
            HeaderText="Please correct the following errors: " />
    </div>
    <br /><a href="~/Ass2/displaycode.aspx?filename=~/login.aspx&filename2=~/Web.config&filename3=~/Ass2/Locked/Web.config" target="_blank" runat="server"><img src="Images/codebuttonlogin.jpg" /></a>
</asp:Content>