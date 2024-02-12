using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_AddCategory : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, isql;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
    }
    protected void add_btn_Click(object sender, EventArgs e)
    {
        string fpath = "";
        string fname = "";
        string uploadfolder = Request.PhysicalApplicationPath + "catimages\\";


        if (cat_fu.HasFile)
        {
            fname = Path.GetFileName(cat_fu.PostedFile.FileName);
            cat_fu.SaveAs(uploadfolder + fname);
        }
        fpath = "~\\catimages\\" + fname;

        isql = "INSERT INTO Category (categoryname, cimg) VALUES ('"
             + cat_txt.Text + "' , '"
             + fpath + "')";

        cmd.Connection = con;
        cmd.CommandText = isql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Category Added Successfully.";
        }
        catch (Exception excep)
        {
            msg_lbl.Text = "Not Succesfull." + excep.Message;
        }
        finally
        {
            con.Close();
        }
    }
}