<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/contactus.css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="mcontainer">
            <h1>Contact Us</h1>
            <div >
                  <label>Subject</label>
                <asp:TextBox ID="txt_subject" CssClass="txt1" runat="server"></asp:TextBox>
                   </div>
            <div>
        <label>Content</label>
         <asp:TextBox ID="txt_content" CssClass="text-area" cols="50" rows="25" runat="server" TextMode="MultiLine"></asp:TextBox>
    </div>
             <span>
                 <asp:Button ID="btn_send" CssClass="btn1" style="margin-left: 69px;" runat="server" Text="Send" OnClick="btn_send_Click" />
            <asp:Button ID="btn_clear" CssClass="btn1" runat="server" Text="Clear" OnClick="btn_clear_Click" />


    </span> 
    </div>

</asp:Content>

