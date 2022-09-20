using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;

using System.Web.Security;
using System.Data.OleDb;
using System.IO;


public partial class UserManagment : System.Web.UI.Page
{
    static int i;
    static DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            dt = ClassUser.GetAll();
            i = 0;
            FillData();
        }
    }
    public void FillDate()
    {
        int c = 0;
        string str = "";
        for(int j = 0; j < dt.Rows[i]["dateofbirth"].ToString().Length; j++)
        {
            if (((dt.Rows[i]["dateofbirth"].ToString())[j].Equals('/') && c == 0)){
                txt_date_day.Text = str;
                c++;
                str = "";
            }
            else if (((dt.Rows[i]["dateofbirth"].ToString())[j].Equals('/') && c == 1))
            {
                txt_date_m.Text = str;
                c++;
                str = "";
            }
            else str+= (dt.Rows[i]["dateofbirth"].ToString())[j];
        }
        txt_date_y.Text = str.Substring(0,4);
    }
    public void FillData()
    {
        if (dt.Rows.Count > 0)
        {
            lbl_id.Text = dt.Rows[i]["id"].ToString();
            txt_fname.Text = dt.Rows[i]["firstname"].ToString();
            txt_lname.Text = dt.Rows[i]["lastname"].ToString();
            FillDate();
            if (dt.Rows[i]["gender"].ToString() == female.Text) { female.Checked = true; male.Checked = false; }
            else if (dt.Rows[i]["gender"].ToString() == male.Text) { male.Checked = true; female.Checked = false; }
            txt_phone.Text = dt.Rows[i]["phone"].ToString();
            txt_email.Text = dt.Rows[i]["email"].ToString();
            txt_address.Text = dt.Rows[i]["address"].ToString();
            txt_mailbox.Text = dt.Rows[i]["mailbox"].ToString();
            txt_micode.Text = dt.Rows[i]["micode"].ToString();
            txt_username.Text = dt.Rows[i]["username"].ToString();
            txt_pass.Text = dt.Rows[i]["password"].ToString();
            if (dt.Rows[i]["isadmin"].ToString() == rdb_true.Text) { rdb_true.Checked = true; rdb_false.Checked = false; }
            else if (dt.Rows[i]["isadmin"].ToString() == rdb_false.Text) { rdb_false.Checked = true; rdb_true.Checked = false; }

                img_user.ImageUrl = dt.Rows[i]["userimage"].ToString();
            
            FillDdlFindUserById();//fill the ID drop down list

        }
        else
        {
            ClearData();
            btn_add.Enabled = true;
            btn_update.Enabled = false;
            btn_delete.Enabled = false;

        }

        gvduser.DataSource = dt;
        gvduser.DataBind();
    }//FillData
    public void FillDdlFindUserById()
    {
        ddl_finduserbyid.Items.Clear();

        for (int j = 0; j < dt.Rows.Count; j++)
            ddl_finduserbyid.Items.Add(dt.Rows[j]["id"].ToString());
        ddl_finduserbyid.SelectedIndex = i;

    }//FillDdlFindByUserId
    public bool IsRightDate(string date)
    {

        DateTime dob;
        bool b = DateTime.TryParse(date, out dob);
        if (b)
        {
            DateTime d = DateTime.Parse(date);
            if (d.CompareTo(DateTime.Now) == 1)
                return false;
            else return true;
        }
        else return false;

    }//IsRightDate
    public bool CheckData(bool IsUpdate)
    {
        bool b = true;
        string date = txt_date_day.Text + "/" + txt_date_m.Text + "/" + txt_date_y.Text;
        if (!IsRightDate(date)) { lbl_err_date.Text = "Invalid Date "; b = false; }
        if (txt_username.Text == "") { lbl_err_username.Text = "Please Input Username"; b = false; }
        else if (txt_username.Text.Length < 6) { lbl_err_username.Text = "The Username Is Shorter Than Required"; b = false; }
        else if (ClassUser.FindUserByUserName(txt_username.Text) != -1 && (!IsUpdate)) { lbl_err_username.Text = "The Username You Entered Already Exist"; b = false; }
        if (txt_pass.Text == "") { lbl_err_pass.Text = "Please Input Password"; b = false; }
        else if (txt_pass.Text.Length < 6) { lbl_err_pass.Text = "The Password Is Shorter Than Required"; b = false; }
        if (FileUpload1.HasFile)
        {
            string ext = Path.GetExtension(FileUpload1.FileName);
            ext.ToLower();
            if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".gif")
            {
                lbl_err_img.Text = "You Have to upload jpg/jpeg/gif/png file only!";
                b= false;
            }
            else
            {
                int fileSize = FileUpload1.PostedFile.ContentLength;
                if (fileSize > 2097152)
                {
                    lbl_err_img.Text = "Error.. Maximum image size (2MB) !";
                    b= false;
                }
            }
        }
        return b;
    }//CheckData


    protected void btn_first_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_delete.Enabled = true;
        i = 0;
        FillData();
    }//First Button


    protected void btn_next_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_delete.Enabled = true;
        if (i < dt.Rows.Count - 1)
        {
            i++;
        }
        FillData();
    }//Next Button

    protected void btn_prev_Click(object sender, EventArgs e)
    {
        if (i > 0)
        {
            i--;
            FillData();
        }
        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_delete.Enabled = true;
    }//Previous Button


    protected void btn_last_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = false;
        btn_update.Enabled = true;
        btn_delete.Enabled = true;
        i = dt.Rows.Count - 1;
        FillData();
    }// Last Button
    public void ClearData()
    {
        lbl_id.Text = "";
        txt_fname.Text = "";
        txt_lname.Text = "";
        txt_date_day.Text = "";
        txt_date_m.Text = "";
        txt_date_y.Text = "";
        male.Checked = true;
        txt_phone.Text = "";
        txt_email.Text = "";
        txt_address.Text = "";
        txt_mailbox.Text = "";
        txt_micode.Text = "";
        txt_username.Text = "";
        txt_pass.Text = "";
        rdb_false.Checked = true;
        img_user.ImageUrl = "";
    }//ClearData

    protected void btn_new_Click(object sender, EventArgs e)
    {
        btn_add.Enabled = true;
        btn_delete.Enabled = false;
        btn_update.Enabled = false;

        ClearData();
    }//New Button

     
    protected void btn_add_Click(object sender, EventArgs e)
    {
        if (CheckData(false))
        {
            string g = male.Text;
            if (female.Checked) g = female.Text;//gender

            string a = rdb_false.Text;
            if (rdb_true.Checked) a = rdb_true.Text;//isadmin

            string date = txt_date_day.Text + "/" + txt_date_m.Text + "/" + txt_date_y.Text;//date

            string ImageName = "";
            if (FileUpload1.HasFile)
            {
                ImageName = "images\\" + FileUpload1.FileName;
                string path = Server.MapPath("images/");
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                img_user.ImageUrl = ImageName;

            }else
            {
                ImageName = "images\\" + "default-img.PNG";
                img_user.ImageUrl = ImageName;
            }
            ClassUser u = new ClassUser(txt_fname.Text, txt_lname.Text, date, g, txt_phone.Text
                , txt_email.Text, txt_address.Text, txt_mailbox.Text,
                txt_micode.Text, txt_username.Text, txt_pass.Text, a,ImageName);

            u.Insert();
            dt = ClassUser.GetAll();
            ClearData();
            gvduser.DataSource = dt;
            gvduser.DataBind();
            FillDdlFindUserById();
        }
    }//Add Button


    protected void btn_delete_Click(object sender, EventArgs e)
    {
        ClassUser u = new ClassUser();
        u.Id = lbl_id.Text;
        u.Delete();
        if (i == dt.Rows.Count - 1 && i > 0) i--;
        dt = ClassUser.GetAll();
        FillData();
        gvduser.DataSource = dt;
        gvduser.DataBind();
    }//Delete Button

    protected void btn_update_Click(object sender, EventArgs e)
    {
        if (CheckData(true))
        {
            string g = male.Text;
            if (female.Checked) g = female.Text;//gender

            string a = rdb_false.Text;
            if (rdb_true.Checked) a = rdb_true.Text;//isadmin

            string date = txt_date_day.Text + "/" + txt_date_m.Text + "/" + txt_date_y.Text;//date

            string ImageName = "";
            if (FileUpload1.HasFile)
            {
                ImageName = "images\\" + FileUpload1.FileName;
                string path = Server.MapPath("images/");
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                img_user.ImageUrl = ImageName;

            }
            else
            {
                ImageName = "images\\" + "default-img.PNG";
                img_user.ImageUrl = ImageName;
            }
            ClassUser u = new ClassUser(txt_fname.Text, txt_lname.Text, date, g, txt_phone.Text
        , txt_email.Text, txt_address.Text, txt_mailbox.Text,
        txt_micode.Text, txt_username.Text, txt_pass.Text, a,ImageName);

            u.Id = lbl_id.Text;
            u.Update();
            dt = ClassUser.GetAll();
            FillData();
            gvduser.DataSource = dt;
            gvduser.DataBind();
        }

    }//Update Button


    protected void btn_finduserbyusername_Click(object sender, EventArgs e)
    {
        if (txt_finduserbyusername.Text == "")
        {
            lbl_err_findbyusername.Text = "Please Input Username !";
            return;
        }
        int x = ClassUser.FindUserByUserName(txt_finduserbyusername.Text);
        if (x == -1)
        {
            lbl_err_findbyusername.Text = "The User Doesn't Exist!";
            return;
        }
        i = x;
        FillData();
        txt_finduserbyusername.Text = "";
    }//FindUserByUsername Button


    protected void ddl_finduserbyid_SelectedIndexChanged(object sender, EventArgs e)
    {
        i = ClassUser.FindUserById(ddl_finduserbyid.Text);
        FillData();
    }
 
}