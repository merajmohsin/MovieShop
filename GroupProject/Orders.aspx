<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="GroupProject.Orders" %>

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
           padding-left:150px;

        }
        #GridView1
        {
           // width:700px;
            //text-align:center;
           // al

            
        }
        #button1{
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="bar" style="text-align:center;">
            <h1>Your Orders</h1>
        </div>
    <div id="wrapper" style="text-align:center;" >
    
        <asp:GridView ID="GridView1" CssClass="table table-dark" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="Orderno" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle cssClass="table table-dark" />
            <Columns>
                <asp:BoundField DataField="Orderno" HeaderText="Orderno" InsertVisible="False" ReadOnly="True" SortExpression="Orderno" />
                <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" SortExpression="ItemNo" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" SortExpression="ShippingAddress" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                <asp:BoundField DataField="Shipped" HeaderText="Shipped" SortExpression="Shipped" />
            </Columns>
            
            <HeaderStyle BackColor="white" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:grpDatabase %>" SelectCommand="SELECT * FROM [tblOrders] WHERE ([Username] = @Username)">
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="user" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Home" align="center" OnClick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
