using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SocietyManagementSystem.User
{
    public partial class Complaints : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFileName=C:\Users\RIO\Documents\Visual Studio 2010\Projects\SocietyManagementSystem\SocietyManagementSystem\App_Data\Society_data.mdf;Integrated Security=true;User Instance=true;");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}