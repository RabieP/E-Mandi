using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_EditProduct : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, sql, updsql, delsql;
    SqlDataReader rdr;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);

        prodid_txt.Text = Request.QueryString["pid"].ToString();

        if (Request.QueryString["pid"] == "")
        {
            Response.Redirect("AllProducts.aspx");
        }

        if (!Page.IsPostBack == true)
        {
            sql = "select productname, description, categoryid, unitprice, wttype, pqty from Product where productid = '" + Request.QueryString["pid"] + "'";
            cmd.Connection = con;
            cmd.CommandText = sql;
            try
            {
                con.Open();
                rdr = cmd.ExecuteReader();
                rdr.Read();

                prod_txt.Text = rdr.GetString(0);
                proddesc_txt.Text = rdr.GetString(1);
                prodcatid_ddl.Text = rdr.GetInt32(2).ToString();
                prodprice_txt.Text = rdr.GetDecimal(3).ToString();
                wt_ddl.Text = rdr.GetString(4);
                prodqty_txt.Text = rdr.GetInt32(5).ToString();
                rdr.Close();
            }

            finally
            {
                con.Close();
            }
        }
    }
   
    protected void edit_btn_Click(object sender, EventArgs e)
    {
        updsql = "UPDATE Product SET productname = '" + prod_txt.Text 
            +"' , description = '" + proddesc_txt.Text
            + "' , categoryid = " + prodcatid_ddl.SelectedValue 
            + " , unitprice = " + prodprice_txt.Text
            + " , wttype = '" + wt_ddl.SelectedItem.Text
            + "', pqty = " + prodqty_txt.Text
            + " WHERE productid = '" + Request.QueryString["pid"].ToString() + "'";

        cmd.Connection = con;
        cmd.CommandText = updsql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Product Updated Successfully.";
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
    protected void delete_btn_Click(object sender, EventArgs e)
    {
        delsql = "DELETE FROM Product WHERE productid = '" + Request.QueryString["pid"].ToString() + "'";

        cmd.Connection = con;
        cmd.CommandText = delsql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Product Deleted Successfully.";
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