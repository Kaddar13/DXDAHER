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
using DevExpress.DataAccess.Sql;
using DevExpress.DataAccess.ConnectionParameters;
using System.Configuration;
using DevExpress.XtraReports.Web.ReportDesigner;
using DX_DAHERCMS.ToolBox.Etiquette;
using DevExpress.XtraReports.Web.ReportDesigner.Services;


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

            //BindToData();

            switch (task.mode)
            {
                case ReportEdditingMode.NewReport:
                    // Create a new report from the template.
                    Report_Model report = new Report_Model();
                    ASPxReportDesigner1.OpenReport(report);   
                    try
                    {
                        report.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
                        report.DataSource = MyDataSerializer.GenerateActorMembers();
                    }
               catch (Exception ex)
                    {

                    }
                   
                    break;

                    case ReportEdditingMode.ModifyReport:
                    XtraReport report2 = new XtraReport();

                    try
                    {
                        report2.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
                        report2.DataSource = MyDataSerializer.GenerateActorMembers();
                        //BindToData();
                    }
                    catch (Exception ex)
                    {

                    }

                    // Load an existing report from the report storage.
                    ASPxReportDesigner1.OpenReport(task.reportID);
           
                    break;

                    case ReportEdditingMode.OpenReport:
                    // Load an existing report from the report storage.
                                        
                  XtraReport report3 = new XtraReport();
                  try
                  {
                      report3.Extensions[SerializationService.Guid] = MyDataSerializer.Name;
                      report3.DataSource = MyDataSerializer.GenerateActorMembers();
                  }
                  catch (Exception ex)
                  {

                  }
          
                    ASPxReportDesigner1.OpenReport(task.reportID);
                   
                    break;
            }
        }

        //private void BindToData()
        //{
        //    // Create a SQL data source with the specified connection parameters.
        //    //MsSqlConnectionParameters connectionParameters = new MsSqlConnectionParameters(@"DESKTOP-N1I9K33\SQLEXPRESS", "Dashboard", "sa", "Aa123456", MsSqlAuthorizationType.SqlServer);

        //    CustomStringConnectionParameters customstringParams = new CustomStringConnectionParameters();
        //    customstringParams.ConnectionString = ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ToString();

        //    DevExpress.DataAccess.Sql.SqlDataSource ds = new DevExpress.DataAccess.Sql.SqlDataSource(customstringParams);


        //    //DefaultReportDesignerContainer.RegisterDataSourceWizardConnectionStringsProvider<MyDataSourceWizardConnectionStringsProvider>();

        //      // Create a custom SQL query to access the Products data table.
        //    //CustomSqlQuery query = new CustomSqlQuery();
        //    //query.Name = "Quincaillerie";
        //    //query.Sql = "SELECT * FROM T_B1_Quincaillerie";
        //    //ds.Queries.Add(query);
        //    //ds.RebuildResultSchema();

        //    //// Add the created data source to the list of default data sources. 
        //    //ASPxReportDesigner1.DataSources.Add("Northwind", ds);
        //}

       

    }
}