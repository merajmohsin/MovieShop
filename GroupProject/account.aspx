<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="GroupProject.account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MasterPage/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <div id="bar" style="color:white;text-align:center;">
            <h1 style="color: #000000">Your Account- Movie Shop</h1>
        </div>
    <div id = "wrapper" style="text-align:center;" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Username" DataSourceID="SqlDataSource1" Height="89px" Width="694px">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:grpDatabase %>" DeleteCommand="DELETE FROM [tblUsers] WHERE [Username] = @Username" InsertCommand="INSERT INTO [tblUsers] ([Name], [Email], [Phone], [Address], [Username]) VALUES (@Name, @Email, @Phone, @Address, @Username)" SelectCommand="SELECT [Name], [Email], [Phone], [Address], [Username] FROM [tblUsers] WHERE ([Username] = @Username)" UpdateCommand="UPDATE [tblUsers] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone, [Address] = @Address WHERE [Username] = @Username">
            <DeleteParameters>
                <asp:Parameter Name="Username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="Decimal" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="user" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Phone" Type="Decimal" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Username" DataSourceID="SqlDataSource2" Height="16px" Width="702px">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="CardHolder" HeaderText="CardHolder" SortExpression="CardHolder" />
                <asp:BoundField DataField="CardNumber" HeaderText="CardNumber" SortExpression="CardNumber" />
                <asp:BoundField DataField="VerificationCode" HeaderText="VerificationCode" SortExpression="VerificationCode" />
                <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:grpDatabase %>" DeleteCommand="DELETE FROM [tblCreditInfo] WHERE [Username] = @Username" InsertCommand="INSERT INTO [tblCreditInfo] ([Username], [CardHolder], [CardNumber], [VerificationCode], [ExpiryDate]) VALUES (@Username, @CardHolder, @CardNumber, @VerificationCode, @ExpiryDate)" SelectCommand="SELECT * FROM [tblCreditInfo] WHERE ([Username] = @Username)" UpdateCommand="UPDATE [tblCreditInfo] SET [CardHolder] = @CardHolder, [CardNumber] = @CardNumber, [VerificationCode] = @VerificationCode, [ExpiryDate] = @ExpiryDate WHERE [Username] = @Username">
            <DeleteParameters>
                <asp:Parameter Name="Username" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="CardHolder" Type="String" />
                <asp:Parameter Name="CardNumber" Type="Decimal" />
                <asp:Parameter Name="VerificationCode" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="ExpiryDate" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="user" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CardHolder" Type="String" />
                <asp:Parameter Name="CardNumber" Type="Decimal" />
                <asp:Parameter Name="VerificationCode" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="ExpiryDate" />
                <asp:Parameter Name="Username" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="a" Height="60px" OnClick="Button1_Click" Text="Home" Width="153px" />
    </div>
    </form>
</body>
</html>
