<%@ Page Language="C#" MasterPageFile="~/Ass2/MasterPage.master" Title="Documentation" Theme="SkinFile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text">         
        <h2>
            Documentation
        </h2>
        <div id="documentation">
            <strong>Author: </strong>Bai Chan Kheo<br />
            <strong>Student ID: </strong>22262407<br />
            <strong>Unit: </strong>FIT5032 Internet Applications Development<br />
            <strong>Provider: </strong>Monash University, The Caulfield School of Information Technology<br />
            <strong>Assignment: </strong>2<br />
            <strong>Submission Date: </strong>Friday 9th October, 2015<br />
            <strong>Tutor's Name: </strong>Jian Liew<br />
            <strong>Email: </strong><a class="links" href="mailto:bckhe1@student.monash.edu">bckhe1@student.monash.edu</a><br />
            <strong>Assignment Specifications: </strong><a class="links" href="http://moodle.vle.monash.edu/mod/page/view.php?id=2639835">Link</a><br />
            <strong>Design Report: </strong><a class="links" href="DesignReport/DesignReport.pdf">Link</a>
        </div>
        <br /><a href="~/Ass2/displaycode.aspx?filename=~/Ass2/StyleSheet.css&filename2=~/Ass2/StyleSheet2.css" target="_blank" runat="server"><img src="../../Images/codebuttonCSS.jpg" /></a>
        <br /><a href="~/Ass2/displaycode.aspx?filename=~/App_Themes/SkinFile/SkinFile.skin" target="_blank" runat="server"><img src="../../Images/codebuttonSkin.jpg" /></a>
    </div>
</asp:Content>