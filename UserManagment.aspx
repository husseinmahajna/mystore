<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserManagment.aspx.cs" Inherits="UserManagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="css/usermanage.css" />

    <style type="text/css">

                 #ContentPlaceHolder1_gvduser td{
                     text-align:center;
                 }
        .txt_date{
            position:relative;
            width:20%;
            padding:5px;
            margin:0;
            text-align:center;
        }
        .slash{
            margin:0 2px;
            display:inline;
            position:relative;
            top:6px;
        }

        .auto-style1 {
            width: 4px;
        }

        .auto-style2 {
            width: 192px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="m-container" style="padding:20px 20px;">
            <div style="align-items:center;display:flex;flex-direction:column">
                <div>
            <asp:Label ID="lbl_idtitle" runat="server" style="font-weight:900;font-size:20px;" Text="Id :"></asp:Label>
                        <asp:Label ID="lbl_id" runat="server" style="font-weight:900;font-size:20px;color:blue;" Text=""></asp:Label>
             </div> 
                <table style="text-align:center;" class="auto-style1">                      
                      
                <tr>
                    <td>
                        <asp:Label ID="lbl_fname" runat="server" Text="FirstName"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="vld_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="Input First Name"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label ID="lbl_address" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_address" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="validator_address" runat="server" ControlToValidate="txt_address" ErrorMessage="Input Address"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style1" rowspan="4">
                        <asp:Image ID="img_user" style="width:250px;height:200px;" runat="server" />
                    </td>
                         <td>
                             <asp:Label ID="lbl_err_img" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="lbl_lname" runat="server" Text="LastName"></asp:Label>
                     </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_lname" runat="server"></asp:TextBox>
                     </td>
                    <td>
                        <asp:RequiredFieldValidator ID="vld_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="Input Last Name"></asp:RequiredFieldValidator>
                     </td>
                    <td>
                        <asp:Label ID="lbl_mailbox" runat="server" Text="Mail Box"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="txt_mailbox" runat="server"></asp:TextBox>
                     </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="validator_lname" runat="server" ControlToValidate="txt_mailbox" ErrorMessage="Input Mail Box"></asp:RequiredFieldValidator>
                     </td>
                      <td>
                          <asp:Button ID="btn_new" CssClass="btn2"  runat="server" Text="New" OnClick="btn_new_Click" CausesValidation="False" />
                     </td>
                </tr> 
                    <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lbl_date" runat="server" Text="BirthDate"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_date_day" style="padding:5px;" palceholder="D" CssClass="txt_date"   runat="server"></asp:TextBox>
                        <h1 class="slash">/</h1>
                        <asp:TextBox ID="txt_date_m" style="padding:5px;" palceholder="M" CssClass="txt_date"   runat="server"></asp:TextBox>
                        <h1 class="slash">/</h1>
                        <asp:TextBox  ID="txt_date_y" style="padding:5px;" palceholder="Y" CssClass="txt_date"  runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="lbl_err_date" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="lbl_micode" runat="server" Text="Micode"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txt_micode" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style5">
                        <asp:RequiredFieldValidator ID="validator_micode" runat="server" ControlToValidate="txt_micode" ErrorMessage="Input Micode"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btn_add" CssClass="btn2" runat="server" Text="Add" OnClick="btn_add_Click" Enabled="false" />
                        </td>
                </tr> <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lbl_gender" runat="server" Text="Gender"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <span style="display:flex;flex-direction:row;">  <asp:RadioButton ID="male" runat="server" Text="Male" GroupName="gender" Checked="True" />
                        <asp:RadioButton ID="female" runat="server" Text="Female" GroupName="gender" /></span>
                      
                    </td>
                    <td class="auto-style6">
                        </td>
                    <td class="auto-style6">
                        <asp:Label ID="lbl_username" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="lbl_err_username" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:Button ID="btn_update" CssClass="btn2" runat="server" Text="Update" OnClick="btn_update_Click" />
                        </td>
                </tr> <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lbl_phone" runat="server" Text="Phone"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_phone" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lbl_pass" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_pass" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="lbl_err_pass" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                     <td class="auto-style2">
                         <asp:Button ID="btn_delete" CssClass="btn2" runat="server" Text="Delete" OnClick="btn_delete_Click" CausesValidation="False" />
                        </td>
                </tr> <tr>
                    <td>
                        <asp:Label ID="lbl_email" runat="server" Text="E-mail"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="validator_req_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Input E-mail"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="validator_exp_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:Label ID="lbl_isadmin" runat="server" Text="Admin"></asp:Label>
                    </td>
                    <td>
                        <span style="display:flex;flex-direction:row;">
                                                        <asp:RadioButton ID="rdb_true" runat="server" Text="True" GroupName="admin" />
                        <asp:RadioButton ID="rdb_false" runat="server" Text="False"  GroupName="admin" Checked="True" />
                        </span>

                    </td>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td class="auto-style1">
                        &nbsp;</td>
                  <td></td>
                </tr>
                    <tr>
                        <td></td>
                        <td colspan="6">
                            <span style="display:flex;justify-content:space-around;padding:0 100px;">
                                                                 <asp:Button ID="btn_first" runat="server" CssClass="btn1" Text="First" OnClick="btn_first_Click" CausesValidation="False" />
                            <asp:Button ID="btn_prev" runat="server" CssClass="btn1" Text="Prev" OnClick="btn_prev_Click" CausesValidation="False" />
                            <asp:Button ID="btn_next" CssClass="btn1" runat="server" Text="Next" OnClick="btn_next_Click" CausesValidation="False" />
                            <asp:Button ID="btn_last" CssClass="btn1" runat="server" Text="Last" OnClick="btn_last_Click" CausesValidation="False" />
                            </span>

                        </td>
                    </tr>
            </table>
                </div>
        </div>
        <br />
        <br />
        <label>
            Find User By Username :
        </label>
        <asp:TextBox style="margin-right:5px;" ID="txt_finduserbyusername" runat="server"></asp:TextBox>
        <asp:Button ID="btn_finduserbyusername" runat="server" Text="Search" OnClick="btn_finduserbyusername_Click" />
        <asp:Label ID="lbl_err_findbyusername" runat="server" Text=""></asp:Label>
        <br />
        <label>Find User By Id :</label>
        <asp:DropDownList ID="ddl_finduserbyid" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_finduserbyid_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
    <center>
        <asp:GridView ID="gvduser" HeaderStyle-CssClass="header" CssClass="table1"  runat="server">
        </asp:GridView>
            </center>

</asp:Content>

