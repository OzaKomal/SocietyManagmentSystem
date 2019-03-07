using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.IO;

namespace SocietyManagementSystem.Admin
{
    public partial class Photograph : System.Web.UI.Page
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

                SqlCommand cmd = new SqlCommand("Select * from Photo_details", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
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
                SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFileName=C:\Users\RIO\Documents\Visual Studio 2010\Projects\SocietyManagementSystem\SocietyManagementSystem\App_Data\Society_data.mdf;Integrated Security=true;User Instance=true;");
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
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileupload1.HasFile)
            
            {
                try
                {
                    if (fileupload1.PostedFile.ContentType == "image/jpeg")
   
                    {
                        if (fileupload1.PostedFile.ContentLength < 512000)
   
                        {
                            string filename = Path.GetFileName(fileupload1.FileName);
                            fileupload1.SaveAs(Server.MapPath("~/") + filename);
                            lblStatus.Text = "File uploaded successfully!";
                        }
                        else
                        {
                            lblStatus.Text = "File maximum size is 500 Kb";
                            
                        }
                    }
                    else
                    {

                        lblStatus.Text = "Only JPEG files are accepted!";
                        
                    }
                }
                catch (Exception exc)
                {
                    lblStatus.Text = "The file could not be uploaded. The following error occured: " + exc.Message;
                    
                }
            }

            showData();
        }
    }
}