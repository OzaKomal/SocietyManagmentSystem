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
    public partial class ShareCertificateDocument : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from Share_certificate", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdShareCerti.DataSource = ds;
                grdShareCerti.DataBind();
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
        protected void grdShareCerti_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdShareCerti.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Share_certificate where Share_transfer_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdShareCerti_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdShareCerti.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            txtid.Text = grdShareCerti.SelectedRow.Cells[3].Text;
            txtName.Text = grdShareCerti.SelectedRow.Cells[4].Text;
            txtTransferNum.Text = grdShareCerti.SelectedRow.Cells[5].Text;
            txtLedger.Text = grdShareCerti.SelectedRow.Cells[6].Text;
            txtTotalshare.Text = grdShareCerti.SelectedRow.Cells[7].Text;
            txtTransferer.Text = grdShareCerti.SelectedRow.Cells[8].Text;
            

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtid.Text = "";
            txtName.Text = "";
            txtLedger.Text = "";
            txtTransferer.Text = "";
            txtTransferNum.Text = "";
            txtTotalshare.Text = "";
            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdShareCerti_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdShareCerti.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (UpdateID.Value.Trim().Equals(""))
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string transfernum = "'" + txtTransferNum.Text + "'";
                string ledger = "'" + txtLedger.Text + "'";
                string transferer = "'" + txtTransferer.Text + "'";
                string total = "'" + txtTotalshare.Text + "'";


                string sql = "insert into Share_certificate(Member_id,Member_name,Transfer_no,Ledger_page_no,Total_share,Transferer_name) values(" + id + "," + name +  "," + transfernum + "," + ledger + "," + total + "," + transferer + " )";
                execute_updates(sql);
            }
            else
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string transfernum = "'" + txtTransferNum.Text + "'";
                string ledger = "'" + txtLedger.Text + "'";
                string transferer = "'" + txtTransferer.Text + "'";
                string total = "'" + txtTotalshare.Text + "'";


                string sql = "update Share_certificate set Member_id=" + id + ",Member_name= " + name + ",Transfer_no=" + transfernum + ",Ledger_page_no=" + ledger + ",Transferer_name=" + transferer + ",Total_share=" + total + ")";

                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }
    }
}
