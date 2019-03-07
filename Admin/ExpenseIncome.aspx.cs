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
    public partial class ExpenseIncome : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from Expense_Income", cn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                grdExpInc.DataSource = ds;
                grdExpInc.DataBind();
             
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
                showData();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                
            }
        }
        protected void grdExpInc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdExpInc.DataKeys[e.RowIndex].Value.ToString();
            string sql = "Delete from Expense_Income where ID='" + id + "'";
            execute_updates(sql);
            showData();
        }

        protected void grdExpInc_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateID.Value = grdExpInc.SelectedDataKey[0].ToString();
            btnDone.Text = "Update";

            ddlExpInc.SelectedValue = grdExpInc.SelectedRow.Cells[3].Text;
            ddlExpIncType.SelectedValue = grdExpInc.SelectedRow.Cells[4].Text;
            txtAmount.Text = grdExpInc.SelectedRow.Cells[5].Text;
            txtDate.Text = grdExpInc.SelectedRow.Cells[6].Text;
            txtTotalAssets.Text = grdExpInc.SelectedRow.Cells[7].Text;
            txtTotalLiabilities.Text = grdExpInc.SelectedRow.Cells[8].Text;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtAmount.Text = "";
            txtDate.Text = "";
            txtTotalAssets.Text = "";
            txtTotalLiabilities.Text = "";

            btnDone.Text = "Done";
            UpdateID.Value = "";
        }

        protected void grdExpInc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdExpInc.PageIndex = e.NewPageIndex;
            showData();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            string expinc = "'" + ddlExpInc.SelectedValue + "'";
            string type = "'" + ddlExpIncType.SelectedValue + "'";
            string date = "'" + txtDate.Text + "'";
            string amt = "'" + txtAmount.Text + "'";
            if (UpdateID.Value.Trim().Equals(""))
            {
                string sql = "insert into Expense_Income(Expense_or_income,Expense_Income_Type,Amount,Date) values(" + expinc + "," + type + "," + amt + "," + date + ")";
                execute_updates(sql);
            }
            else
            {
                string sql = "update Expense_Income set Expense_or_income=" + expinc + ",Expense_Income_Type=" + type + ",Amount=" + amt + ",Date=" + date + " )";

                execute_updates(sql);
                UpdateID.Value = "";
                btnDone.Text = "Insert";
            }
            showData();
            btnCancel_Click(sender, e);

        }


    }
}