using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace SocietyManagementSystem.Admin
{
    public partial class MaintenanceData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showData();
            }
        }
        public void showData()
        {
            try
            {
               
                String s;
                s = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection cn = new SqlConnection(s);
                SqlCommand cmd = new SqlCommand("select From_Date,To_Date,Yearly_Amount,Monthly_Amount,Quarterly_Amount from Maintenance_data", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdMaintenanceDetail.DataSource = ds;
                grdMaintenanceDetail.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        public void execute_updates(string sql)
        {
            try
            {
                String s;
                s = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection cn = new SqlConnection(s);
                SqlCommand cmd = new SqlCommand(sql, cn);

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
                showData();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void grdMaintenanceDetail_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdMaintenanceDetail.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Maintenance_data where MD_ID='" + id + "'";
            execute_updates(sql);
        }

        protected void grdMaintenanceDetail_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdMaintenanceDetail.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            txtFrom.Text = grdMaintenanceDetail.SelectedRow.Cells[3].Text;
            txtTo.Text = grdMaintenanceDetail.SelectedRow.Cells[4].Text;
            txtYearly.Text = grdMaintenanceDetail.SelectedRow.Cells[5].Text;
            txtMonthly.Text = grdMaintenanceDetail.SelectedRow.Cells[6].Text;
            txtQuarterly.Text = grdMaintenanceDetail.SelectedRow.Cells[7].Text;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtYearly.Text = "";
            txtTo.Text = "";
            txtFrom.Text = "";
            txtMonthly.Text = "";
            txtQuarterly.Text = "";

            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdMaintenanceDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMaintenanceDetail.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            string from = "'"+ txtFrom.Text + "'";
            string to = "'" + txtTo.Text + "'";
            string yearly = "'" + txtYearly.Text + "'";
            string monthly = "'" + txtMonthly.Text + "'";
            string quarterly = "'" + txtQuarterly.Text + "'";

            if (UpdateID.Value.Trim().Equals(""))
            {
                string sql = "insert into Maintenance_data(From_Date,To_Date,Yearly_Amount,Monthly_Amount,Quarterly_Amount) values(" + from + "," + to + "," + yearly + "," + monthly + "," + quarterly + ")";
                execute_updates(sql);
            }
            else
            {


                string sql = "update Maintenance_data set From_Date=" + from + ",To_Date=" + to + ",Yearly_Amount=" + yearly + ",Monthly_Amount=" + monthly + ",Quarterly_Amount=" + quarterly + " )";
                 
                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            
            btnCancel_Click(sender, e);

        }
    }
}