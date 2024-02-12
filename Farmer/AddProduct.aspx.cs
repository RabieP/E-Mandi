using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class Admin_AddProduct : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, isql;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
        prodid_txt.Text = DateTime.Now.ToString("P-yy-HHmmss");
    }
    protected void add_btn_Click(object sender, EventArgs e)
    {

        string fpath = "";
        string fname = "";
        string uploadfolder = Request.PhysicalApplicationPath + "productimages\\";
        

        if (prod_fu.HasFile)
        {
            fname = Path.GetFileName(prod_fu.PostedFile.FileName);
            prod_fu.SaveAs(uploadfolder + fname);
        }
        fpath = "~\\productimages\\" +fname;

        isql = "INSERT INTO Product VALUES ('"
             + prodid_txt.Text + "' , '"
             + prod_txt.Text + "' , '"
             + proddesc_txt.Text + "' , "
             + prodcatid_ddl.SelectedValue + " , "
             + prodprice_txt.Text + " , '"
             + fpath  + "' , '"
             + wt_ddl.SelectedItem.Text + "' , '"
             + Session["farmid"].ToString() + "' , "
             + prodqty_txt.Text + ")";
        
        cmd.Connection = con;
        cmd.CommandText = isql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Product Added Successfully.";
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