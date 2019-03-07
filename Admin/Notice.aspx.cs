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
    public partial class Notice : System.Web.UI.Page
    {
        string s;
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            s = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            cn = new SqlConnection(s);
            if (!IsPostBack)
            {
                showData();
            }
           
        }
        public void showData()
        {
            try
            {
                string val = "notice";
               
                SqlCommand cmd = new SqlCommand("select  * from Notice_Details where Notice_type ='" + val + "'", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdNotice.DataSource = ds;
                grdNotice.DataBind();
                
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
             
                cn = new SqlConnection(s);
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

        protected void grdNotice_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdNotice.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Notice_Details where Notice_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdNotice_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdNotice.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";
            
            txtDate.Text = grdNotice.SelectedRow.Cells[7].Text;
            txtNotice.Text = grdNotice.SelectedRow.Cells[5].Text;
            txtName.Text = grdNotice.SelectedRow.Cells[4].Text;
            txtid.Text = grdNotice.SelectedRow.Cells[3].Text;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

            txtName.Text = "";
            txtid.Text = "";
            txtDate.Text = "";
            txtNotice.Text = "";


            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdNotice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdNotice.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (UpdateID.Value.Trim().Equals(""))
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string date = "'" + DateTime.Parse(txtDate.Text).ToString("dd-MM-yyyy HH:mm:ss") +"'";
                string notice = "'" + txtNotice.Text + "'";
                string note = "'" + "notice" + "'";

                string sql = "insert into Notice_Details(Member_id,Member_name,Date_of_notice,Notice,Notice_type) values(" + id + "," + name + "," +  date + "," + notice + "," + note + ")";
                execute_updates(sql);
            }
            else
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string date = "'" + txtDate.Text + "'";
                string notice = "'" + txtNotice.Text + "'";

                string sql = "update Notice_Details set Date_of_notice=" + date + ",Notice=" + notice + ",Member_id=" + id + " ,Member_name=" + name + ")";

                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }

    }
}