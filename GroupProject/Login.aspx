<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GroupProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
<link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="bar" style="color:white;text-align:center;">
            <h1 style="text-align:center">Log In</h1>
        </div>
    <div id="wrapper" style="text-align:center;padding:20px">
    
        <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Username:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtuser" runat="server" Width="125px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Password:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Width="124px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Log In" Height="64px" Width="115px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Register" Height="64px" Width="125px" OnClick="Button2_Click" />
        <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" Text="Cancel" Height="64px" Width="125px" OnClick="Button3_Click" />
        <br />
        <br />
        <asp:Label ID="lblmsg" runat="server" ForeColor="White"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
