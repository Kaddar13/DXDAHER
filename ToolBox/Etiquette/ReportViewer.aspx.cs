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
using Microsoft.Win32.SafeHandles;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.Drawing;
using System.Text;
using System.Runtime.InteropServices;
using Microsoft.Reporting.WebForms;
using RawPrint;
using DevExpress.XtraReports.Web.ReportDesigner;

namespace DX_DAHERCMS
{
    public partial class ReportViewer : System.Web.UI.Page
    {
        private Font printFont;
        private StreamReader streamToPrint;
        static string filePath;
        private CatalogReport catalogDataSet;
        private DataTable reportsTable;
        private ReportsTableAdapter reportsTableAdapter;
        XtraReport newReport = new XtraReport();

        protected void Page_Load(object sender, EventArgs e)
        {
            PrinterList();
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
                Response.Redirect("ReportList.aspx");
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

                       
                        newReport.LoadLayout(readStream);
                        Viewer.OpenReportXmlLayout(reportData);
                    }
                   

                    
                    break;
            }
        }

        private void PrinterList()
        {
            // POPULATE THE COMBO BOX.
            foreach (string sPrinters in System.Drawing.Printing.PrinterSettings.InstalledPrinters)
            {
                ASPxComboBox1.Items.Add(sPrinters);
            }

            // POPULATE THE LIST BOX.
            foreach (string sPrinters in System.Drawing.Printing.PrinterSettings.InstalledPrinters)
            {
                ASPxComboBox1.Items.Add(sPrinters);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


             string reportPath = "c:\\temp\\Test.pdf";
             PdfExportOptions pdfOptions = newReport.ExportOptions.Pdf;
             newReport.ExportToPdf(reportPath);


            Printer.PrintFile(ASPxComboBox1.Text,reportPath, "Document Name");

            //StreamReader streamToPrint = new StreamReader(reportPath);
            //PrintDocument pd = new PrintDocument();
            //pd.PrinterSettings.PrinterName = ASPxComboBox1.Text.ToString();
            //pd.Print();
    
                            

            //// Show the result.
            //StartProcess(reportPath);

            //PrintZpl(reportPath);
          

        }


 

    }
}