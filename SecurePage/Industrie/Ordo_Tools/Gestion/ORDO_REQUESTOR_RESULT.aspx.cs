using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DevExpress.DataAccess.Native.Sql;
using DevExpress.XtraPrinting;
using DevExpress.Export;
using DevExpress.Web.ASPxPivotGrid;


namespace DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion
{
    public partial class ORDO_REQUESTOR_RESULT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = Session["selectCommandSQL"].ToString();
            string sql = s.Replace("$", "'");
            Label1.Text = "Resultat de la requete: " + Session["selectName"];
            ASPxGridView1.DataBind();
   
        }

        protected void ASPxGridView1_DataBinding(object sender, EventArgs e)
        {         
            var selectCommand = Session["selectCommandSQL"] as string;
            if (string.IsNullOrEmpty(selectCommand)) return;
            string sql = selectCommand.Replace("$", "'");

            var grid = sender as ASPxGridView;
            grid.DataSource = new SqlDataSource(ConfigurationManager.ConnectionStrings["Dashboard_ordo"].ConnectionString, sql);
            
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse(new XlsExportOptionsEx() { ExportType = ExportType.WYSIWYG });
        }

       


    }
}