using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DX_DAHERCMS.CatalogReportTableAdapters;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Native;
using System.IO;

namespace DX_DAHERCMS
{
     

    public partial class Default : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                reportsList.DataSource = catalogDataSet;
                reportsList.DataMember = "Reports";
                reportsList.DataTextField = "DisplayName";
                reportsList.DataValueField = "ReportID";
                
                this.DataBind();
            }
        }


        protected void NewReportButton_Click(object sender, EventArgs e)
        {
            Session["DesignerTask"] = new DesignerTask
            {
                mode = ReportEdditingMode.NewReport,
            };
            Response.Redirect("ReportDesigner.aspx");
        }


        protected void EditButton_Click(object sender, EventArgs e)
        {
            ListItem selected = reportsList.SelectedItem;
            if (selected != null)
            {
                Session["DesignerTask"] = new DesignerTask
                {
                    mode = ReportEdditingMode.ModifyReport,
                    reportID = selected.Value

                };

                Session["ReportID"] = selected.Value;
                Response.Redirect("ReportDesigner.aspx");
            }
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            ListItem selected = reportsList.SelectedItem;

            if (selected != null)
            {
                DataRow row = reportsTable.Rows.Find(int.Parse(selected.Value));
                if (row != null)
                {
                    row.Delete();
                    reportsTableAdapter.Update(catalogDataSet);
                    catalogDataSet.AcceptChanges();
                }
                reportsList.Items.Remove(reportsList.SelectedItem);
            }
        }

        protected void Open_Click(object sender, EventArgs e)
        {
            ListItem selected = reportsList.SelectedItem;
            if (selected != null)
            {
                Session["DesignerTask"] = new DesignerTask
                {
                    mode = ReportEdditingMode.OpenReport,
                    reportID = selected.Value
                };
                Session["ReportID"] = selected.Value;
                Response.Redirect("ReportViewer.aspx");
            }


            ///////////////////////

          
        }
            
        

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            // Create an empty report.
            XtraReport report = new XtraReport();
            report.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
            report.DataSource = MyDataSerializer.GenerateActorMembers();
            //// Show the report's print preview.
            //ASPxReportDesigner1.OpenReport(report);

        }


    }
}