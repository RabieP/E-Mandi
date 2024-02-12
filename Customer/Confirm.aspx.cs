using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Customer_Confirm : System.Web.UI.Page
{
     SqlConnection con;
     String updsql, sql, todaydate;
    SqlCommand cmd = new SqlCommand();
    String sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\emandi.mdf;Integrated Security=True;User Instance=True;";
    double total;
    SqlDataReader rdr;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(sqlConStr);
        cusid_lbl.Text = Session["cusid"].ToString();
        todaydate = DateTime.Now.ToString("dd-MMM-yyyy");
        date_lbl.Text = todaydate;

        if (Session["cusid"] == null)
        {
            Response.Redirect("~/CustomerLogin.aspx");
        }


        total = 0;
        int i = 0;

        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            total = total + Convert.ToInt32(((Label)GridView1.Rows[i].FindControl("lblqty")).Text) * Convert.ToDouble(GridView1.Rows[i].Cells[4].Text);
        }

        double dblNumber = total;
        string strFormated = string.Format("{0:###0.#0}", dblNumber);
        lblTotal.Text = strFormated;

        sql = "select firstname, lastname, address, city, state, pincode, email, phone from Customer where customerid = '" + Session["cusid"].ToString() + "'";
        cmd.Connection = con;
        cmd.CommandText = sql;
        try
        {
            con.Open();
            rdr = cmd.ExecuteReader();
            rdr.Read();

            name_lbl.Text  = rdr.GetString(0) + " " + rdr.GetString(1);
            add_txt.Text = rdr.GetString(2) + ", "  + rdr.GetString(3) + ", " + rdr.GetString(5) + ", " + rdr.GetString(4);
            email_lbl.Text = rdr.GetString(6);
            phone_lbl.Text = rdr.GetString(7);
            rdr.Close();
        }

        finally
        {
            con.Close();
        }
    }


    protected void placeorder_btn_Click(object sender, EventArgs e)
    {
        SqlCommand command = null;
        string str = null;
        int ordid = 0;
        try
        {
            con.Open();
            str = "insert into OrderMaster (customerid, orderdate, ordertotal, status) values('" + cusid_lbl.Text + "','" + date_lbl.Text + "', " + total + ",'Ordered'); select scope_identity();";

           // Response.Write(str);
            command = new SqlCommand(str, con);
            ordid = Convert.ToInt32(command.ExecuteScalar());


            //insert into bill 
            str = "insert into bill (billdate, customerid, orderid, orderamt)";
            str = str + " values ('" + date_lbl.Text + "', '" + cusid_lbl.Text + "'," + ordid + " , " + lblTotal.Text + ")";
            // Response.Write(str);
            command = new SqlCommand(str, con);
            command.ExecuteNonQuery();

            //insert into payment
            //str = "insert into payment (pdate, customerid, amount)";
            //str = str + " values ('" + todaydate + "', '" + cusid_lbl.Text + "', " + lblTotal.Text + ")";
            // Response.Write(str);
           // command = new SqlCommand(str, con);
           // command.ExecuteNonQuery();

            total = 0;
            int i = 0;
            int oqty = 0, rqty = 0;
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                string strQuantity = ((Label)GridView1.Rows[i].FindControl("lblqty")).Text;
                total = Convert.ToDouble(strQuantity) * Convert.ToDouble(GridView1.Rows[i].Cells[4].Text);

                //insert into order details from cart table
                str = "insert into OrderDetails (orderid, productid, quantity, unitprice, total)";
                str = str + " values(" + ordid + ",'" + GridView1.Rows[i].Cells[1].Text + "'," + strQuantity + "," + GridView1.Rows[i].Cells[4].Text + ", " + total  + ")";
                //Response.Write(str);
                command = new SqlCommand(str, con);
                command.ExecuteNonQuery();


                //Update quantity
                sql = "select pqty from product where productid = '" + GridView1.Rows[i].Cells[1].Text + "'";
                command = new SqlCommand(sql, con);
                rdr = command.ExecuteReader();
                rdr.Read();
                oqty = rdr.GetInt32(0);
                rdr.Close();

                // Response.Write("Original Qty" + oqty);
                rqty = oqty - Convert.ToInt32(strQuantity);
                //  Response.Write("Remaining Qty" + rqty);

                str = "Update Product set pqty = " + rqty + " Where productid = '" + GridView1.Rows[i].Cells[1].Text + "'";
                //  Response.Write("Update Qty" + str);
                command = new SqlCommand(str, con);
                command.ExecuteNonQuery();


                //delete from cart 
                str = "delete from Cart where cartid = '" + GridView1.Rows[i].Cells[0].Text + "'";
               // Response.Write(str);
                command = new SqlCommand(str, con);
                command.ExecuteNonQuery();
            }

            Response.Redirect("MakePayment.aspx");
        }
        catch (Exception ex) { msg_lbl.Text = "Order Not Placed. " + ex.Message; }
        finally
        {
            con.Close();
        }
    }
}