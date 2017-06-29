using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.ToolBox.Industrie.MPXP
{
    public partial class MPXP_Traite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            ASPxGridView1.DataSource = SqlDataSource1;
            ASPxGridView1.DataBind();
        }
    }
}