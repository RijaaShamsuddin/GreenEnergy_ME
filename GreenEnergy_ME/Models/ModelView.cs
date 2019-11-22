using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using CIIRSUtility;
using System.Data.Sql;

namespace GreenEnergy_ME.Models
{
    public class ModelView
    {
        private dbAccess db = new dbAccess();

        public DataTable get_brwrtype(string client_no)
        {
            try
            {
                this.db.Cn.Open();
                this.db.Cmd.CommandType = CommandType.Text;
                this.db.Cmd.CommandTimeout = 0;
                string st = "Select max(yr)yr, brwr_type,client_no from Brwr_Rating where client_no = '"+ client_no + "' group by brwr_type,client_no order by yr desc ";
                this.db.Cmd.CommandText = st;
                this.db.Da.SelectCommand = this.db.Cmd;
                DataTable dt = new DataTable();
                this.db.Da.Fill(dt);
                this.db.Cn.Close();
                st = "";
                return dt;

            }
            catch (Exception exception)
            {
                //return dt = null;
                throw exception;
            }
        }

        public DataTable get_marketinfo(string client_no, string cpno)
        {
            try
            {
                this.db.Cn.Open();
                this.db.Cmd.CommandType = CommandType.Text;
                this.db.Cmd.CommandTimeout = 0;
                string st = "Select top 1* from Market_info where client_no = '" + client_no + "' and cpno = '" + cpno + "' order by id desc ";    
                this.db.Cmd.CommandText = st;
                this.db.Da.SelectCommand = this.db.Cmd;
                DataTable dt = new DataTable();
                this.db.Da.Fill(dt);
                this.db.Cn.Close();
                st = "";
                return dt;

            }
            catch (Exception exception)
            {
                //return dt = null;
                throw exception;
            }
        }

        public int Add_MarketInfo_Details(string client_no, string cpno, int brwr_type, string supp_name, double supp_cash,
            double supp_credit, string supp_tenor, string cust_name, double cust_cash, double cust_credit, string cust_tenor, ref string error_status)
        {

            int vstatus = 0;
            try
            {
                this.db.Cn.Open();
                this.db.Cmd.CommandType = CommandType.Text;
                this.db.Cmd.CommandTimeout = 0;
                this.db.Cmd.CommandText = "INSERT INTO Market_info (client_no , cpno, brwr_type, supp_name, supp_cash, supp_credit, supp_tenor, cust_name,cust_cash,cust_credit,cust_tenor) "
                   + " VALUES ('" + client_no + "' , '" + cpno + "', " + brwr_type + " , '" + supp_name + "' , " + supp_cash + ", "
                   + " " + supp_credit + ", '" + supp_tenor + "' , '" + cust_name + "' , " + cust_cash + " , " + cust_credit + ", '" + cust_tenor + "')";
                vstatus = this.db.cmd.ExecuteNonQuery();
                //this.db.Da.SelectCommand = this.db.Cmd;
                //DataTable dt = new DataTable();
                this.db.Cn.Close();

                return vstatus;

            }
            catch (Exception exception)
            {
                return vstatus = 0;
                throw exception;
            }

        }

        public int Update_MarketInfo_Details(string client_no, string cpno, int brwr_type, string supp_name, double supp_cash,
            double supp_credit, string supp_tenor, string cust_name, double cust_cash, double cust_credit, string cust_tenor, ref string error_status)
        {

            int vstatus = 0;
            try
            {
                this.db.Cn.Open();
                this.db.Cmd.CommandType = CommandType.Text;
                this.db.Cmd.CommandTimeout = 0;
                this.db.Cmd.CommandText = "UPDATE Market_info SET supp_name = '" + supp_name + "', supp_cash = " + supp_cash + " , supp_tenor = '" + supp_tenor + "' , supp_credit = " + supp_credit + ", "
                    + "cust_name = '" + cust_name + "' ,cust_cash = " + cust_cash + " ,cust_credit =" + cust_credit + ", cust_tenor = '" + cust_tenor + "' "
                    + "where client_no = '" + client_no + "' and cpno = '" + cpno + "' and id = (Select max(Id)Id from Market_info where client_no = '" + client_no + "')  ";
                vstatus = this.db.cmd.ExecuteNonQuery();
                //this.db.Da.SelectCommand = this.db.Cmd;
                //DataTable dt = new DataTable();
                this.db.Cn.Close();

                return vstatus;

            }
            catch (Exception ex)
            {
                error_status = (ex.Message.ToString()).Replace("'", ""); ;
                return vstatus = 0;
                //throw exception;
            }

        }

