using DevExpress.XtraReports.Native;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Spreadsheet;
using DevExpress.Spreadsheet.Export;
using System.Data.OleDb;
using System.Xml;
using System.Data.SqlClient;
using System.Configuration;
using DevExpress.DataAccess.Sql;
using DevExpress.DataAccess.ConnectionParameters; 


namespace DX_DAHERCMS
{
    public partial class IMPORT_ACTIVTYTYPE : System.Web.UI.Page
    {
        string fichierXML;
        string fichierTXT;
        //Report_ActivityType report = new Report_ActivityType();
        DataSet dsXML = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            sqlConn.Open();
        }
         
        protected void UPXML_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
            ClassGlobal.FichierNomXML = Server.MapPath("/App_Data/UploadTemp/" + UP_XML.FileName.ToString());
            UP_XML.SaveAs(ClassGlobal.FichierNomXML);

            SqlCommand sqlComm2 = new SqlCommand();
            sqlComm2 = sqlConn.CreateCommand();
            sqlComm2.CommandText = @"DELETE FROM [dbo].[ActivityTypeXML]";
            sqlComm2.ExecuteNonQuery();

            DataTable firstTable = XLSXLMDS.ImportCSVCOMMA().Tables[0];
            BulkInsertDataTable("dbo.ActivityTypeXML", firstTable);

            ASPxGridView1.DataSource = XLSXLMDS.ImportCSVCOMMA().Tables[0];
            ASPxGridView1.DataBind();

        }

        protected void UPTXT_FileUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
            ClassGlobal.FichierNomTXT = Server.MapPath("/App_Data/UploadTemp/" + UP_TXT.FileName.ToString());
            UP_TXT.SaveAs(ClassGlobal.FichierNomTXT);

            SqlCommand sqlComm1 = new SqlCommand();
            sqlComm1 = sqlConn.CreateCommand();
            sqlComm1.CommandText = @"DELETE FROM [dbo].[ActivityTypeA]";
            sqlComm1.ExecuteNonQuery();

            DataTable secondTable = XLSXLMDS.ImportCSVTAB().Tables[0];
            BulkInsertDataTable("dbo.ActivityTypeA", secondTable);

            ASPxGridView1.DataSource = secondTable;
            ASPxGridView1.DataBind();

            SqlCommand sqlComm3 = new SqlCommand();
            sqlComm3 = sqlConn.CreateCommand();
            sqlComm3.CommandText = @"UPDATE [dbo].[ActivityTypeA] SET [     NOT] = LTRIM([     NOT])";
            sqlComm3.ExecuteNonQuery();
        }

        protected void Click_Open(object sender, EventArgs e)
        {           

 

  

        }

public bool BulkInsertDataTable(string tableName, DataTable dataTable)
{
    bool isSuccuss;
    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
    connection.Open();
    //Open bulkcopy connection.
    SqlBulkCopy bulkcopy = new SqlBulkCopy(connection);
    //Set destination table name
    //to table previously created.
    bulkcopy.DestinationTableName = tableName;
    try
    {

        
        bulkcopy.WriteToServer(dataTable);

        isSuccuss = true;
    }
    catch (Exception ex)
    {
        isSuccuss = false;
    }
  
    return isSuccuss;
}
public void Update_Data()
{

    MsSqlConnectionParameters connectionParameters = new MsSqlConnectionParameters("XFLS-DAHER002", "Dashboard", "sa", "%d@her!1120", MsSqlAuthorizationType.SqlServer);
    DevExpress.DataAccess.Sql.SqlDataSource ds = new DevExpress.DataAccess.Sql.SqlDataSource(connectionParameters);
    // Create an SQL query to access fields of the Products data table. 
    CustomSqlQuery query = new CustomSqlQuery();
    query.Name = "customQuery1";
    query.Sql = "SELECT * FROM Report_AT_GareOT";
    ds.Queries.Add(query);
    // Assign the data source to the report.    

    //report.DataSource = ds;
    //report.DataMember = "customQuery1";


    sqlConn.Close();

}

protected void Click_Edition(object sender, EventArgs e)
{
    Update_Data();
    Server.Transfer("ReportList.aspx", true);  
}
    }
}
