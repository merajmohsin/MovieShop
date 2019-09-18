<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mainadmin.aspx.cs" Inherits="GroupProject.mainadmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MasterPage/Style.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
         <div id="main-nav">
                <ul>
                  <li><asp:Button CssClass="btn btn-primary" ID="btnhome" runat="server" Text="Home" OnClick="btnhome_Click" />
                        </li>
                    <li><asp:Button CssClass="btn btn-primary" ID="btnorder" runat="server" Text="Orders" OnClick="btnorder_Click" /></li>
                    <li><asp:Button CssClass="btn btn-primary" ID="btninventory" runat="server" Text="Inventory" OnClick="btninventory_Click" /></li>
                    <li><asp:Button CssClass="btn btn-primary" ID="btnadmins" runat="server" Text="Add admins" OnClick="btnadmins_Click"/></li>
                </ul>
            </div><br /><br />
         <asp:GridView ID="GridView1" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False" DataKeyNames="Orderno" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowCommand="GridView1_RowCommand" Height="186px" Width="782px">
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" />
                 <asp:BoundField DataField="Orderno" HeaderText="Orderno" InsertVisible="False" ReadOnly="True" SortExpression="Orderno" />
                 <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" SortExpression="ItemNo" />
                 <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                 <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" SortExpression="ShippingAddress" />
                 <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                 <asp:BoundField DataField="Shipped" HeaderText="Shipped" SortExpression="Shipped" />
                 <asp:ButtonField CommandName="Insert" Text="Insert" />
             </Columns>
             <EmptyDataTemplate>
                 <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Orderno" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" OnItemCommand="DetailsView2_ItemCommand" OnItemInserted="DetailsView2_ItemInserted" OnModeChanging="DetailsView2_ModeChanging" Width="125px">
                     <Fields>
                         <asp:BoundField DataField="Orderno" HeaderText="Orderno" InsertVisible="False" ReadOnly="True" SortExpression="Orderno" />
                         <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" SortExpression="ItemNo" />
                         <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                         <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" SortExpression="ShippingAddress" />
                         <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                         <asp:BoundField DataField="Shipped" HeaderText="Shipped" SortExpression="Shipped" />
                         <asp:CommandField ShowInsertButton="True" />
                     </Fields>
                 </asp:DetailsView>
             </EmptyDataTemplate>
             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#FFF1D4" />
             <SortedAscendingHeaderStyle BackColor="#B95C30" />
             <SortedDescendingCellStyle BackColor="#F1E5CE" />
             <SortedDescendingHeaderStyle BackColor="#93451F" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:grpDatabase %>" SelectCommand="SELECT * FROM [tblOrders]" DeleteCommand="DELETE FROM [tblOrders] WHERE [Orderno] = @Orderno" InsertCommand="INSERT INTO [tblOrders] ([ItemNo], [Username], [ShippingAddress], [Cost], [Shipped]) VALUES (@ItemNo, @Username, @ShippingAddress, @Cost, @Shipped)" UpdateCommand="UPDATE [tblOrders] SET [ItemNo] = @ItemNo, [Username] = @Username, [ShippingAddress] = @ShippingAddress, [Cost] = @Cost, [Shipped] = @Shipped WHERE [Orderno] = @Orderno">
             <DeleteParameters>
                 <asp:Parameter Name="Orderno" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="ItemNo" Type="Int32" />
                 <asp:Parameter Name="Username" Type="String" />
                 <asp:Parameter Name="ShippingAddress" Type="String" />
                 <asp:Parameter Name="Cost" Type="Decimal" />
                 <asp:Parameter Name="Shipped" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="ItemNo" Type="Int32" />
                 <asp:Parameter Name="Username" Type="String" />
                 <asp:Parameter Name="ShippingAddress" Type="String" />
                 <asp:Parameter Name="Cost" Type="Decimal" />
                 <asp:Parameter Name="Shipped" Type="String" />
                 <asp:Parameter Name="Orderno" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ItemNo" DataSourceID="SqlDataSource2" OnRowCommand="GridView2_RowCommand" OnRowCreated="GridView2_RowCreated" Visible="False" Height="135px" Width="784px">
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                 <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" ReadOnly="True" SortExpression="ItemNo" />
                 <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                 <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                 <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                 <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                 <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                 <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                 <asp:ButtonField CommandName="Insert" Text="Insert" />
             </Columns>
             <EmptyDataTemplate>
                 <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataKeyNames="ItemNo" DataSourceID="SqlDataSource2" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView4_ItemInserted" OnModeChanging="DetailsView4_ModeChanging" Width="125px">
                     <Fields>
                         <asp:BoundField DataField="ItemNo" HeaderText="ItemNo" ReadOnly="True" SortExpression="ItemNo" />
                         <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                         <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                         <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                         <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                         <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                         <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                         <asp:CommandField ShowInsertButton="True" />
                     </Fields>
                 </asp:DetailsView>
             </EmptyDataTemplate>
             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#FFF1D4" />
             <SortedAscendingHeaderStyle BackColor="#B95C30" />
             <SortedDescendingCellStyle BackColor="#F1E5CE" />
             <SortedDescendingHeaderStyle BackColor="#93451F" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:grpDatabase %>" DeleteCommand="DELETE FROM [tblItems] WHERE [ItemNo] = @ItemNo" InsertCommand="INSERT INTO [tblItems] ([ItemNo], [Name], [Description], [Price], [Image], [Quantity], [Category]) VALUES (@ItemNo, @Name, @Description, @Price, @Image, @Quantity, @Category)" SelectCommand="SELECT * FROM [tblItems]" UpdateCommand="UPDATE [tblItems] SET [Name] = @Name, [Description] = @Description, [Price] = @Price, [Image] = @Image, [Quantity] = @Quantity, [Category] = @Category WHERE [ItemNo] = @ItemNo">
             <DeleteParameters>
                 <asp:Parameter Name="ItemNo" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="ItemNo" Type="Int32" />
                 <asp:Parameter Name="Name" Type="String" />
                 <asp:Parameter Name="Description" Type="String" />
                 <asp:Parameter Name="Price" Type="Decimal" />
                 <asp:Parameter Name="Image" Type="String" />
                 <asp:Parameter Name="Quantity" Type="Decimal" />
                 <asp:Parameter Name="Category" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Name" Type="String" />
                 <asp:Parameter Name="Description" Type="String" />
                 <asp:Parameter Name="Price" Type="Decimal" />
                 <asp:Parameter Name="Image" Type="String" />
                 <asp:Parameter Name="Quantity" Type="Decimal" />
                 <asp:Parameter Name="Category" Type="String" />
                 <asp:Parameter Name="ItemNo" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         <br />
         <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Username" DataSourceID="SqlDataSource3" OnRowCommand="GridView3_RowCommand" Visible="False">
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                 <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                 <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                 <asp:ButtonField CommandName="Insert" Text="Insert" />
             </Columns>
             <EmptyDataTemplate>
                 <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="Username" DataSourceID="SqlDataSource3" DefaultMode="Insert" Height="50px" OnItemInserted="DetailsView3_ItemInserted" OnModeChanging="DetailsView3_ModeChanging" Width="125px">
                     <Fields>
                         <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                         <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                         <asp:CommandField ShowInsertButton="True" />
                     </Fields>
                 </asp:DetailsView>
             </EmptyDataTemplate>
             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#FFF1D4" />
             <SortedAscendingHeaderStyle BackColor="#B95C30" />
             <SortedDescendingCellStyle BackColor="#F1E5CE" />
             <SortedDescendingHeaderStyle BackColor="#93451F" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:grpDatabase %>" DeleteCommand="DELETE FROM [tbladmins] WHERE [Username] = @Username" InsertCommand="INSERT INTO [tbladmins] ([Username], [Password]) VALUES (@Username, @Password)" SelectCommand="SELECT * FROM [tbladmins]" UpdateCommand="UPDATE [tbladmins] SET [Password] = @Password WHERE [Username] = @Username">
             <DeleteParameters>
                 <asp:Parameter Name="Username" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Username" Type="String" />
                 <asp:Parameter Name="Password" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Password" Type="String" />
                 <asp:Parameter Name="Username" Type="String" />
             </UpdateParameters>
         </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
