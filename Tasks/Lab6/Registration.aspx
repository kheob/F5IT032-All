<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        First Name: <asp:TextBox id="name" runat="server" /> <br />
        <asp:RequiredFieldValidator ID="validateName" runat="server" 
            ErrorMessage="Please enter first name"
            ControlToValidate="name" ForeColor="Red"/> <br />

        Last Name: <asp:TextBox ID="surname" runat="server" /> <br />
        <asp:RequiredFieldValidator ID="validateSurname" runat="server"
            ErrorMessage="Please enter last name" 
            ControlToValidate="surname" ForeColor="Red" /> <br />

        Email: <asp:TextBox ID="email" runat="server" /> <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ErrorMessage="Please enter email" 
            ControlToValidate="email" ForeColor="Red" /> <br />
        <asp:RegularExpressionValidator ID="regexEmail" runat="server" 
            ControlToValidate="email"
            ErrorMessage="Not a real email"
            ValidationExpression=".*@.*\..*" forecolor="Red"/> <br />

        Re-Enter Email: <asp:TextBox ID="email2" runat="server" /> <br />
        <asp:RequiredFieldValidator ID="validateEmail2" runat="server"
            ErrorMessage="Please re-enter email" 
            ControlToValidate="email2" ForeColor="Red" /> <br />
        <asp:CompareValidator ID="compareEmail" runat="server"
            ErrorMessage="Email addresses don't match"
            ControlToValidate="email" ControlToCompare="email2" forecolor="Red"/> <br />

        Address: <asp:TextBox ID="address" runat="server" TextMode="MultiLine" Rows="5"  /> <br />
        <asp:RequiredFieldValidator ID="validateAddress" runat="server"
            ErrorMessage="Please enter an address"
            ControlToValidate="address" forecolor="Red"/> <br />

        Postcode: <asp:TextBox ID="postcode" runat="server" Columns="4" /> State: <asp:DropDownList ID="state" runat="server">
                                                                                    <asp:ListItem Text="VIC" />
                                                                                    <asp:ListItem Text="NSW" />
                                                                                    <asp:ListItem Text="QLD" />
                                                                                    <asp:ListItem Text="ACT" />
                                                                                    <asp:ListItem Text="SA" />
                                                                                    <asp:ListItem Text="TAS" />
                                                                                    <asp:ListItem Text="NT" />
                                                                                    <asp:ListItem Text="WA" />
                                                                                  </asp:DropDownList> <br />
        <asp:RequiredFieldValidator ID="validatePostcode" runat="server"
            ErrorMessage="Please enter a postcode"
            ControlToValidate="postcode" ForeColor="Red" /> <br />
        <asp:RangeValidator ID="rangePostcode" runat="server"
            ErrorMessage="Invalid postcode"
            ControlToValidate="postcode" minimumvalue="1000" maximumvalue="9999" type="Integer" forecolor="Red" /> <br />
        <asp:Button ID="submitButton" Text="Submit" runat="server" />
    </div>
    </form>
</body>
</html>
