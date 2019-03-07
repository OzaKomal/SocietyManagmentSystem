using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace SocietyManagementSystem.User
{
    public partial class Notification : System.Web.UI.Page
    {

        SqlConnection cn;
        String s;
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
                SqlCommand cmd;
                cmd = new SqlCommand("select * from Notice_Details", cn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdNotification.DataSource = ds;
                grdNotification.DataBind();
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
       

        protected void rbNotice_CheckedChanged(object sender, EventArgs e)
        {
            txtType.Text = "notice";
        }

        protected void rbInvitation_CheckedChanged(object sender, EventArgs e)
        {
            txtType.Text = "invitation";
        }

        protected void rbAdvertisement_CheckedChanged(object sender, EventArgs e)
        {
            txtType.Text = "advertisement";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string date = "'" + txtDate.Text + "'";
            string type = "'" + txtType.Text + "'";
            string notice = "'" + txtNotification.Text + "'";
           
                string sql = "insert into Notice_Details(Notice_type,Date_of_notice,Notice) values(" + type + "," + date + "," + notice + ")";
                execute_updates(sql);
            
        }
    }
}