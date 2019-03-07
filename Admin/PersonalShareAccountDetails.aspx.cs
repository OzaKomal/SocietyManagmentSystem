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
    public partial class PersonalShareAccountDetails : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from Personal_share_doc", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdPersonalShare.DataSource = ds;
                grdPersonalShare.DataBind();
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
         
        protected void grdPersonalShare_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdPersonalShare.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Personal_share_doc where Personal_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdPersonalShare_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdPersonalShare.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            txtid.Text = grdPersonalShare.SelectedRow.Cells[3].Text;
            txtName.Text = grdPersonalShare.SelectedRow.Cells[4].Text;
            txtDate.Text = grdPersonalShare.SelectedRow.Cells[5].Text;
            txtCashBookNumber.Text = grdPersonalShare.SelectedRow.Cells[6].Text;
            txtShareNumber.Text = grdPersonalShare.SelectedRow.Cells[7].Text;
            txtNumberOfShares.Text = grdPersonalShare.SelectedRow.Cells[8].Text;
            txtAmountOfCr.Text = grdPersonalShare.SelectedRow.Cells[9].Text;
            txtAmountOfDr.Text = grdPersonalShare.SelectedRow.Cells[10].Text;
            txtBalance.Text = grdPersonalShare.SelectedRow.Cells[11].Text;
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtid.Text = "";
            txtName.Text = "";
            txtAmountOfCr.Text= "";
            txtAmountOfDr.Text = "";
            txtBalance.Text = "";
            txtCashBookNumber.Text = "";
            txtDate.Text = "";
            txtNumberOfShares.Text = "";
            txtShareNumber.Text = "";
            
            
            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdPersonalShare_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPersonalShare.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (UpdateID.Value.Trim().Equals(""))
            {
                string name = "'" + txtName.Text + "'";
                string date = "'" + txtDate.Text + "'";
                string id = "'" + txtid.Text + "'";
                string cashbook = "'" + txtCashBookNumber.Text +  "'";
                string shareno = "'" + txtShareNumber.Text + "'";
                string noofshare = "'" + txtNumberOfShares.Text + "'";
                string cramount = "'" + txtAmountOfCr.Text + "'";
                string dramount = "'" + txtAmountOfDr.Text + "'";
                string balance = "'" + txtBalance.Text + "'";

                string sql = "insert into Personal_share_doc(Member_id,Member_name,Date,Cashbook_Number,Share_no,Nos_oF_share,Amount_of_cr,Amount_of_dr,Balance) values(" + id + "," + name + "," + date + "," + cashbook + "," + shareno + "," + noofshare + "," + cramount + "," + dramount + "," + balance + " )";
                execute_updates(sql);
                
            }
            else
            {
                string name = "'" + txtName.Text + "'";    
                string date = "'" + txtDate.Text + "'";
                string id = "'" + txtid.Text + "'";
                string cashbook = "'" + txtCashBookNumber.Text + "'";
                string shareno = "'" + txtShareNumber.Text + "'";
                string noofshare = "'" + txtNumberOfShares.Text + "'";
                string cramount = "'" + txtAmountOfCr.Text + "'";
                string dramount = "'" + txtAmountOfDr.Text + "'";
                string balance = "'" + txtBalance.Text  + "'";
                string sql = "update Personal_share_doc set Member_id=" + id + ",Member_name= " + name +  ",Date=" + date + ",Cashbook_Number=" + cashbook + ",Share_no=" + shareno +",Nos_of_share=" + noofshare + ",Amount_of_cr=" + cramount + ",Amount_of_dr=" + dramount + ",Balance=" + balance +  " )";
                
                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }

        

    }
}