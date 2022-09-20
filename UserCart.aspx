<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserCart.aspx.cs" Inherits="UserCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/cart.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="pcont">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="pNum" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="template">
                    <div class="half1">
                 <div class="imgdiv"><asp:Image ID="pimg" CssClass="pimage" runat="server" ImageUrl='<%# Eval("pImage") %>' /> </div>
                        <div class="namediv">
                           <span><label>#</label><asp:Label ID="pNumLabel" runat="server" Text='<%# Eval("pNum") %>' />      </span>
                            <asp:Label ID="pNameLabel" CssClass="name" runat="server" Text='<%# Eval("pName") %>' />
                           <span><asp:Label ID="pPriceLabel" CssClass="price" runat="server" Text='<%# Eval("pPrice") %>' /><label class="price">$</label></span>
                       <span><labl class="total-price">Total </labl><asp:Label ID="totalpriceLabel" CssClass="total-price" runat="server" Text='<%# Eval("totalprice")%>' /><label class="total-price">$</label>     </span>                    
                        </div>
                        <div style="flex-grow:2;display:flex;flex-direction:row-reverse;">
                            <asp:Label ID="lbl_delete" onclick="RemoveItem(this.id)" runat="server" Text=""><i class="fa-solid fa-xmark"></i></asp:Label></div>
                    </div>
                    <div style="    flex-grow: 2;
    display: flex;
    align-items: center;
    flex-direction: row-reverse;">
              <span class="amountdiv">
                  <asp:Label ID="lbl_plus1" onclick="plus1(this.id)"  class="plusdiv" runat="server" Text=""><i class="fa-solid fa-plus"></i></asp:Label><asp:Label ID="QuantityLabel" CssClass="amount" runat="server" Text='<%# Eval("Quantity") %>' /><asp:Label ID="lbl_minus1" class="minusdiv" onclick="minus1(this.id)" runat="server" Text=""><i class="fa-solid fa-minus"></i></asp:Label></span>
                    </div>
                </div>
              
            </ItemTemplate>
        </asp:DataList>
            <asp:LinkButton ID="btn_chk" CssClass="sbmtdiv" runat="server" OnClick="btn_chk_Click">Procced To Checkout</asp:LinkButton>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [pNum], [pName], [pImage], [pPrice], [totalprice], [Quantity] FROM [carttb]"></asp:SqlDataSource>
                           <script src="js/sell.js"></script>
        <asp:DataList ID="DataList2" CssClass="dtl2" runat="server" DataKeyField="code" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <asp:Label ID="codeLabel" runat="server" Text='<%# Eval("code") %>' />
                <asp:Label ID="amountLabel" runat="server" Text='<%# Eval("amount") %>' />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [code], [amount] FROM [products]"></asp:SqlDataSource>
    </div>
</asp:Content>

