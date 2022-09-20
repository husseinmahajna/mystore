<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrdersManagment.aspx.cs" Inherits="OrdersManagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <link rel="stylesheet" href="css/productmanagment.css"/>

    <style>
             .container .test div{
            display: flex;
    justify-content: center;
    padding: 80px 40px;
    }
    table{
        width:100%;
        text-align:center;
    }
    table a {
        text-decoration:none;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="gdv_order" runat="server" AutoGenerateColumns="False"  HeaderStyle-CssClass="header" DataKeyNames="oNum" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="oNum" HeaderText="OrderNumber" InsertVisible="False" ReadOnly="True" SortExpression="oNum" />
            <asp:BoundField DataField="orderdate" HeaderText="Date" SortExpression="orderdate" />
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
            <asp:BoundField DataField="orderTotalPrice" HeaderText="TotalPrice" SortExpression="orderTotalPrice" />
            <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
            <asp:CommandField ShowEditButton="True" ControlStyle-ForeColor="Green" ControlStyle-CssClass="fa-solid fa-pen-to-square" />
       
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [orders] WHERE [oNum] = ?" InsertCommand="INSERT INTO [orders] ([oNum], [orderdate], [status], [orderTotalPrice], [userid]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [orders] ORDER BY [status] DESC, [orderdate]" UpdateCommand="UPDATE [orders] SET [orderdate] = ?, [status] = ?, [orderTotalPrice] = ?, [userid] = ? WHERE [oNum] = ?">
        <DeleteParameters>
            <asp:Parameter Name="oNum" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="oNum" Type="Int32" />
            <asp:Parameter Name="orderdate" Type="DateTime" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="orderTotalPrice" Type="String" />
            <asp:Parameter Name="userid" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="orderdate" Type="DateTime" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="orderTotalPrice" Type="String" />
            <asp:Parameter Name="userid" Type="Int32" />
            <asp:Parameter Name="oNum" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

