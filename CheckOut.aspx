<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
                 <link rel="stylesheet" href="css/checkout.css" />
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="first-cont">

<div class="p-cont">
    <div>
      <center><h1>Payment Information</h1></center>  

      <div class="row">
        <h4>Account</h4>
        <div class="input-group input-group-icon">
            <asp:TextBox ID="txt_firstname" placeholder="First Name" runat="server"></asp:TextBox>
          <div class="input-icon"><i class="fa fa-user"></i></div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Input a FirstName" ForeColor="Red" ControlToValidate="txt_firstname"></asp:RequiredFieldValidator>
        </div>
        <div class="input-group input-group-icon">
            <asp:TextBox ID="txt_lastname" placeholder="Last Name" runat="server"></asp:TextBox>
          <div class="input-icon"><i class="fa fa-pen"></i></div>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Input a LastName" ForeColor="Red" ControlToValidate="txt_lastname"></asp:RequiredFieldValidator>

        </div>
        <div class="input-group input-group-icon">
            <asp:TextBox ID="txt_phone" placeholder="Phone" runat="server"></asp:TextBox>
          <div class="input-icon"><i class="fa fa-phone"></i></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Input a Phone Number" ForeColor="Red" ControlToValidate="txt_phone"></asp:RequiredFieldValidator>
        </div>
      </div>
      <div class="row">
        <div class="col-half">
          <h4>Date of Birth</h4>
          <div class="input-group">
            <div class="col-third">
            <asp:TextBox ID="txt_day" placeholder="DD" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Input a Day" ForeColor="Red" ControlToValidate="txt_day"></asp:RequiredFieldValidator>
            </div>
            <div class="col-third">
            <asp:TextBox ID="txt_month" placeholder="MM" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Input a Month" ForeColor="Red" ControlToValidate="txt_month"></asp:RequiredFieldValidator>
            </div>
            <div class="col-third">
            <asp:TextBox ID="txt_year" placeholder="YY" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Input a Year" ForeColor="Red" ControlToValidate="txt_year"></asp:RequiredFieldValidator>
            </div>
          </div>
        </div>
        <div class="col-half">
          <h4>Gender</h4>
          <div class="input-group">
              <asp:RadioButton ID="rdb_male" Text="Male" runat="server" Checked="True" GroupName="gender" />
              <asp:RadioButton ID="rdb_female" Text="Female" runat="server" GroupName="gender" />
      

          </div>
        </div>
      </div>
      <div class="row">
        <h4>Address</h4>
        <div style="display: flex;">
        <div style="padding-right: 10px;" class="input-group input-group-icon">
          <asp:TextBox ID="txt_micode" CssClass="address1" placeholder="Micode" runat="server"></asp:TextBox>

            <div class="input-icon"><i class="fa fa-user"></i></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Input a Micode" ForeColor="Red" ControlToValidate="txt_micode"></asp:RequiredFieldValidator>
          </div>
          <div style="padding-left: 10px;" class="input-group input-group-icon">
            <asp:TextBox ID="txt_mailbox" CssClass="address1" placeholder="Mailbox" runat="server"></asp:TextBox>

            <div class="input-icon"><i class="fa-brands fa-usps"></i></div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Input a MailBox" ForeColor="Red" ControlToValidate="txt_mailbox"></asp:RequiredFieldValidator>
          </div>
        </div>

          <div class="input-group input-group-icon">
            <asp:TextBox ID="txt_address" placeholder="Address" runat="server"></asp:TextBox>
            <div class="input-icon"><i class="fa-solid fa-address-book"></i></div>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Input an Address" ForeColor="Red" ControlToValidate="txt_address"></asp:RequiredFieldValidator>
          </div>
      </div>
      <div style="display: flex;justify-content: center;align-items: center;" class="row">
          <asp:LinkButton ID="btn_order" CssClass="order" runat="server" OnClick="btn_order_Click">ORDER  <i class="fa-solid fa-basket-shopping"></i></asp:LinkButton>
      </div>
    </div>
</div>
   
</div>

</asp:Content>

