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
    public partial class Meeting : System.Web.UI.Page
    {

    
        SqlCommand cmd;
        String s;

        protected void Page_Load(object sender, EventArgs e)
        {
            s = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            if (!IsPostBack)
            {
                showData();
            }
        }
        public void showData()
        {
            try
            {
               
                SqlConnection cn = new SqlConnection(s);
                cmd = new SqlCommand("select * from Meeting", cn);        
               
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdMeeting.DataSource = ds;
                grdMeeting.DataBind();
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
                SqlConnection cn = new SqlConnection(s);
                cmd = new SqlCommand(sql, cn);

                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void grdMeeting_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdMeeting.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Meeting where Meeting_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdMeeting_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdMeeting.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            txtType.Text = grdMeeting.SelectedRow.Cells[3].Text;
            txtDate.Text = grdMeeting.SelectedRow.Cells[4].Text;
            txtConclusion.Text = grdMeeting.SelectedRow.Cells[5].Text;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtDate.Text = "";
            txtConclusion.Text = "";
            txtType.Text = "";

            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdMeeting_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMeeting.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            string date = "'" + txtDate.Text + "'";
            string type = "'" + txtType.Text + "'";
            string conclusion = "'" + txtConclusion.Text + "'";
            if (UpdateID.Value.Trim().Equals(""))
            {
                string sql = "insert into Meeting(Meeting_type,Date,Remarks) values(" + type + "," + date + "," + conclusion + ")";
                execute_updates(sql);
            }
            else
            {
                string sql = "update Meeting set Meeting_type=" + type + ",Date=" + date + ",Remarks=" + conclusion + " )";

                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            
            showData();
            btnCancel_Click(sender, e);
        }
    }
}