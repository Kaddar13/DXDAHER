using DevExpress.DataAccess.Excel;
using DevExpress.XtraReports.Native;
using DevExpress.XtraReports.UI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrinting.Preview;


namespace DX_DAHERCMS
{

    public partial class LABEL_EDITING : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {


            DesignerTask task = (DesignerTask)Session["DesignerTask"];
            if (task != null)
            {
                InitDesignerPage(task);
            }
            else if (!Page.IsCallback)
            {
                Response.Redirect("Default.aspx");
            }

        }

      

     
        private void InitDesignerPage(DesignerTask task)
        {

            switch (task.mode)
            {
                case ReportEdditingMode.NewReport:
                    // Create a new report from the template.
                    XtraReport1 report = new XtraReport1();
                    ASPxReportDesigner1.OpenReport(report);                    
                    report.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
                    report.DataSource = MyDataSerializer.GenerateActorMembers();
                   
                    break;

                    case ReportEdditingMode.ModifyReport:
                    XtraReport report2 = new XtraReport();
                    report2.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
                    report2.DataSource = MyDataSerializer.GenerateActorMembers();
                    // Load an existing report from the report storage.
                    ASPxReportDesigner1.OpenReport(task.reportID);
           
                    break;

                    case ReportEdditingMode.OpenReport:
                    // Load an existing report from the report storage.
                                        
                  XtraReport report3 = new XtraReport();
                    report3.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
                    report3.DataSource = MyDataSerializer.GenerateActorMembers();
                    ASPxReportDesigner1.OpenReport(task.reportID);
                   
                    break;
            }
        }
        

    }
}