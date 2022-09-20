<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsManagment.aspx.cs" Inherits="ProductsManagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/productmanagment.css"/>
    <style>
        a{
            text-decoration:none;
            text-align:center;
        }
       .fa-trash{
           margin-top:37px;
           background-color:transparent;
       }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="pcont">
  <div class="adding-form">
<div class="group">
  <label class="high">
    Product Code
  </label>
    <asp:Label ID="lbl_code" runat="server" style="background-color: transparent;font: 900;font-size: 35px;" Text=""></asp:Label>
</div>
<div class="group">
  <label class="high">
    Name
  </label>
    <asp:TextBox ID="txt_name" CssClass="input1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rqrd_name" runat="server" ErrorMessage="Please Enter a Product Name" ControlToValidate="txt_name"  ForeColor="Red"></asp:RequiredFieldValidator>
</div>
<div class="group">
  <label class="high">
    Company
  </label>
    <asp:TextBox ID="txt_company" CssClass="input1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqrd_company" runat="server" ErrorMessage="Please Enter a Company Name" ControlToValidate="txt_company"  ForeColor="Red"></asp:RequiredFieldValidator>
</div>
<div class="group">
  <label class="high">
    Type
  </label>
    <asp:TextBox ID="txt_type" CssClass="input1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqrd_type" runat="server" ErrorMessage="Please Enter The Product's Type" ControlToValidate="txt_type"  ForeColor="Red"></asp:RequiredFieldValidator>

</div>
<div class="group" style="flex-basis: 610px;height: 100px;">
  <label class="high">
    Description
  </label>
    <asp:TextBox ID="txt_desc" CssClass="input1" style="height:75px"  runat="server" TextMode="MultiLine"></asp:TextBox>
</div><div class="group">
  <label class="high">
    Guarantee
  </label>
    <asp:TextBox ID="txt_guarantee" CssClass="input1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqrd_guarantee" runat="server" ErrorMessage="Please Enter The Guarantee duration" ControlToValidate="txt_guarantee"  ForeColor="Red"></asp:RequiredFieldValidator>

</div><div class="group">
  <label class="high">
    Price
  </label>
    <asp:TextBox ID="txt_price" CssClass="input1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqrd_price" runat="server" ErrorMessage="Please Enter The Products's Price"  ForeColor="Red" ControlToValidate="txt_price"></asp:RequiredFieldValidator>
</div><div class="group" style="flex-basis: 225px;">
  <label class="high">
    Amount
  </label>
    <asp:TextBox ID="txt_amount" CssClass="input1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqrd_amount" runat="server" ErrorMessage="Please Enter The Available Amount" ControlToValidate="txt_amount"  ForeColor="Red"></asp:RequiredFieldValidator>

</div><div class="group" style="flex-basis: 225px;">
  <label class="high">
    Min Amount
  </label>
    <asp:TextBox ID="txt_minamount" CssClass="input1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rqrd_minamount" runat="server" ErrorMessage="Please Enter The Min Amount" ControlToValidate="txt_minamount" ForeColor="Red"></asp:RequiredFieldValidator>

</div>
<div class="group" style="flex-basis:140px">
  <label class="high">
    Supplier Number
  </label>
    <asp:DropDownList ID="ddl_suppliers" CssClass="ddl" runat="server"></asp:DropDownList>
  
</div>
      <div class="group" style="flex-basis: 610px;align-items:center;" >
  <label class="high">
    Image
  </label>
          <div class="image-cont">
                       <asp:FileUpload ID="FileUpload1" style="position:relative;bottom:10px;left:10px;" runat="server" />
        <asp:Image ID="img_product" style="height:200px;" runat="server" />
          </div>
   
      </div>

<span class="btns-1">
    <asp:LinkButton ID="btn_first" CssClass="btn1" style="width:70px;background-color: rgb(35, 35, 187);" runat="server" OnClick="btn_first_Click" CausesValidation="False"><i class="fa-solid fa-backward-fast"></i> First</asp:LinkButton>
    <asp:LinkButton ID="btn_prev" CssClass="btn1" style="width:70px;" runat="server" OnClick="btn_prev_Click" CausesValidation="False"><i class="fa-solid fa-left-long"></i> Prev</asp:LinkButton>
    <asp:LinkButton ID="btn_next" CssClass="btn1" style="width:70px;background-color: red;" runat="server" OnClick="btn_next_Click" CausesValidation="False"><i class="fa-solid fa-right-long"></i> Next</asp:LinkButton>
    <asp:LinkButton ID="btn_last" CssClass="btn1"  style="width:70px;background-color: aqua;" runat="server" OnClick="btn_last_Click" CausesValidation="False"><i class="fa-solid fa-forward-fast"></i> Last</asp:LinkButton>
