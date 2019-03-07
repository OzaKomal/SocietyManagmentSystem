using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocietyManagementSystem.User
{
    public partial class ViewNotification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grdAdvertisements.Visible = false;
            grdInvitations.Visible = false;
            grdNotice.Visible = false;
        }

        protected void rbNotice_CheckedChanged(object sender, EventArgs e)
        {
            hfType.Value = "notice";
            grdNotice.Visible = true;
        }

        protected void rbAdvertisment_CheckedChanged(object sender, EventArgs e)
        {
            hfType.Value = "advertisement";
            grdAdvertisements.Visible = true;
        }

        protected void rbInvitation_CheckedChanged(object sender, EventArgs e)
        {
            hfType.Value = "invitation";
            grdInvitations.Visible = true;
        }

       

       
    }
}