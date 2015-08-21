<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    string[] cities = {"Singapore", "Melbourne", "Sydney", "Kuala Lumpur", "Bangkok"};
    void Page_load()
    {
        CityList.Text = "";
        foreach (string city in cities)
        {
            CityList.Text += city + "<br />";
        }

        Random random = new Random();
        int total = 0;
        const int MAX = 100;
        diceRolls.Text = "";
        while (total <= MAX)
        {
            int temp = random.Next(7);
            total += (5 * temp);
            diceRolls.Text += "Rolled a: " + temp + " and the total so far = " + total + "<br />";
        }

        if (Page.IsPostBack)
        {
            timesLabel.Visible = true;
        }
    }

    protected void CityChoiceButton_Click(object sender, EventArgs e)
    {
        int cityNumber = int.Parse(CityRBL.SelectedValue);
        CityChoice.Text = "You selected " + cities[cityNumber - 1];
        CityChoice.Visible = true;
    }

    protected void randomButton_Click(object sender, EventArgs e)
    {
        randomNumbers.Text = "";
        Random random = new Random();
        randomNumbers.Text = generateRandom(generateAmount.SelectedIndex + 1);
        randomNumbers.Visible = true;
    }

    protected void guessButton_Click(object sender, EventArgs e)
    {
        Random random = new Random();
        int computerGuess = random.Next(6);
        if ((guessRandom.SelectedIndex + 1) == computerGuess)
        {
            guessResults.Text = generateRandom(computerGuess);
        }
        else
        {
            guessResults.Text = "Wrong guess, try again, the number was " + computerGuess;
        }
        guessResults.Visible = true;
    }
    
    private string generateRandom(int amount) {
        Random random = new Random();
        string randomNumbers = "";
        for (int i = 0; i < amount; i++)
        {
            randomNumbers += random.Next(101) + " ";
        }
        return randomNumbers;
    }

    protected void timesButtton_Click(object sender, EventArgs e)
    {
        timesLabel.Text = "";
        int times;
        if (timesDDL.SelectedIndex == 0)
        {
            times = 5;
        }
        else
        {
            times = 10;
        }
        for (int i = 0; i < times; i++)
        {
            timesLabel.Text += timesBox.Text + "<br />";
        }
    }

    private bool isPrime(int number)
    {
        bool isPrime = true;
        if (number == 2)
            return isPrime;
        for (int i = 2; i <= (number/2); i++)
        {
            if (number % i == 0)
                isPrime = false;
        }
        return isPrime;
    }

    protected void primeButton_Click(object sender, EventArgs e)
    {
        if (isPrime(int.Parse(primeBox.Text)))
            primeResults.Text = primeBox.Text + " is a prime";
        else
            primeResults.Text = primeBox.Text + " is not a prime";
        primeResults.Visible = true;
    }

    protected void leapYearButton_Click(object sender, EventArgs e)
    {
        if (isLeapYear(int.Parse(leapYearBox.Text)))
        {
            leapYearLabel.Text = "Year <strong>" + leapYearBox.Text + "</strong> is a Leap Year.";
        }
        else
        {
            leapYearLabel.Text = "Year <strong>" + leapYearBox.Text + "</strong> is <strong>NOT</strong> a Leap Year.";
        }
        leapYearLabel.Visible = true;
    }

    private bool isLeapYear(int year)
    {
        bool leapYear = false;
        if (year % 100 == 0)
        {
            if (year % 400 == 0)
                leapYear = true;
        }
        else if (year % 4 == 0)
            leapYear = true;
        return leapYear;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        div {
            padding: 5px;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" Text="Select from our special discount destinations:" /> <br />
        <asp:Label ID="CityList" runat="server" /> <br />
        <asp:RadioButtonList ID="CityRBL" runat="server">
            <asp:ListItem Text="1" />
            <asp:ListItem Text="2" />
            <asp:ListItem Text="3" />
            <asp:ListItem Text="4" />
            <asp:ListItem Text="5" />
        </asp:RadioButtonList> <br />
        <asp:Button ID="CityChoiceButton" runat="server" OnClick="CityChoiceButton_Click" Text="Submit Choice" /> <br />
        <asp:Label ID="CityChoice" runat="server" Visible="false" />
    </div>
    <div>
        Enter the number of random numbers: <br />
        <asp:DropDownList ID="generateAmount" runat="server">
            <asp:ListItem Text="1" />
            <asp:ListItem Text="2" />
            <asp:ListItem Text="3" />
            <asp:ListItem Text="4" />
            <asp:ListItem Text="5" />
            <asp:ListItem Text="6" />
            <asp:ListItem Text="7" />
            <asp:ListItem Text="8" />
            <asp:ListItem Text="9" />
            <asp:ListItem Text="10" />
        </asp:DropDownList> <br />
        <asp:Button ID="randomButton" runat="server" Text="Submit Query" OnClick="randomButton_Click" /> <br />
        <asp:Label ID="randomNumbers" runat="server" Visible="false" />
    </div>
    <div>
        Guess how many random numbers: <br />
        <asp:DropDownList ID="guessRandom" runat="server">
            <asp:ListItem Text="1" />
            <asp:ListItem Text="2" />
            <asp:ListItem Text="3" />
            <asp:ListItem Text="4" />
            <asp:ListItem Text="5" />
        </asp:DropDownList> <br />
        <asp:Button ID="guessButton" runat="server" Text="Submit Query" OnClick="guessButton_Click" /> <br />
        <asp:Label ID="guessResults" runat="server" Visible="false" />
    </div>
    <div>
        <asp:Label ID="diceRolls" runat="server" />
    </div>
    <div>
        <asp:TextBox ID="timesBox" runat="server" Columns="25" /> <br />
        <asp:DropDownList ID="timesDDL" runat="server">
            <asp:ListItem text="5 times" />
            <asp:ListItem Text="10 times" />
        </asp:DropDownList>
        <asp:Button ID="timesButtton" runat="server" Text="Display" OnClick="timesButtton_Click" /> <br />
        <asp:Label ID="timesLabel" runat="server" />
    </div>
    <div>
        Check if prime: <br />
        <asp:TextBox ID="primeBox" runat="server" Columns="9" MaxLength="9" /> <br />
        <asp:Button ID="primeButton" runat="server" Text="Submit" OnClick="primeButton_Click" /> <br />
        <asp:Label ID="primeResults" runat="server" Visible="false" />
    </div>
    <div>
        <strong>Leap Year Judgement</strong> <br />
        Please enter the year: <br />
        <asp:TextBox ID="leapYearBox" runat="server" Columns="25" /> <br />
        <asp:Button id="leapYearButton" runat="server" text="Leap Year Judge" OnClick="leapYearButton_Click" /> <br />
        <asp:Label ID="leapYearLabel" runat="server" Visible="false" />
    </div>
    </form>
</body>
</html>
