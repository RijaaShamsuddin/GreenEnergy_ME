using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using CIIRSUtility;

namespace GreenEnergy_ME
{
    public partial class Loan_GreenEnergy_ME : System.Web.UI.Page
    {
        dbAccess db = new dbAccess();
        Formats data = new Formats();
        DataSet ds,ds1;

        public int report = 0, dep_id, dep_id_rep;
        public string client_no,cpno,nat_bus;

        protected void Page_Load(object sender, EventArgs e)
        {
            ds = new DataSet();

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

            Bussines_Details();
            Repeater.DataSource = ds.Tables[0];
            Repeater.DataBind();
            GridView1.DataSource = ds.Tables[1];
            GridView1.DataBind();

            ds1 = Directors_Details(client_no, cpno, 0, dep_id_rep);
            dir_details.DataSource = ds1.Tables[0];
            dir_details.DataBind();

            if (ds.Tables[3].Rows[0]["Nature_of_Business"].ToString() != "-")
            {
                nat_bus = ds.Tables[3].Rows[0]["Nature_of_Business"].ToString();
                Table.Visible =  true;
            }
            else
                Table.Visible =  false;
        }

        protected void Bussines_Details()
        {
            ds = data.getCustomer_StaticData(client_no, cpno, 0, dep_id_rep);
        }

        protected DataSet Directors_Details(string client_no, string cpno, int report, int dep_idrep)
        {
            this.db.Cmd.CommandText = "[dbo].[pro_GreenEnergy]";
            this.db.Cmd.CommandType = CommandType.StoredProcedure;
            this.db.Cmd.Parameters.Clear();
            this.db.Cmd.Parameters.Add(new SqlParameter("@clientid", client_no));
            this.db.Cmd.Parameters.Add(new SqlParameter("@clpno", cpno));
            this.db.Cmd.Parameters.Add(new SqlParameter("@report", report));
            this.db.Cmd.Parameters.Add(new SqlParameter("@dep_id", dep_idrep));
            this.db.Da.SelectCommand = this.db.Cmd;
            this.db.Cmd.CommandTimeout = 0;
            DataSet ds1 = new DataSet();
            try
            {
                this.db.Da.Fill(ds1);
            }
            catch (Exception exception)
            {
                throw exception;
            }
            return ds1;
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            for (int i = GridView1.Rows.Count - 1; i > 0; i--)
            {
                GridViewRow row = GridView1.Rows[i];
                GridViewRow previousRow = GridView1.Rows[i - 1];
                for (int j = 0; j < 8; j++)
                {
                    //run this loop for the column which you thing the data will be similar
                    if (((Label)row.Cells[j].FindControl("Label2")).Text == ((Label)previousRow.Cells[j].FindControl("Label2")).Text && (((Label)row.Cells[j].FindControl("Label1")).Text == ((Label)previousRow.Cells[j].FindControl("Label1")).Text))
                    {
                        if (previousRow.Cells[j].RowSpan == 0)
                        {
                            if (row.Cells[j].RowSpan == 0)
                            {
                                previousRow.Cells[j].RowSpan += 2;
                            }
                            else
                            {
                                previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
                            }
                            row.Cells[j].Visible = false;
                        }
                    }
                }
            }
        }
        protected void GridView1_PreRender(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Total";
                e.Row.Cells[0].ColumnSpan = 2;
                e.Row.Cells[1].Visible = false;
                //e.Row.Cells[2].Visible = false;
                //e.Row.Cells[3].Visible = false;
                //e.Row.Cells[4].Visible = false;
                //e.Row.Cells[5].Visible = false;
                //e.Row.Cells[6].Visible = false;
                //e.Row.Cells[7].Visible = false;
                e.Row.Cells[5].Text = Convert.ToDouble(ds.Tables[2].Compute("sum(applimit)", "")).ToString();
                e.Row.Cells[6].Text = Convert.ToDouble(ds.Tables[2].Compute("sum(ProposedLimit)", "")).ToString();
                //e.Row.Cells[8].Text=Convert.ToDouble(view.RowFilter.
                //e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                //e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Right;


                GridView gv1 = (GridView)sender;
                //adding funded total
                TableCell tc = new TableCell();
                tc.Text = "Total Funded: ";
                tc.ColumnSpan = 4;
                TableCell tcnF = new TableCell();
                tcnF.Text = Convert.ToDouble(ds.Tables[2].Compute("sum(applimit)", "facility_cat='Funded'")).ToString();
                TableCell tcnFF = new TableCell();
                tcnFF.Text = Convert.ToDouble(ds.Tables[2].Compute("sum(proposedlimit)", "facility_cat='Funded'")).ToString();
                TableCell tc1 = new TableCell();
                tc1.Text = "";
                tc1.ColumnSpan = 2;
                GridViewRow gr = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);
                gr.CssClass = "Footer1";
                gr.Cells.Add(tc);
                gr.Cells.Add(tcnF);
                gr.Cells.Add(tcnFF);
                gr.Cells.Add(tc1);

                Table gvTable = (Table)e.Row.Parent;
                gvTable.Controls.Add(gr);

                //adding nonfunded column
                TableCell tc3 = new TableCell();
                tc3.Text = "Total Non Funded: ";
                tc3.ColumnSpan = 4;
                TableCell tcF = new TableCell();
                tcF.Text = Convert.ToDouble(ds.Tables[2].Compute("sum(applimit)", "facility_cat='Non-Funded'")).ToString();
                TableCell tcFF = new TableCell();
                tcFF.Text = Convert.ToDouble(ds.Tables[2].Compute("sum(proposedlimit)", "facility_cat='Non-Funded'")).ToString();
                TableCell tc4 = new TableCell();
                tc4.Text = "";
                tc4.ColumnSpan = 2;
                GridViewRow gr2 = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);
                gr2.CssClass = "Footer1";
                gr2.Cells.Add(tc3);
                gr2.Cells.Add(tcF);
                gr2.Cells.Add(tcFF);
                gr2.Cells.Add(tc4);

                Table gvTable1 = (Table)e.Row.Parent;
                gvTable1.Controls.Add(gr2);
            }
        }

        protected void Previous(object sender, EventArgs e)
        {
            Response.Redirect("Page2_corp.aspx");
        }
        protected void Next(object sender, EventArgs e)
        {
            Response.Redirect("Summary_corp.aspx");
        }

        protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}