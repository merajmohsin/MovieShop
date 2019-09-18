<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GroupProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
     <style>
        #wrapper{
           width:70%;
            margin:auto;
           border-radius: 10px;
           text-align:center;
           
        }
        #Panel1{
            text-align:left;
            margin:10px;
            padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="bar" style="color:white;text-align:center;">
            <h1 style="text-align:center">Register- Movie Shop</h1>
        </div>
    <div id="wrapper" style="text-align:center;color: #000000;">
    
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid"  style="margin-left: 130px" Width="619px" BorderColor="#CCCCCC">
            <asp:Label ID="Label1" runat="server" Text="Personal Info" ForeColor="White"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Name:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtname" runat="server"></asp:TextBox>
&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtuser" ErrorMessage="Name is required" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Email:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox>
             &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Email is required" ForeColor="White"></asp:RequiredFieldValidator>
            &nbsp;<br />&nbsp;<br /><asp:Label ID="Label4" runat="server" ForeColor="White" Text="Phone:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtphone" runat="server" TextMode="Number"></asp:TextBox>
&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtphone" ErrorMessage="Phone is required" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="White" Text="Address:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtadd" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtadd" ErrorMessage="Address is required" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
&nbsp;<br />
            <asp:Label ID="Label6" runat="server" ForeColor="White" Text="Username:"></asp:Label>
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="lblmsg" runat="server" ForeColor="White"></asp:Label>
&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtuser" ErrorMessage="Username is required" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" ForeColor="White" Text="Password:"></asp:Label>
            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpass" ErrorMessage="Password is required" ForeColor="White"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" ForeColor="White" Text="Confirm Password:"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtcpass" runat="server" TextMode="Password"></asp:TextBox>
             <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpass" ControlToValidate="txtcpass" ErrorMessage="CompareValidator" ForeColor="White">Passwords should be matched</asp:CompareValidator>
            <br />
             </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid"  style="margin-left: 130px;text-align:left;" Width="619px" BorderColor="#CCCCCC" ForeColor="Black">
        <asp:Label ID="Label9" runat="server" Text="Credit Info" ForeColor="White"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" ForeColor="White" Text="CardHolder:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtcholder" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtcholder" ErrorMessage="Cardholder's Name is required" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label11" runat="server" ForeColor="White" Text="Card Number:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtcnumber" runat="server" TextMode="Number"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtcnumber" ErrorMessage="Card number is required" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label12" runat="server" ForeColor="White" Text="Code:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<asp:TextBox ID="txtccode" runat="server" TextMode="Number"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtccode" ErrorMessage="Card's Verification is required" ForeColor="White"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label13" runat="server" ForeColor="White" Text="Expiry Date:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtdate" ErrorMessage="Expiry date is required" ForeColor="White"></asp:RequiredFieldValidator>
        
    </asp:Panel>
        <br />
        <br />
        <asp:Button ID="Button1"  CssClass="btn btn-primary" runat="server" Text="Register" Height="70px" Width="130px" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2"  runat="server" CssClass="btn btn-primary" Height="70px" Text="Cancel" Width="130px" OnClick="Button2_Click" CausesValidation="False" />
        </div>
    </form>
</body>
</html>
