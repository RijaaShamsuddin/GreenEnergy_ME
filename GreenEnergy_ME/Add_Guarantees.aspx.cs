﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace GreenEnergy_ME
{
    public partial class Add_Guarantees : System.Web.UI.Page
    {
        Models.ModelView obj_cond, brwr;
        //DataTable Cond_Table;
        public int report = 0, dep_id, dep_id_rep;
        public string client_no, cpno, nat_bus, cdate;
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

            //cdate = DateTime.("dd/mm/yyyy");
            //vddate.Text = String.Format("{0:dd/mm/yyyy}", cdate);

        }

        protected void btnsavedata_Click(object sender, EventArgs e)
        {

            int vstatus = 0;
            string error_status = "";
            string dt = Request.Form[vddate.UniqueID];
            ///vddate.Text = String.Format("{0:dd/mm/yyyy}", dt) + " " + String.Format("{0:HH:mm:ss}", DateTime.Now);
            string date = String.Format("{0:mm/dd/yyyy}", dt);
            string time = String.Format("{0:HH:mm:ss}", DateTime.Now);
            vddate.Text = date + " " + time;
            try
            {
                obj_cond = new Models.ModelView();
                vstatus = obj_cond.Add_Guarantees(client_no, cpno, Convert.ToInt32(hdfbrwr_type.Value.ToString()), txtguarantorname.Text, txttowhom.Text,
                    Convert.ToDouble(flamtguarantee.Text), vddate.Text, Convert.ToDouble(flnetworthguaran.Text), ref error_status);
                if (vstatus == 1)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Record Inserted Succesfully";
                    lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                    txtguarantorname.Text = "";
                    txttowhom.Text = "";
                    flamtguarantee.Text = "";
                    vddate.Text = "";
                    flnetworthguaran.Text = "";
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

            Response.Redirect("Main_Guarantees.aspx");
        }
    }
}