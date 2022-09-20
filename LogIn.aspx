<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn
    " %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <meta charset="UTF-8"/>
        <link rel="stylesheet" href="css/logincss.css" />

</head>
<body>
  <div class="container" id="container">
         <form id="form1" runat="server">
             <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
             <div class="form sign-in">
        <h1 style="color: blue;background-color: #eee;">SIGN IN</h1>
        <div class="group">      
         <asp:TextBox ID="txt_usr_lgn" onkeyup="this.setAttribute('value', this.value);" value=""  CssClass="input1" runat="server" ></asp:TextBox>
        <span class="highlight" ></span>
        <span class="bar"></span>
        <label class="placeholder">Username</label>
      </div>
        
      <div class="group">      
          <asp:TextBox ID="txt_pas_lgn" onkeyup="this.setAttribute('value', this.value);" value=""  CssClass="input1" runat="server" TextMode="Password" ></asp:TextBox>
        <span class="highlight"></span>
        <span class="bar"></span>
        <label class="placeholder">Password</label>
                   <asp:Label ID="lbl_err_lgn" runat="server" Text=""></asp:Label>
      </div>
      <asp:Button ID="btn_lgn" CssClass="b1" runat="server" Text="Sign In" OnClick="btn_lgn_Click" CausesValidation="False" />
      </div>
      <div class="form sign-up">
        <h1 style="color: blue;background-color: #eee;position:relative;top:10px;">SIGN UP</h1>
        <div class="group">      
            <asp:TextBox ID="txt_usr_rgstr" onkeyup="this.setAttribute('value', this.value);" value=""  CssClass="input1"  runat="server" ></asp:TextBox>
          <span class="highlight"></span>
          <span class="bar"></span>
          <label class="placeholder">Username</label>
            <asp:CustomValidator ID="cstm_valid_usr" runat="server" ErrorMessage="The Username Must be 6 Or More Characters" ClientValidationFunction="validateLength" ControlToValidate="txt_usr_rgstr" ValidateEmptyText="True" ClientIDMode="Static"></asp:CustomValidator>
                        <asp:CustomValidator ID="cstm_valid_exist"  runat="server"   ErrorMessage="The Username You Enetered Already Exists" ClientValidationFunction="validate_exist" ControlToValidate="txt_usr_rgstr" ClientIDMode="Static" ></asp:CustomValidator>
            </div>
        <div class="group">      
            <asp:TextBox ID="txt_pas_rgstr" onkeyup="this.setAttribute('value', this.value);" value=""  CssClass="input1"  runat="server" TextMode="Password"></asp:TextBox>
          <span class="highlight"></span>
          <span class="bar"></span>
          <label class="placeholder">Password</label>
            <asp:CustomValidator ID="cstm_valid_pas" runat="server" ErrorMessage="The Password Must be 6 Or More Characters" ClientValidationFunction="validateLength" ControlToValidate="txt_pas_rgstr" ValidateEmptyText="True"></asp:CustomValidator>
        </div>
        <div class="group">      
            <asp:TextBox ID="txt_email_rgstr" onkeyup="this.setAttribute('value', this.value);" value=""  CssClass="input1"  runat="server"></asp:TextBox>
          <span class="highlight"></span>
          <span class="bar"></span>
          <label class="placeholder">Email@exapmle.com</label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid E-mail Format" ControlToValidate="txt_email_rgstr" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Input E-mail" ControlToValidate="txt_email_rgstr"></asp:RequiredFieldValidator>
        </div>
         <asp:Button ID="btn_rgstr" CssClass="b1" runat="server" Text="Sign Up" OnClick="btn_rgstr_Click" />
      </div>
        <div class="overlay-panel right-panel">
          <label class="overlay-label">
            Don't Have An Account ?Sign Up
          </label>
            <label class="b1" id="signUp">Sign Up</label>
        </div>
        <div class="overlay-panel left-panel">
          <label class="overlay-label">
            Already Have An Account ?Sign In
          </label>
            <label id="signIn" class="b1">Sign In</label>
        </div>
         </form>
    </div>
              <script src="js/login.js"></script>
    </body>
</html>
