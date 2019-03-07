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
    public partial class ComplainData : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFileName=C:\Users\RIO\Documents\Visual Studio 2010\Projects\SocietyManagementSystem\SocietyManagementSystem\App_Data\Society_data.mdf;Integrated Security=true;User Instance=true;");
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

                SqlCommand cmd = new SqlCommand("Select * from Complain", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdComplaints.DataSource = ds;
                grdComplaints.DataBind();
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
        protected void grdNotice_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdComplaints.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            
            txtSolution.Text = grdComplaints.SelectedRow.Cells[6].Text;
        }
        protected void btnDone_Click(object sender, EventArgs e)
        {
            string solution = "'" + txtSolution.Text + "'";
            
            
              

                string sql = "update Notice_Details set Solution=" + solution + " )";

                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            
                showData();
                btnCancel_Click(sender, e);

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {


            txtSolution.Text = "";

            btnDone.Text = "Done";
            UpdateID.Value = "";
        }
    }
}