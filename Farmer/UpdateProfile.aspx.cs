using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Farmer_UpdateProfile : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr, updsql, sql, fid;
    SqlDataReader reader;

    protected void Page_Load(object sender, EventArgs e)
    {
        sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
        con = new SqlConnection(sqlConStr);
        fid = Session["farmid"].ToString();

        if (Page.IsPostBack == false)
        {
            sql = "SELECT address, city, state, pincode, email, phone FROM Farmer WHERE farmerid = '" + fid + "'";
            //Response.Write(sql);
            cmd.Connection = con;
            cmd.CommandText = sql;
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                   address_txt.Text = reader.GetString(0);
                   city_txt.Text = reader.GetString(1);
                   state_txt.Text = reader.GetString(2);
                   pin_txt.Text = reader.GetString(3);
                   email_txt.Text = reader.GetString(4);
                   phone_txt.Text = reader.GetString(5);
                }
                reader.Close();
            }
            catch (Exception e1)
            {
               msg_lbl.Text = "Error in retrieving the values" + e1.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
    protected void update_btn_Click(object sender, EventArgs e)
    {
        updsql = "UPDATE Farmer SET address = '" + address_txt.Text
            + "', city = '" + city_txt.Text
            + "', state = '" + state_txt.Text
            + "' , pincode = '" + pin_txt.Text
               + "', email = '" + email_txt.Text
               + "', phone = '" + phone_txt.Text
               + "' WHERE farmerid = '" + fid + "'";

        cmd.Connection = con;
        cmd.CommandText = updsql;

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            msg_lbl.Text = "Profile Updated Successfully";
        }
        finally
        {
            con.Close();
        }
    }
}