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
    public partial class FlatDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void showData()
        {
            SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFileName=C:\Users\RIO\Documents\Visual Studio 2010\Projects\SocietyDemo\SocietyDemo\App_Data\Society_Details.mdf;Integrated Security=true;User Instance=true;");
            SqlCommand cmd = new SqlCommand("select * from Flat_Block", cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            grdFlat.DataSource = ds;
            grdFlat.DataBind();
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

        protected void grdFlat_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdFlat.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Flat_Block where Block_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdFlat_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdFlat.SelectedDataKey[0].ToString();
            btnSubmit.Text = "Update";

            txtSocName.Text = grdFlat.SelectedRow.Cells[3].Text;
            txtBlockName.Text = grdFlat.SelectedRow.Cells[4].Text;
            txtTotalFlat.Text = grdFlat.SelectedRow.Cells[5].Text;
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtTotalFlat.Text = "";
            txtSocName.Text = "";
            txtBlockName.Text = "";
            btnSubmit.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdFlat_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdFlat.PageIndex = e.NewPageIndex;
            showData();
        }

       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (UpdateID.Value.Trim().Equals(""))
            {

                string soc = "'" + txtSocName.Text + "'";
                string block = "'" + txtBlockName.Text + "'";
                string tot = "'" + txtTotalFlat.Text + "'";

                string sql = "insert into Flat_Block(Society_name,Block_name,Total_flats) values(" + soc + "," + block + "," + tot + ")";
                execute_updates(sql);
            }
            else
            {
                string soc = "'" + txtSocName.Text + "'";
                string block = "'" + txtBlockName.Text + "'";
                string tot = "'" + txtTotalFlat.Text + "'";
                

                string sql = "update Flat_Block set Society_name=" + soc + ",Block_name=" + block + ",Total_flats=" + tot +  " )";

                execute_updates(sql);
                UpdateID.Value = "";
                btnSubmit.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }
    }
}