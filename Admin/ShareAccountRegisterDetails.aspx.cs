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
    public partial class ShareAccountRegisterDetails : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from Share_transfer_doc", cn);   
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdShareAccount.DataSource = ds;
                grdShareAccount.DataBind();
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
                s =  WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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

       

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (UpdateID.Value.Trim().Equals(""))
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string sharecertino = "'" + txtShareCertificateNumber.Text + "'";
                string crdate = "'" + txtCRDateOfShare.Text + "'";
                string issuingdate = "'" + txtIssuingDateOfShare + "'";
                string noofshare = "'" + txtNumberOfShares.Text + "'";
                string priceshare = "'" + txtPriceOfShare.Text + "'";
                string transferdate = "'" + txtDateOfTransfer.Text + "'";
                string transferee = "'" + txtTransfereeName.Text + "'";
                string transferer = "'" + txtTransfererName.Text + "'";
                string remarks = "'" + txtRemarks.Text + "'";
                string bank = "'" + txtBank.Text + "'";

                string sql = "insert into Share_transfer_doc(Member_id,Member_name,No_of_sharecertificate,Crdate_of_share,Issuing_date_of_share,Nos_of_share,Price_of_share,Date_of_transfer,Transferee_name,Transferer_name,Remarks,Bank_name_address) values(" + id + "," + name + "," + sharecertino + "," + crdate + "," + issuingdate + "," + noofshare + "," + priceshare + "," + transferdate + "," + transferee + "," + transferer + "," + remarks + "," + bank + " )";
                execute_updates(sql);
            }
            else
            {
                string id = "'" + txtid.Text + "'";
                string name = "'" + txtName.Text + "'";
                string sharecertino = "'" + txtShareCertificateNumber.Text + "'";
                string crdate = "'" + txtCRDateOfShare.Text + "'";
                string issuingdate = "'" + txtIssuingDateOfShare + "'";
                string noofshare = "'" + txtNumberOfShares.Text + "'";
                string priceshare = "'" + txtPriceOfShare.Text + "'";
                string transferdate = "'" + txtDateOfTransfer.Text + "'";
                string transferee = "'" + txtTransfereeName.Text + "'";
                string transferer = "'" + txtTransfererName.Text + "'";
                string remarks = "'" + txtRemarks.Text + "'";
                string bank = "'" + txtBank.Text + "'";

                string sql = "update Share_transfer_doc set Member_id=" + id + ",Member_name= " + name +  ",No_of_sharecertificate=" + sharecertino + ",Crdate_of_share=" + crdate + ",Issuing_date_of_share=" + issuingdate + ",Nos_of_share=" + noofshare + ",Price_of_share=" + priceshare + ",Date_of_transfer=" + transferdate + ",Transferee_name=" + transferee + ",Transferer_name=" + transferer + ",Remarks=" + remarks + ",Bank_name_address=" + bank + " )";  
                   
                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }
        protected void grdShareAccount_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdShareAccount.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Share_transfer_doc where Transfer_id='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdShareAccount_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdShareAccount.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            txtid.Text = grdShareAccount.SelectedRow.Cells[3].Text;
            txtName.Text = grdShareAccount.SelectedRow.Cells[4].Text;
            txtShareCertificateNumber.Text = grdShareAccount.SelectedRow.Cells[5].Text;
            txtCRDateOfShare.Text = grdShareAccount.SelectedRow.Cells[6].Text;
            txtIssuingDateOfShare.Text = grdShareAccount.SelectedRow.Cells[7].Text;
            txtNumberOfShares.Text = grdShareAccount.SelectedRow.Cells[8].Text;
            txtPriceOfShare.Text = grdShareAccount.SelectedRow.Cells[9].Text;
            txtDateOfTransfer.Text = grdShareAccount.SelectedRow.Cells[10].Text;
            txtTransfereeName.Text = grdShareAccount.SelectedRow.Cells[11].Text;
            txtTransfererName.Text = grdShareAccount.SelectedRow.Cells[12].Text;
            txtRemarks.Text = grdShareAccount.SelectedRow.Cells[13].Text;
            txtBank.Text = grdShareAccount.SelectedRow.Cells[14].Text;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtid.Text = "";
            txtBank.Text = "";
            txtCRDateOfShare.Text = "";
            txtDateOfTransfer.Text = "";
            txtIssuingDateOfShare.Text = "";
            txtNumberOfShares.Text = "";
            txtPriceOfShare.Text = "";
            txtRemarks.Text = "";
            txtShareCertificateNumber.Text = "";
            txtTransfereeName.Text = "";
            txtTransfererName.Text = "";
            
            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdShareAccount_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdShareAccount.PageIndex = e.NewPageIndex;
            showData();
        }
            
           
    }
}


    
