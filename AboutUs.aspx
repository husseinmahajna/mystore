<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

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
                      @import url('https://fonts.googleapis.com/css2?family=Catamaran:wght@500&family=Montez&family=Mr+Dafoe&family=Oleo+Script:wght@700&family=Patua+One&display=swap');

                      *{
                                                scroll-behavior:smooth;

                      }
                      p{
                          text-align:center;
                      }
                  .pcont{
                      min-height:90vh;
                  }
                  .sect1{
                      height:70vh;
                      background-image:url("../Images/210891.jpg")     ;
                      background-repeat:no-repeat;
                      background-size:cover;
                         box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 10%);
    display:flex;
    justify-content:space-around;
                                   margin-bottom:100px

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
               transition :all 0.3s ease-in-out;
                    font-family: 'Catamaran', sans-serif;
font-family: 'Mr Dafoe', cursive;
           }
                          .wlc:hover {
                              background: blue;
                              color: white;
                              transition: all 0.3s ease-in-out;
                          }
                          .sect2{
                          display: flex;
     justify-content: center; 
    padding-top: 100px;
    align-items: center;
    flex-direction: column;
    padding: 100px 30px;
    /* border: 1px solid black; */
    height: 70vh;
    box-shadow: 0 -8.5rem 1rem rgb(0 0 0 / 10%);
                          }

              </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
               <div class="pcont">
                    <div class="sect1">
                                  <div style="display:flex;flex-direction:column;width:50%;align-items:center;justify-content:center;">
                                      <h1 style="color:#ddd;font-size: 50px;">Welcome To The Store</h1>
                                      <a class="wlc" href="#aboutus">About Us</a>
                                      <p style="color:#eee;font-family: 'Oleo Script', cursive;">Do you like gadgets? Do you often spend your free time with electronics-related DIY activities in and around your house? Do you like trying trending electronics? If any of your answers are yes, then a winning idea for you must be to buy from our electronical products.
                                      </p>
                                  </div>
                    </div>

                   <div  class="sect2">
                       <h1 id="aboutus">About Us</h1>
                        <p style="color:black;    color: black;
    width: 900px;
    text-align: center;
    padding: 20px;">We Are an e-commerce solution for merchants who want to host a website that advertises their products or services and for which consumer transactions are generated online. Various software applications are available to merchants, which range from electronic shopping carts to secure payment gateways. Merchants that lack e-commerce technical skills find that storefront vendors are especially helpful when starting out or maintaining their online stores.
</p>
                   </div>

    </div>
</asp:Content>

