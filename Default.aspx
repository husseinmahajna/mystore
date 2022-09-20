<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
              <style>

                  @import url('https://fonts.googleapis.com/css2?family=Anton&family=Catamaran:wght@500&family=Montez&family=Mr+Dafoe&family=Oleo+Script:wght@700&family=Patua+One&display=swap');
                  h1{
                      font-family: 'Anton', sans-serif;
font-family: 'Catamaran', sans-serif;
font-family: 'Montez', cursive;
font-family: 'Mr Dafoe', cursive;
font-family: 'Oleo Script', cursive;
font-family: 'Patua One', cursive;
                  }
        @import url('https://fonts.googleapis.com/css2?family=Catamaran:wght@500&family=Oleo+Script:wght@700&family=Patua+One&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Catamaran:wght@500&family=Mr+Dafoe&family=Oleo+Script:wght@700&family=Patua+One&display=swap'); 
*{
            scroll-behavior:smooth;
        }
           .sect1{
              background-image: url(../Images/210902.jpg);
    height: 93.8vh;
    box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 10%);
    display:flex;
    justify-content:center;
           }
           p{
               text-align:center;
           }
                  .wlc{
    margin: 40px 5px 34px 5px;               width:300px;
               color:blue;
               font-size:20px;
               text-align:center;
               padding :10px 20px;
               text-decoration:none;
               background:white;
               border:1px black solid;
               border-radius:50px;
               z-index:50;
               transition :all 0.3s ease-in-out;
                    font-family: 'Catamaran', sans-serif;
font-family: 'Mr Dafoe', cursive;
           }
                          .wlc:hover {
                              background: blue;
                              color: white;
                              transition: all 0.3s ease-in-out;
                          }
     

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div class="pcont">
                    <div class="sect1">
                                  <div style="display:flex;flex-direction:column;width:50%;align-items:center;justify-content:center;">
                                      <h1 style="color:#ddd;font-size: 50px;">Welcome To The Store</h1>
                                      <asp:LinkButton ID="btn_1" CssClass="wlc" runat="server" OnClick="btn_1_Click">Shop Now</asp:LinkButton>
                                      <p style="color:#eee;font-family: 'Oleo Script', cursive;">Do you like gadgets? Do you often spend your free time with electronics-related DIY activities in and around your house? Do you like trying trending electronics? If any of your answers are yes, then a winning idea for you must be to buy from our electronical products.
                                      </p>
                                  </div>
                    </div>

    </div>

</asp:Content>