        public DataTable get_guaranteeinfo(string client_no, string cpno)
        {
            try
            {
                this.db.Cn.Open();
                this.db.Cmd.CommandType = CommandType.Text;
                this.db.Cmd.CommandTimeout = 0;
                string st = "Select top 1 * from Guarantees where client_no = '" + client_no + "' and cpno = '" + cpno + "' order by id desc ";
                this.db.Cmd.CommandText = st;
                this.db.Da.SelectCommand = this.db.Cmd;
                DataTable dt = new DataTable();
                this.db.Da.Fill(dt);
                this.db.Cn.Close();
                st = "";
                return dt;

            }
            catch (Exception exception)
            {
                //return dt = null;
                throw exception;
            }
        }

        public int Add_Guarantees(string client_no, string cpno, int brwr_type, string guarantor_name, string guarantee_given,
            double amt_guarantee, string validity_period, double networth_guarantor, ref string error_status)
        {

            int vstatus = 0;
            try
            {
                this.db.Cn.Open();
                this.db.Cmd.CommandType = CommandType.Text;
                this.db.Cmd.CommandTimeout = 0;
                this.db.Cmd.CommandText = "INSERT INTO Guarantees (client_no , cpno, brwr_type, guarantor_name, guarantee_given, amt_guarantee,  validity_period,  networth_guarantor) "
                   + " VALUES ('" + client_no + "' , '" + cpno + "', " + brwr_type + " , '" + guarantor_name + "' , '" + guarantee_given + "', " + amt_guarantee + ", '" + validity_period + "' , " + networth_guarantor + ")";
                vstatus = this.db.cmd.ExecuteNonQuery();
                //this.db.Da.SelectCommand = this.db.Cmd;
                //DataTable dt = new DataTable();
                this.db.Cn.Close();

                return vstatus;

            }
            catch (Exception exception)
            {
                return vstatus = 0;
                throw exception;
            }

        }

        public int Update_Guarantees(string client_no, string cpno, int brwr_type, string guarantor_name, string guarantee_given,
            double amt_guarantee, string validity_period, double networth_guarantor, ref string error_status)
        {

            int vstatus = 0;
            try
            {
                this.db.Cn.Open();
                this.db.Cmd.CommandType = CommandType.Text;
                this.db.Cmd.CommandTimeout = 0;
                this.db.Cmd.CommandText = "UPDATE Guarantees SET guarantor_name = '" + guarantor_name + "', guarantee_given = '" + guarantee_given + "' , amt_guarantee = " + amt_guarantee + ", "
                    + "validity_period = '" + validity_period + "' ,networth_guarantor = " + networth_guarantor + " "
                    + "where client_no = '" + client_no + "' and cpno = '" + cpno + "' and id = (Select max(Id)Id from Guarantees where client_no = '" + client_no + "') ";
                vstatus = this.db.cmd.ExecuteNonQuery();
                //this.db.Da.SelectCommand = this.db.Cmd;
                //DataTable dt = new DataTable();
                this.db.Cn.Close();

                return vstatus;

            }
            catch (Exception ex)
            {
                error_status = (ex.Message.ToString()).Replace("'", ""); ;
                return vstatus = 0;
                //throw exception;
            }

        }
    }
}