<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserOrders.aspx.cs" Inherits="UserOrders" %>

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
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="gdv_orders" HeaderStyle-CssClass="header" runat="server"></asp:GridView>
</asp:Content>

