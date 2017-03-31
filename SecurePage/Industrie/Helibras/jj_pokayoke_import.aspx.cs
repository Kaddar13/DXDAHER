using DevExpress.DataAccess.ConnectionParameters;
using DevExpress.DataAccess.Sql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace DX_DAHERCMS.SecurePage.Industrie.Helibras
{
    public partial class jj_pokayoke_import : System.Web.UI.Page
    {

        string fichierXML;
        string fichierTXT;
        //Report_ActivityType report = new Report_ActivityType();
        DataSet dsXML = new DataSet();
        SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
       
            {
                try
                {
                    string path = string.Concat(Server.MapPath("~/App_Data/UploadTemp/" + FileUpload1.FileName));
                    FileUpload1.SaveAs(path);
                    Label1.Text = path;
                    // Connection String to Excel Workbook
                    string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                    OleDbConnection connection = new OleDbConnection();
                    connection.ConnectionString = excelConnectionString;
                    OleDbCommand command = new OleDbCommand("select * from [Feuil1$]", connection);
                    connection.Open();
                    // Create DbDataReader to Data Worksheet
                    DbDataReader dr = command.ExecuteReader();

                    // SQL Server Connection String
                    //string sqlConnectionString = @"Data Source=MYPC;Initial Catalog=Student;User ID=sa;Password=wintellect";
                    sqlConn.Open();
                    // Bulk Copy to SQL Server 
                    SqlBulkCopy bulkInsert = new SqlBulkCopy(sqlConn);
                    bulkInsert.DestinationTableName = "T_JJ_SAP";
                    bulkInsert.WriteToServer(dr);
                    Label1.Text = "Fichier Importé";
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
            }
        }
       
    }
}