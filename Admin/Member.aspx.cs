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
   
    public partial class Member : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("Select * from Member_details", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                
                da.Fill(ds);

                grdMember.DataSource = ds;
                grdMember.DataBind();
               
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
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string name = "'" + txtName.Text + "'";
            string email = "'" + txtEmail.Text + "'";
            string contact = "'" + txtContact.Text + "'";
            string birthdate = "'" + txtBirthdate.Text + "'";
            string IsAdmin = "'" + txtAdmin.Text + "'";
            
            if (UpdateID.Value.Trim().Equals(""))
            {
                string sql = "insert into Member_details(Member_name,Contact_no,Email_id,Birthdate,isAdmin) values(" + name + "," + contact + "," + email + "," + birthdate + "," + IsAdmin + ")";
                execute_updates(sql);
            }
            else
            {
                string sql = "Update Member_details set Member_name=" + name + ", Contact_no=" + contact + ", Email_id=" + email + ", Birthdate=" + birthdate + ", isAdmin=" + IsAdmin + " where Member_id ='" + UpdateID.Value + "'";
                execute_updates(sql);
                UpdateID.Value = "";
                btnInsert.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtUser.Text = "";
            txtPass.Text = "";
            txtName.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            txtBirthdate.Text = "";
            txtAdmin.Text = "";
            btnInsert.Text = "Insert";
            UpdateID.Value = "";
        }
        protected void grdMember_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdMember.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Member_details where Member_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdMember.SelectedDataKey[0].ToString();
            btnInsert.Text = "Update";

            txtName.Text = grdMember.SelectedRow.Cells[3].Text;
            txtContact.Text = grdMember.SelectedRow.Cells[4].Text;
            txtEmail.Text = grdMember.SelectedRow.Cells[5].Text;
            txtBirthdate.Text = grdMember.SelectedRow.Cells[6].Text;
            txtAdmin.Text = grdMember.SelectedRow.Cells[7].Text;
            txtUser.Text = grdMember.SelectedRow.Cells[8].Text;
            txtPass.Text = grdMember.SelectedRow.Cells[9].Text;
        }
        protected void grdMember_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMember.PageIndex = e.NewPageIndex;
            showData();
        }

    }
}