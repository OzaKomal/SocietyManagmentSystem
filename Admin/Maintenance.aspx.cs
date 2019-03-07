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
    public partial class Maintenance : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from Maintenance_Details", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdMaintenance.DataSource = ds;
                grdMaintenance.DataBind();
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
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            int i;
            string day, month, year,date;
            txtfrom.Text = Calendar1.SelectedDate.ToString();
            if (Ddltype.SelectedValue == "Monthly")
            {
                i = Calendar1.SelectedDate.Month;
                day = Calendar1.SelectedDate.Day.ToString();
                year = Calendar1.SelectedDate.Year.ToString();
                i = i + 1;
                date = day + "/" + i + "/" + year;
                txtto.Text = date;

            }
            if (Ddltype.SelectedValue == "Quaterly")
            {
                i = Calendar1.SelectedDate.Month;
                day = Calendar1.SelectedDate.Day.ToString();
                year = Calendar1.SelectedDate.Year.ToString();
                i = i + 3;
                date = day + "/" + i + "/" + year;
                txtto.Text = date;


            }
            if (Ddltype.SelectedValue == "Yearly")
            {
                month = Calendar1.SelectedDate.Month.ToString();
                day = Calendar1.SelectedDate.Day.ToString();
                i = Calendar1.SelectedDate.Year;
                i = i + 1;
                date = day + "/" + month + "/" + i;
                txtto.Text = date;

            }

        }
        protected void grdMaintenance_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdMaintenance.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Maintenance_Details where M_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdMaintenance_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdMaintenance.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            txtid.Text = grdMaintenance.SelectedRow.Cells[3].Text;
            txtName.Text = grdMaintenance.SelectedRow.Cells[4].Text;
            txtfrom.Text = grdMaintenance.SelectedRow.Cells[5].Text;
            txtto.Text = grdMaintenance.SelectedRow.Cells[6].Text;
            txtamtpaid.Text = grdMaintenance.SelectedRow.Cells[7].Text;
            txtRemaining.Text = grdMaintenance.SelectedRow.Cells[8].Text;
            txtActualAmt.Text = grdMaintenance.SelectedRow.Cells[9].Text;
            Ddltype.SelectedValue = grdMaintenance.SelectedRow.Cells[10].Text;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtActualAmt.Text = "";
            txtamtpaid.Text = "";
            txtRemaining.Text = "";
            txtid.Text = "";
            txtfrom.Text = "";
            txtto.Text = "";
            txtid.Text = "";
            txtName.Text = "";

            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdMaintenance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMaintenance.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            string paid = "'" + txtamtpaid.Text + "'";
            string actual = "'" + txtActualAmt.Text + "'";
            string remain = "'" + txtRemaining.Text + "'";
            string from = "'" + txtfrom.Text + "'";
            string to = "'" + txtto.Text + "'";
            string id = "'" + txtid.Text + "'";
            string name = "'" + txtName.Text + "'";
            string type = "'" + Ddltype.SelectedValue + "'";
            
            if (UpdateID.Value.Trim().Equals(""))
            {
                string sql = "insert into Maintenance_Details(Member_id,Member_name,From_date,To_date,Paid_amount,Remaining_amount,Actual_amount,Payment_type) values(" + id + "," + name + "," + from + "," + to + "," + paid + "," + remain + "," + actual + "," + type + ")";
                execute_updates(sql);
            }
            else
            {
                string sql = "update Maintenance_Details set Member_id=" + id + ",Member_name=" + name + ",From_date=" + from + ",To_date=" + to + ",Paid_amount=" + paid + ",Remaining_amount=" + remain + ",Actual_amount=" + actual + ",Payment_type=" + type + " )";

                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }

    }
}