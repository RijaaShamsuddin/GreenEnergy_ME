using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace GreenEnergy_ME
{
    public partial class Main_Guarantees : System.Web.UI.Page
    {
        Models.ModelView obj_del, brwr, get;
        public int report = 0, dep_id, dep_id_rep;
        public string client_no, cpno, nat_bus;
        DataTable dt, dtm;

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

            get = new Models.ModelView();
            dtm = new DataTable();
            dtm = get.get_guaranteeinfo(client_no, cpno);
            guaranteeinfo.DataSource = dtm;
            guaranteeinfo.DataBind();

        }

        protected void OnEdit(object sender, EventArgs e)
        {
            //Reference the Repeater Item using Button.
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            //Reference the Label and TextBox.
            int id = Convert.ToInt32((item.FindControl("lblid") as Label).Text);
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + id + "');", true);
            Response.Redirect("Edit_Guarantees.aspx?Id=" + id);
        }

        protected void OnAdd(object sender, EventArgs e)
        {
            Response.Redirect("Add_Guarantees.aspx");
        }

        protected void OnDelete(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int ID = int.Parse((item.FindControl("lblid") as Label).Text);

            int vstatus = 0;
            string error_status = "";
            try
            {
                obj_del = new Models.ModelView();
                vstatus = obj_del.Delete_Guarantee(ID, client_no, cpno, Convert.ToInt32(hdfbrwr_type.Value.ToString()), ref error_status);
                if (vstatus == 1)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "The Id: " + ID + " data has been deleted";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    Response.Redirect("Main_Guarantees.aspx");
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

        }
    }
}