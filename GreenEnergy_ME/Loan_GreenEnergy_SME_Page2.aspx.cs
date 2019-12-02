using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CIIRSUtility;

namespace GreenEnergy_ME
{
    public partial class Loan_GreenEnergy_SME_Page2 : System.Web.UI.Page
    {
        Models.ModelView get, brwr;
        dbAccess db = new dbAccess();
        Formats data = new Formats();
        DataSet ds, ds1, ds2;
        DataTable dt, dtc, dtg;

        public int report = 0, dep_id, dep_id_rep;
        public string client_no, cpno, nat_bus;
        protected void Page_Load(object sender, EventArgs e)
        {

            //client_no = Request["client_no"];
            //cpno = Request["cpno"];
            //dep_id = Convert.ToInt32(Request["dep_id"]);

            client_no = "55855";
            cpno = "99322";

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

            if (!IsPostBack)
            {
                    get = new Models.ModelView();
                    dtc = new DataTable();
                    Show_Checklist();
                    GridView1.DataSource = dtc;
                    GridView1.DataBind();

            }


        }

        protected void Show_Checklist()
        {
            dtc = get.show_checklist(client_no, cpno);
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //dtc = get.show_checklist(client_no, cpno);
            string error_status = "";
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblyes = (Label)e.Row.FindControl("lblyes");
                int yes = Convert.ToInt32(lblyes.Text);

                Label lbl2 = (Label)e.Row.FindControl("lblno");
                int no = Convert.ToInt32(lbl2.Text);

                Label lbl3 = (Label)e.Row.FindControl("lblna");
                int na = Convert.ToInt32(lbl3.Text);

                if (yes == 1)
                {
                    e.Row.Cells[1].Text = "✔";
                    e.Row.Cells[2].Text = "";
                    e.Row.Cells[3].Text = "";
                }
                else if (no == 1)
                {
                    e.Row.Cells[1].Text = "";
                    e.Row.Cells[2].Text = "✘";
                    e.Row.Cells[3].Text = "";
                }
                else if (na == 1)
                {
                    e.Row.Cells[1].Text = "";
                    e.Row.Cells[2].Text = "";
                    e.Row.Cells[3].Text = "N/A";
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + error_status + "')", true);
                }
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "insurance";
                e.Row.Cells[0].ColumnSpan = 2;
                e.Row.Cells[0].Visible = true;
                TableCell tc = new TableCell();
                tc.Text = "* insurance will be advance for one year and then it will be part of the monthly / quartely instalment";
                tc.ColumnSpan = 5;

                GridViewRow gr = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);

                gr.Cells.Add(tc);


                Table gvTable = (Table)e.Row.Parent;
                gvTable.Controls.Add(gr);
            }
        }

        protected void Previous(object sender, EventArgs e)
        {
            Response.Redirect("Loan_GreenEnergy_ME.aspx");
        }
    }
}