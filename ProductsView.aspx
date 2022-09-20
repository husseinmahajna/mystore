<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsView.aspx.cs" Inherits="ProductsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/productsview.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="pcont">
         <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="3">
        <ItemTemplate>
            <div class="template">
            <div class="imgdiv"> <asp:Image ID="p_image" runat="server" Width="350px" ImageUrl='<%# Eval("pimage") %>'  /></div>
                <div class="half">       
                    <div class="namediv"><asp:Label ID="p_name"  CssClass="pname" runat="server" Text='<%# Eval("product_name") %>' /></div>
               <div class="pricediv">  <span id="sp1"><asp:Label ID="p_price" CssClass="pprice" runat="server" Text='<%# Eval("price") %>' /><label class="pprice">$</label></span>   </div> 

                </div>

            </div>
     
        </ItemTemplate>
    </asp:DataList>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [product_name], [pimage], [price] FROM [products]"></asp:SqlDataSource>
</asp:Content>

