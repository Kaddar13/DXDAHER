using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS
{
    public partial class REC_AOG_INDICATEUR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Refresh", System.Configuration.ConfigurationManager.AppSettings["AOG_Refresh"]);
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "CD_Commentaires")
            {
                e.Cell.ToolTip = e.GetValue("Commentaires").ToString();

            }
        }

 

     
       
    }
}