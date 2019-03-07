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
    public partial class Inquiry : System.Web.UI.Page
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
                cmd = new SqlCommand("select * from Inquiry_details", cn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdInquiry.DataSource = ds;
                grdInquiry.DataBind();
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

       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = "'" + txtName.Text + "'";
            string email = "'" + txtEmail.Text + "'";
            string contact = "'" + txtContact.Text + "'";
            string message = "'" + txtMessage.Text + "'";


            string sql = "insert into Inquiry_details(Name,Email_id,Contact,Message) values(" + name + "," + email + "," + contact + "," + message + ")";
            execute_updates(sql);

        }
            
           
    }
}