</span>

  <span class="btns-1">
        <asp:LinkButton ID="btn_clean" CssClass="btn1" style="width:70px;background-color: rgb(35, 35, 187);" runat="server" OnClick="btn_clean_Click"><i class="fa-solid fa-broom"></i> Clean</asp:LinkButton>
        <asp:LinkButton ID="btn_add" CssClass="btn1" style="width:70px;" runat="server" OnClick="btn_add_Click"><i class="fa-solid fa-plus"></i> Add</asp:LinkButton>
        <asp:LinkButton ID="btn_remove" CssClass="btn1" style="width:70px;background-color: red;" runat="server" OnClick="btn_remove_Click"><i class="fa-solid fa-trash-can"></i> Remove</asp:LinkButton>
        <asp:LinkButton ID="btn_update" CssClass="btn1" style="width:70px;background-color: aqua;" runat="server" OnClick="btn_update_Click"><i class="fa-solid fa-pen-clip"></i> Update</asp:LinkButton>
  </span>
<!-- container end  -->
</div>
            <div>
                <asp:GridView ID="gdvproducts1" runat="server" AutoGenerateColumns="False" DataKeyNames="code" DataSourceID="SqlDataSource1" HeaderStyle-CssClass="header" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="Code" InsertVisible="False" ReadOnly="True" SortExpression="code" />
                        <asp:BoundField DataField="product_name" HeaderText="Name" SortExpression="product_name" />
                        <asp:BoundField DataField="company" HeaderText="Company" SortExpression="company" />
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                        <asp:BoundField DataField="pDate" HeaderText="Date" SortExpression="pDate" />
                        <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                        <asp:BoundField DataField="guarantee" HeaderText="Guarantee" SortExpression="guarantee" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                        <asp:BoundField DataField="min_amount" HeaderText="Min Amount" SortExpression="min_amount" />
                        <asp:BoundField DataField="supplier_num" HeaderText="Supplier Number" SortExpression="supplier_num" />
                        <asp:ImageField DataImageUrlField="pImage">
                            <ControlStyle Width="100px" />
                        </asp:ImageField>
                        <asp:CommandField ShowDeleteButton="True">
                        <ItemStyle CssClass="fa-solid fa-trash"  ForeColor="Red" />
                        </asp:CommandField>
                    </Columns>

<HeaderStyle CssClass="header"></HeaderStyle>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [products] WHERE [code] = ?" InsertCommand="INSERT INTO [products] ([code], [product_name], [company], [type], [pDate], [description], [guarantee], [price], [amount], [min_amount], [supplier_num], [pimage]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [products]" UpdateCommand="UPDATE [products] SET [product_name] = ?, [company] = ?, [type] = ?, [pDate] = ?, [description] = ?, [guarantee] = ?, [price] = ?, [amount] = ?, [min_amount] = ?, [supplier_num] = ?, [pimage] = ? WHERE [code] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="code" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="code" Type="Int32" />
                        <asp:Parameter Name="product_name" Type="String" />
                        <asp:Parameter Name="company" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="pDate" Type="DateTime" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="guarantee" Type="String" />
                        <asp:Parameter Name="price" Type="Int32" />
                        <asp:Parameter Name="amount" Type="Int32" />
                        <asp:Parameter Name="min_amount" Type="Int32" />
                        <asp:Parameter Name="supplier_num" Type="Int32" />
                        <asp:Parameter Name="pimage" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="product_name" Type="String" />
                        <asp:Parameter Name="company" Type="String" />
                        <asp:Parameter Name="type" Type="String" />
                        <asp:Parameter Name="pDate" Type="DateTime" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="guarantee" Type="String" />
                        <asp:Parameter Name="price" Type="Int32" />
                        <asp:Parameter Name="amount" Type="Int32" />
                        <asp:Parameter Name="min_amount" Type="Int32" />
                        <asp:Parameter Name="supplier_num" Type="Int32" />
                        <asp:Parameter Name="pimage" Type="String" />
                        <asp:Parameter Name="code" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

</div>
</asp:Content>

