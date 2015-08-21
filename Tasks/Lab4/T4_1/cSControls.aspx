<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void addButton_Click(object sender, EventArgs e)
    {
        float first = float.Parse(firstNumberBox.Text);
        float second = float.Parse(secondNumberBox.Text);
        if (radioButtonList.SelectedIndex == 0)
        {
            resultsLabel.Text = "Sum of the numbers: " + (first + second);
            resultsLabel.Visible = true;
        }
        if (radioButtonList.SelectedIndex == 1)
        {
            resultsLabel.Text = "Difference of the numbers: " + (first - second);
            resultsLabel.Visible = true;
        }
        
    }

    protected void discountButton_Click(object sender, EventArgs e)
    {
        float price = float.Parse(amountBox.Text);
        float disc = float.Parse(discountBox.Text);
        discountResults.Text = "Discount price: $" + (price * (100 - disc)/100);
        discountResults.Visible = true;
    }

    protected void calculateButton_Click(object sender, EventArgs e)
    {
        calculateResults.Text = "";
        if (firstNumber2Box.Text == "" || secondNumber2Box.Text == "") 
        {
            calculateResults.Text = "Please input numbers in both fields <br />";
            calculateResults.Visible = true;
        }
        else
        {
            float first2 = float.Parse(firstNumber2Box.Text);
            float second2 = float.Parse(secondNumber2Box.Text);

            if (operatorList.Items[0].Selected)
            {
                calculateResults.Text += "Addition: " + (first2 + second2) + "<br />";
            }
            if (operatorList.Items[1].Selected)
            {
                calculateResults.Text += "Subtraction: " + (first2 - second2) + "<br />";
            }
            if (operatorList.Items[2].Selected)
            {
                calculateResults.Text += "Multiplication: " + (first2 * second2) + "<br />";
            }
            if (operatorList.SelectedIndex == -1)
            {
                calculateResults.Text += "No calculation has been performed <br />";
            }
            calculateResults.Visible = true;
        }
    }

    protected void TempButton_Click(object sender, EventArgs e)
    {
        if (convertBox.Text == "")
        {
            TempResults.Text = "Please input a number in the field";
            TempResults.Visible = true;
        }
        else
        {
            float temp = float.Parse(convertBox.Text);
            if (DDL1.SelectedIndex == 0)
            {
                if (DDL2.SelectedIndex == 0)
                {
                    TempResults.Text = DDL2.SelectedValue + ": " + (temp);
                }
                else
                {
                    TempResults.Text = DDL2.SelectedValue + ": " + ((temp - 32.0) * (5.0/9.0));
                }
            }
            else
            {
                if (DDL2.SelectedIndex == 0)
                {
                    TempResults.Text = DDL2.SelectedValue + ": " + ((temp / (5.0/9.0)) + 32.0);
                }
                else
                {
                    TempResults.Text = DDL2.SelectedValue + ": " + (temp);
                }
            }
            TempResults.Visible = true;
        }
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        div {
            padding: 10px;
        }
        .calcResults {
            background-color: black;
            color: white;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="firstNumber" runat="server" Text="Please enter first name: " />
        <asp:TextBox ID="firstNumberBox" runat="server" Columns="25" />
        <br />
        <asp:Label ID="secondNumber" runat="server" Text="Please enter second number: " />
        <asp:TextBox ID="secondNumberBox" runat="server" Columns="25" />
        <br />
        <asp:RadioButtonList ID="radioButtonList" runat="server">
            <asp:ListItem Text="Addition" />
            <asp:ListItem Text="Subtraction" />
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="addButton" runat="server" OnClick="addButton_Click" Text="Process my numbers" />
        <br />
        <asp:Label ID="resultsLabel" runat="server" Visible ="false" />
    </div>
    <div>
        <asp:Label ID="amount" runat="server" Text="Please enter the amount ($): " />
        <asp:TextBox ID="amountBox" runat="server" Columns="25" />
        <br />
        <asp:Label ID="discount" runat="server" Text="Please enter the discount (%): " />
        <asp:TextBox ID="discountBox" runat="server" Columns="25" />
        <br />
        <asp:Button ID="discountButton" runat="server" Text="Calculate new price" OnClick="discountButton_Click" />
        <br />
        <asp:Label ID="discountResults" runat="server" Visible="false" />
    </div>
    <div>
        <asp:Label id="firstNumber2" runat="server" Text="Please enter the first number:" /> <br />
        <asp:TextBox ID="firstNumber2Box" runat="server" Columns="25" /> <br /> <br />
        <asp:Label ID="secondNumber2" runat="server" Text="Please enter the second number:" /> <br />
        <asp:TextBox ID="secondNumber2Box" runat="server" Columns="25" /> <br /> <br />
        <asp:ListBox ID="operatorList" runat="server" SelectionMode="Multiple">
            <asp:ListItem Text="Add" />
            <asp:ListItem Text="Subtract" />
            <asp:ListItem Text="Multiply" />
        </asp:ListBox> <br /> <br />
        <asp:Button ID="calculateButton" Text="Calculate" runat="server" OnClick="calculateButton_Click" /> <br /> <br />
        <asp:Label ID="calculateResults" cssclass="calcResults" runat="server" visible="false" />
    </div>
    <div>
        <asp:Label ID="convertLabel" runat="server" Text="Convert: " /> <br />
        <asp:TextBox ID="convertBox" runat="server" Columns="10" />
        <asp:DropDownList ID="DDL1" runat="server">
            <asp:ListItem Text="Fahrenheit" />
            <asp:ListItem Text="Celsius" />
        </asp:DropDownList>
         to 
        <asp:DropDownList ID="DDL2" runat="server">
            <asp:ListItem Text="Fahrenheit" />
            <asp:ListItem Text="Celsius" />
        </asp:DropDownList> <br />
        <asp:Button ID="TempButton" runat="server" Text="Calculate" OnClick="TempButton_Click" /> <br />
        <asp:Label ID="TempResults" runat="server" Visible="false" /> <br />
    </div>
    </form>
</body>
</html>
