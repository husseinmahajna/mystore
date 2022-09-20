<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsSell.aspx.cs" Inherits="ProductsSell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="css/productsview.css" />
    <link rel="stylesheet" href="css/productssell.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="pcont">
         <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="3">
        <ItemTemplate>
            <div class="template">
            <div class="imgdiv"> <asp:Image ID="p_image" runat="server" Width="350px" ImageUrl='<%# Eval("pimage") %>'  /></div>
                <div class="half">       
                    <div class="namediv"><asp:Label ID="p_name"  CssClass="pname" runat="server" Text='<%# Eval("product_name") %>' /></div>
                    <div class="pricediv">
                        <span id="sp1">
                            <asp:Label ID="p_price" CssClass="pprice" runat="server" Text='<%# Eval("price") %>' /><label class="pprice">$</label>
                        </span>
                        <span style="user-select:none">
                            <asp:Label ID="lbl_minus" onclick="minus(this.id)" runat="server" Text=""><i class="fa-solid fa-minus"></i></asp:Label>
                            <asp:Label ID="lbl_amount" CssClass="amount1" runat="server" Text="1"></asp:Label>
                          <asp:Label ID="lbl_plus" onclick="plus(this.id)"  runat="server" Text=""><i class="fa-solid fa-plus"></i></asp:Label>

                        </span>
                        <asp:Label ID="lbl_addtocart" onclick="addtocart(this.id)" runat="server" Text=""><i class="fa-solid fa-cart-shopping"></i></asp:Label> 
                    </div> 

                </div>

            </div>
     
        </ItemTemplate>
    </asp:DataList>

    </div>
    <asp:DataList ID="DataList2" CssClass="dtl2" runat="server" DataSourceID="SqlDataSource2" DataKeyField="code">
        <ItemTemplate>
            <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
            <asp:Label ID="codeLabel" runat="server" Text='<%# Eval("code") %>' />
        </ItemTemplate>
        </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [product_name], [pimage], [price] FROM [products]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [amount], [code] FROM [products]"></asp:SqlDataSource>
                <script src="js/sell.js"></script>

</asp:Content>

