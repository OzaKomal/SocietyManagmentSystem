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
    public partial class ShareTransferRegister : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from Transferring_doc", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdTransfer.DataSource = ds;
                grdTransfer.DataBind();
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
         
        protected void grdTransfer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdTransfer.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Transferring_doc where Document_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdTransfer_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdTransfer.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            txtid.Text = grdTransfer.SelectedRow.Cells[3].Text;
            txtName.Text = grdTransfer.SelectedRow.Cells[4].Text;
            txtDateofTransfer.Text = grdTransfer.SelectedRow.Cells[5].Text;
            txtTransferredNumber.Text = grdTransfer.SelectedRow.Cells[6].Text;
            txtNumberOfShare.Text = grdTransfer.SelectedRow.Cells[7].Text;
            txtCashbookPageNumber.Text = grdTransfer.SelectedRow.Cells[8].Text;
            txtTransferrerName.Text = grdTransfer.SelectedRow.Cells[9].Text;
            txtSecretaryName.Text = grdTransfer.SelectedRow.Cells[10].Text;
            txtChairmanName.Text = grdTransfer.SelectedRow.Cells[11].Text;
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtid.Text = "";
            txtName.Text = "";
            txtCashbookPageNumber.Text= "";
            txtChairmanName.Text = "";
            txtDateofTransfer.Text = "";
            txtNumberOfShare.Text = "";
            txtSecretaryName.Text = "";
            txtTransferredNumber.Text = "";
            txtTransferrerName.Text = "";
            
            
            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdTransfer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdTransfer.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click1(object sender, EventArgs e)
        {
            if (UpdateID.Value.Trim().Equals(""))
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string transferdate = "'" + txtDateofTransfer.Text + "'";
                string transferredno = "'" + txtTransferredNumber.Text + "'";
                string noofshare = "'" + txtNumberOfShare.Text + "'";
                string cashbook = "'" + txtCashbookPageNumber.Text + "'";
                string transferer = "'" + txtTransferrerName.Text + "'";
                string secretary = "'" + txtSecretaryName.Text + "'";
                string chairman = "'" + txtChairmanName.Text + "'";

                string sql = "insert into Transferring_doc(Member_id,Member_name,Dt_of_transfer,Transfered_no,Number_of_share,Cash_book_pgno,Transferer_name,Secretary_name,Chairman_name) values(" + id + "," + name + "," + transferdate + "," + transferredno + "," + noofshare + "," + cashbook + "," + transferer + "," + secretary + "," + chairman + " )";
                execute_updates(sql);
            }
            else
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string transferdate = "'" + txtDateofTransfer.Text + "'";
                string transferredno = "'" + txtTransferredNumber.Text + "'";
                string noofshare = "'" + txtNumberOfShare.Text + "'";
                string cashbook = "'" + txtCashbookPageNumber.Text + "'";
                string transferer = "'" + txtTransferrerName.Text + "'";
                string secretary = "'" + txtSecretaryName.Text + "'";
                string chairman = "'" + txtChairmanName.Text + "'";


                string sql = "update Transferring_doc set Member_id=" + id + ",Member_name= " + name + ",Dt_of_transfer=" + transferdate + ",Transfered_no=" + transferredno + ",Number_of_share=" + noofshare + ",Cash_book_pgno=" + cashbook + ",Transferer_name=" + transferer + ",Secretary_name=" + secretary + ",Chairman_name=" + chairman + " )";

                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }
            

    }
}