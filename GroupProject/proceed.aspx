<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proceed.aspx.cs" Inherits="GroupProject.proceed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MasterPage/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <div id="bar" style="color:white;text-align:center;">
            <h1 style="color: #000000">Please confirm your address- Movie Shop</h1>
        </div>
    <div id="wrapper" style="padding-left:20%;">
    
        <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Name:"></asp:Label>
    
        <asp:TextBox ID="TextBox1" runat="server" Width="230px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Address:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="73px" Width="234px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" CssClass="a" runat="server" Height="78px" Text="Check Out" Width="134px" OnClick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
