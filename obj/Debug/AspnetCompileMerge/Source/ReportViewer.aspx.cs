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
using DX_DAHERCMS.CatalogReportTableAdapters;

namespace DX_DAHERCMS
{
    public partial class ReportViewer : System.Web.UI.Page
    {
        private CatalogReport catalogDataSet;
        private DataTable reportsTable;
        private ReportsTableAdapter reportsTableAdapter;


        protected void Page_Load(object sender, EventArgs e)
        {
            catalogDataSet = new CatalogReport();
            reportsTableAdapter = new ReportsTableAdapter();
            reportsTableAdapter.Fill(catalogDataSet.Reports);
            reportsTable = catalogDataSet.Tables["Reports"];

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
              
                case ReportEdditingMode.OpenReport:
                    using (MemoryStream readStream = new MemoryStream())
                    {
                        DataRow row = reportsTable.Rows.Find(task.reportID);

                        byte[] reportData = (Byte[])row["LayoutData"];
                        readStream.Write(reportData, 0, reportData.Length);

                        XtraReport newReport = new XtraReport();
                        newReport.LoadLayout(readStream);
                        Viewer.OpenReportXmlLayout(reportData);
                    }
                   

                    
                    break;
            }
        }
    }
}