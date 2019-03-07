using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SocietyManagementSystem.Admin
{
    public partial class InquiryData : System.Web.UI.Page
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

                SqlCommand cmd = new SqlCommand("Select Name,Email_id,Contact,Message from Inquiry_details", cn);
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
    }
}