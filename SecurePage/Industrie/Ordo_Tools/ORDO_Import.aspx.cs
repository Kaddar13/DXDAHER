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
using System.Diagnostics; 


namespace DX_DAHERCMS.Ordo_Tools
{
    public partial class ORDO_Import : System.Web.UI.Page
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

        protected void UPSAP_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
            ClassGlobal.FichierNomXML = Server.MapPath("/App_Data/UploadTemp/" + UP_XML.FileName.ToString());
            UP_XML.SaveAs(ClassGlobal.FichierNomXML);    

                     
        }

        //protected void UPTXT_FileUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        //{
        //    ClassGlobal.FichierNomTXT = Server.MapPath("/App_Data/UploadTemp/" + UP_TXT.FileName.ToString());
        //    UP_TXT.SaveAs(ClassGlobal.FichierNomTXT);

        //    SqlCommand sqlComm1 = new SqlCommand();
        //    sqlComm1 = sqlConn.CreateCommand();
        //    sqlComm1.CommandText = @"";
        //    sqlComm1.ExecuteNonQuery();

        //    DataTable secondTable = XLSXLMDS.ImportCSVTAB().Tables[0];
        //    BulkInsertDataTable("dbo.ActivityTypeA", secondTable);

        //    SqlCommand sqlComm3 = new SqlCommand();
        //    sqlComm3 = sqlConn.CreateCommand();
        //    sqlComm3.CommandText = @"UPDATE [Dashboard].[dbo].[ActivityTypeA] SET [     NOT] = LTRIM([     NOT])";
        //    sqlComm3.ExecuteNonQuery();
        //}

        protected void Click_Open(object sender, EventArgs e)
        {

        }

        public bool BulkInsertDataTable(string tableName, DataTable dataTable)
        {
            bool isSuccuss;
             sqlConn.Open();
            //Open bulkcopy connection.
             SqlBulkCopy bulkcopy = new SqlBulkCopy(sqlConn);
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
            MsSqlConnectionParameters connectionParameters = new MsSqlConnectionParameters("DESKTOP-N1I9K33/SQLEXPRESS", "Dashboard", "sa", "%d@her!1120", MsSqlAuthorizationType.SqlServer);
            DevExpress.DataAccess.Sql.SqlDataSource ds = new DevExpress.DataAccess.Sql.SqlDataSource(connectionParameters);
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
           
             //Create an SQL query to access fields of the Products data table. 
            CustomSqlQuery query = new CustomSqlQuery();
            query.Name = "customQuery1";
            query.Sql = "SELECT * FROM View1";
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

        protected void Import_Click(object sender, EventArgs e)
        {
            //SqlCommand cmd = new SqlCommand();
            //SqlParameter returnParameter = cmd.Parameters.Add("@return_value", SqlDbType.Int);
            //returnParameter.Direction = ParameterDirection.ReturnValue;
            //cmd.CommandText = "DECLARE	@return_value int EXEC	@return_value = [dbo].[sp_OrdoTraitement] @Fichier= '" + ClassGlobal.FichierNomXML + "'SELECT	'Return Value' = @return_value";
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            string commandText = "DECLARE	@return_value int EXEC	@return_value = [dbo].[sp_OrdoTraitement] @Fichier = N'" + ClassGlobal.FichierNomXML + "'";
            ASPxTextBox1.Text = ClassGlobal.FichierNomXML;


            using (SqlConnection connection = con)
            {
                try
                {
                    int count = 0;
                    SqlCommand command = new SqlCommand(commandText, connection);
                    connection.Open();

                    IAsyncResult result = command.BeginExecuteNonQuery();
                    while (!result.IsCompleted)
                    {

                        Console.WriteLine("Waiting ({0}", count++);
                        // Wait for 1/10 second, so the counter
                        // does not consume all available resources 
                        // on the main thread.
                        System.Threading.Thread.Sleep(100);
                    }
                    ASPxTextBox1.Text =command.EndExecuteNonQuery(result).ToString();
                    //Console.WriteLine("Command complete. Affected {0} rows.",
                    //    command.EndExecuteNonQuery(result));
                }
                catch (SqlException ex)
                {
                    ASPxTextBox1.Text = ex.Message;
                    //Console.WriteLine("Error ({0}): {1}", ex.Number, ex.Message);
                }
                catch (InvalidOperationException ex)
                {
                    ASPxTextBox1.Text = ex.Message;
                    //Console.WriteLine("Error: {0}", ex.Message);
                }
                catch (Exception ex)
                {
                    // You might want to pass these errors
                    // back out to the caller.
                    ASPxTextBox1.Text = ex.Message;
                    //Console.WriteLine("Error: {0}", ex.Message);
                }
            }


            //int id = (int)returnParameter.Value;
            //Console.WriteLine(id.ToString());
            //if (id == 0)
            //{

            //    RadNotification1.Title = "Execution Package.";
            //    RadNotification1.Text = "The package executed successfully.";
            //    RadNotification1.TitleIcon = "info";
            //    RadNotification1.ContentIcon = "info";
            //    RadNotification1.Show();
            //    Param_RetourProc.Value = "The package executed successfully.";
            //}
            //else
            //{
            //    RadNotification1.Title = "Execution Package.";
            //    RadNotification1.Text = "The package failed.";
            //    RadNotification1.TitleIcon = "warning";
            //    RadNotification1.ContentIcon = "warning";
            //    RadNotification1.Show();
            //    Param_RetourProc.Value = "The package failed.";
            //}

        }

      
    }
}
