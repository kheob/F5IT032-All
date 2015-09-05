<%@ Page language="c#" %>

<script runat="server">

protected void ValidateTravelData(object source, 
  ServerValidateEventArgs args) 
{ 
    // Since we have a bit to validate, 
   //assume that the entry is invalid....
 args.IsValid = false;
 DateTime departDate, returnDate; 
 feedbackLabel.ForeColor = System.Drawing.Color.Maroon;
 discountLabel.Visible = false;
 discountLabel.Text = "Since you have booked 30 days in advance you qualify for a 10% discount";
 try 
 { 
     departDate = DateTime.Parse(flightDepBox.Text); 
 } 
 catch (Exception ex) 
 { 
    feedbackLabel.Text = "Departure Date is invalid.<br /> " + 
      "Enter a valid date, for example: 05/12/2011"; 

    return; 
  }
  
  try 
  { 
    returnDate = DateTime.Parse(flightReturnBox.Text); 
  } 
  catch (Exception ex) 
  { 
    feedbackLabel.Text = "Return Date is invalid. <br />" + 
     "Enter a valid date, for example: 05/12/2011"; 
   
    return; 
  }
   
  // Verify that the departure date is less than the 
 // return date - no same day trips in this system!
 if (departDate >= returnDate) 
 { 
   feedbackLabel.Text = "The Departure Date must be " + 
     "earlier than the Return Date and no same-day " + 
     "returns for this travel package!"; 
  
   return; 
 }

 // Verify departure date is not in the past or today!
 if (departDate < DateTime.Now) 
 { 
   feedbackLabel.Text ="The Departure Date cannot " + 
     "be in the past or today!"; 
   
   return; 
 }

    // Everything is valid - set the IsValid flag...
    args.IsValid = true;
}

private void bookTheTripButton_Click(object sender,EventArgs e) 
{
  // Has the page been validated for all data entry?
  if (!(Page.IsValid)) 
  { 
    return; 
  }

  if (DateTime.Parse(flightReturnBox.Text) < DateTime.Parse(flightDepBox.Text).AddDays(6))
  {
      feedbackLabel.Text = "Sorry, you must go away for at least 7 days"; return;
  }
    
  DateTime departDate, returnDate; 
  departDate = DateTime.Parse(flightDepBox.Text); 
  returnDate = DateTime.Parse(flightReturnBox.Text); 
  feedbackLabel.Text = "Your flight from Morrabbin to Avalon " + 
    "will depart on " + departDate.ToLongDateString() + 
    " and return on " + returnDate.ToLongDateString();

  if (departDate >= DateTime.Now.AddDays(30))
  {
      if (departDate >= DateTime.Parse("10/10/2020") && returnDate <= DateTime.Parse("20/10/2020"))
      {
          discountLabel.Text = "Since you booked tickets within our special offer period you qualify for a 15% discount";
      }
      discountLabel.Visible = true;
  }
  else
  {
      discountLabel.Visible = false;
  }
}
</script>

<html>
  <head>
    <title>Validation Example</title>
    <link href="Style1.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
    
    <form id="TravelForm" method="post" runat="server">

    <asp:panel id="Panel" runat="server" CssClass="pnlNearMiss" 
     ToolTip = "On special this month">

        <br /><h3>Near Miss Airlines</h3>
        <h4>Flight 007: Morrabbin to Avalon</h4>
        <p>
            Fly between 10/10/2020 and 20/10/2020 (inclusive) for 15% discount <br /> Maximum of 5 tickets per customer.   
        </p>


        <table>
        <tr>
            <td>Departure Date:</td>
            <td>
                <asp:TextBox id="flightDepBox" runat="server" 
                  Width="80px" Height="22px"/>
                <br /></td>     
        </tr>
        <tr>
            <td>Return Date:</td>
            <td>
                <asp:TextBox id="flightReturnBox" runat="server" 
                  Width="80px" Height="22px"/>
                <br />
            </td>
        </tr>
        <tr>
            <td>Number of tickets:</td>
            <td>
                <asp:TextBox id="ticketBox" runat="server" 
                  Width="40px" Height="22px"/>
                <br />
            </td>
        </tr>
        
        <tr>
            <td>Email:</td>
            <td>
                <asp:TextBox id="txtEmail" runat="server" 
                  Width="200px" Height="22px"/>
                <br />
            </td>
        </tr>
        </table>
    
        <asp:CustomValidator id="vldFlightDates" runat="server" 
          ControlToValidate="flightDepBox" 
          OnServerValidate="ValidateTravelData" />
        <br />

        <asp:RequiredFieldValidator id="vldDepDate" runat="server" 
          ErrorMessage= "Please enter a valid Departure Date" 
          ControlToValidate="flightDepBox" />
        <br />

        <asp:RequiredFieldValidator id="vldRetDate" runat="server" 
          ErrorMessage= "Please enter a valid Return Date" 
          ControlToValidate="flightReturnBox" />
        <br />

        <asp:RangeValidator ID="ticketRange" runat="server"
            ErrorMessage="During the special offer period, a maximum of 5 tickets per customer applies"
            ControlToValidate="ticketBox" MinimumValue="1" MaximumValue="5" Type="Integer" />

        <asp:RegularExpressionValidator id="validateEmail" 
          runat="server" ControlToValidate="txtEmail"
          ValidationExpression = ".*@.*\..*"
          ErrorMessage="Invalid email" Display="dynamic" />
        <br />

        <asp:Button id="bookTheTripButton" runat="server" 
          Text="Confirm flight dates"          
          OnClick="bookTheTripButton_Click" />
        <p />

        <asp:Label id="feedbackLabel" runat="server" 
          Text="Please enter your dates, 
          then click the button" />
        <br />
        <asp:Label ID="discountLabel" runat="server" Visible="false" />
        <p />     

    </asp:panel>
    </form>
  </body>
</html>