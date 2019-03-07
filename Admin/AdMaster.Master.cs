using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocietyManagementSystem.Admin
{
    public partial class AdMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name;
            name = Convert.ToString(Session["UserAuthentication"]);
            LoginName1.FormatString = name;
        }
    }
}