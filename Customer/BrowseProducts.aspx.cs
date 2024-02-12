using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Customer_BrowseProducts : System.Web.UI.Page
{
    SqlConnection con;
    String sql;
    SqlCommand command = new SqlCommand();
    String sqlConStr = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\smart.mdf;Integrated Security=True;User Instance=True;";
    double total;
    SqlDataReader rdr;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(sqlConStr);



    }


    protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if ((e.Item.FindControl("pqtyLabel") as Label).Text != "0")
            {
                (e.Item.FindControl("pqtyLabel") as Label).Text = "In Stock";
                (e.Item.FindControl("lnkDetails") as HyperLink).Visible = true;
                (e.Item.FindControl("lnkCart") as HyperLink).Visible = true;
                (e.Item.FindControl("Image2") as Image).Visible = false;
            }
            if ((e.Item.FindControl("pqtyLabel") as Label).Text == "0")
            {
                (e.Item.FindControl("pqtyLabel") as Label).Text = "Out Of Stock";
                (e.Item.FindControl("lnkDetails") as HyperLink).Visible = false;
                (e.Item.FindControl("lnkCart") as HyperLink).Visible = false;
                (e.Item.FindControl("Image2") as Image).Visible = true;
            }
        }
    }
}