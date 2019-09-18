<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="GroupProject.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="bar" style="text-align:center;">
            <h1 style="color: #000000">Administration- Movie Shop</h1>
        </div>
    <div id="wrapper" style="text-align:center; padding:20px">
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Username:"></asp:Label>
    &nbsp;&nbsp;
    <asp:TextBox ID="txtuser" runat="server" Width="123px"></asp:TextBox>
        <br />
        <br />
    <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Password:"></asp:Label>
    &nbsp;
    <asp:TextBox ID="txtpass"  runat="server" Width="126px" TextMode="Password" OnTextChanged="txtpass_TextChanged"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
    <asp:Button ID="Button1" CssClass="btn primary-btn" runat="server" Text="Log In" Height="64px" Width="125px" OnClick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" CssClass="btn primary-btn" runat="server" Text="Home" Height="64px" Width="125px" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:Label ID="lblmsg" runat="server" ForeColor="White"></asp:Label>
    </div>
    </form>
</body>
</html>
