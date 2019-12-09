using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace GreenEnergy_ME
{
    public partial class Add_Market_Info : System.Web.UI.Page
    {
        Models.ModelView obj_cond,brwr;
        //DataTable Cond_Table;
        public int report = 0, dep_id, dep_id_rep;
        public string client_no, cpno, nat_bus;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            //client_no = Request["client_no"];
            //cpno = Request["cpno"];
            //dep_id = Convert.ToInt32(Request["dep_id"]);

            client_no = "21116";
            cpno = "109447";

            if (dep_id == 900 || dep_id == 910 || dep_id == 1000 || dep_id == 5000 || dep_id == 1140)
            {
                dep_id_rep = 1;
            }
            else
            {
                dep_id_rep = 0;
            }

            brwr = new Models.ModelView();
            dt = new DataTable();
            dt = brwr.get_brwrtype(client_no);
            hdfbrwr_type.Value = dt.Rows[0]["brwr_type"].ToString();

        }

        protected void btnsavedata_Click(object sender, EventArgs e)
        {

            int vstatus = 0;
            string error_status = "";
            try
            {
                obj_cond = new Models.ModelView();
                // Cond_Table = new DataTable();
                vstatus = obj_cond.Add_MarketInfo_Details(client_no, cpno, Convert.ToInt32(hdfbrwr_type.Value.ToString()), txtsuppname.Text, Convert.ToDouble(flcustcash.Text), Convert.ToDouble(flcustcredit.Text), txtsupptenor.Text, txtcustname.Text,
                    Convert.ToDouble(flcustcash.Text), Convert.ToDouble(flcustcredit.Text), txtcusttenor.Text,ref error_status);
                if (vstatus == 1)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Record Inserted Succesfully";
                    lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                    txtsuppname.Text = "";
                    txtsupptenor.Text = "";
                    flsuppcash.Text = "";
                    flsuppcredit.Text = "";
                    txtcustname.Text = "";
                    txtcusttenor.Text = "";
                    flcustcash.Text = "";
                    flcustcredit.Text = "";


                }
                else
                {
                    throw new Exception(error_status);
                }

            }
            catch (Exception ex)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + error_status + "')", true);

            }

            Response.Redirect("Main_MarketInfo.aspx");
        }

    }
}