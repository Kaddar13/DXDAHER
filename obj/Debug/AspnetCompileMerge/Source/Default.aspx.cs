using DevExpress.XtraReports.Native;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS
{
    public partial class Default2 : System.Web.UI.Page
    {
        public static string CSVsrc;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadControl_FileUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
            UP.SaveAs(Server.MapPath("App_Data/UploadTemp/" + UP.FileName.ToString()));
            CSVsrc = "App_Data/UploadTemp/" + UP.FileName.ToString();
            ClassGlobal.CheminFichier = Server.MapPath("App_Data/UploadTemp/" + UP.FileName.ToString());

            XtraReport report = new XtraReport();
           
            report.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
            report.DataSource = MyDataSerializer.GenerateActorMembers();

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
                             Server.Transfer("ReportList.aspx", true);
        }
    }
}