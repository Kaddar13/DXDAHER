using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text; 

using Microsoft.VisualBasic.FileIO;
using System.Net;
using System.Net.Mail;

namespace DX_DAHERCMS.ToolBox.SPEEDUP
{
    public partial class SU_IMPORT : System.Web.UI.Page
    {
        protected const int _batchSize = 100000;
        private bool isExecuting;
        private SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UPSAP_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
            string excelPath = Server.MapPath("/App_Data/UploadTemp/" + UP_XML.FileName.ToString());
            UP_XML.SaveAs(excelPath);

            var createdCount = 0;

            using (var textFieldParser = new TextFieldParser(excelPath))
            {
                textFieldParser.TextFieldType = FieldType.Delimited;
                textFieldParser.Delimiters = new[] { "," };
                textFieldParser.HasFieldsEnclosedInQuotes = true;


                var dataTable = new DataTable("YourTableName");

                // Add the columns in the temp table
                //dataTable.Columns.Add("FirstName");
                //dataTable.Columns.Add("LastName");
                 dataTable.Columns.Add("N° Bon");
                 dataTable.Columns.Add("Référenceélémentdistribué");
                 dataTable.Columns.Add("Libellé type de flux");
                 dataTable.Columns.Add("Date de création");
                 dataTable.Columns.Add("Date de 1ère prise");
                 dataTable.Columns.Add("Date de remise");
                 dataTable.Columns.Add("Nb de colis contenus");
                 dataTable.Columns.Add("Gare de départ");
                 dataTable.Columns.Add("Gare de destination");
                 dataTable.Columns.Add("Délai de distribution");
                 dataTable.Columns.Add("Délai de livraison");
                 dataTable.Columns.Add("Statut");
                 dataTable.Columns.Add("Autre identifiant");
                 dataTable.Columns.Add("A l'attention de");
                 dataTable.Columns.Add("Informations");
                 dataTable.Columns.Add("Date clôture");
                 dataTable.Columns.Add("Date dernière position");
                 dataTable.Columns.Add("Gare dernière position");
                 dataTable.Columns.Add("SPEEDUP");
                 dataTable.Columns.Add("SITECREATION");
                 dataTable.Columns.Add("SITEDEPOSE");
                 dataTable.Columns.Add("TOURNEE");
                 dataTable.Columns.Add("NBUM");
                 


                using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString))
                {
                    sqlConnection.Open();
                    //SqlCommand sqlComm2 = new SqlCommand();
                    //sqlComm2 = sqlConnection.CreateCommand();
                    //sqlComm2.CommandText = @"DELETE FROM [dbo].[T_OD2_SPEEDUP_TEMP]";
                    //sqlComm2.ExecuteNonQuery();


                    // Create the bulk copy object
                    var sqlBulkCopy = new SqlBulkCopy(sqlConnection)
                    {
                        DestinationTableName = "[dbo].[T_OD2_SPEEDUP_TEMP]"
                    };

                    //// Setup the column mappings, anything ommitted is skipped
                    //sqlBulkCopy.ColumnMappings.Add("FirstName", "FirstName");
                    //sqlBulkCopy.ColumnMappings.Add("LastName", "LastName");
                    sqlBulkCopy.ColumnMappings.Add("N° Bon", "N° Bon");
                    sqlBulkCopy.ColumnMappings.Add("Référenceélémentdistribué", "Référenceélémentdistribué");
                    sqlBulkCopy.ColumnMappings.Add("Libellé type de flux", "Libellé type de flux");
                    sqlBulkCopy.ColumnMappings.Add("Date de création", "Date de création");
                    sqlBulkCopy.ColumnMappings.Add("Date de 1ère prise", "Date de 1ère prise");
                    sqlBulkCopy.ColumnMappings.Add("Date de remise", "Date de remise");
                    sqlBulkCopy.ColumnMappings.Add("Nb de colis contenus", "Nb de colis contenus");
                    sqlBulkCopy.ColumnMappings.Add("Gare de départ", "Gare de départ");
                    sqlBulkCopy.ColumnMappings.Add("Gare de destination", "Gare de destination");
                    sqlBulkCopy.ColumnMappings.Add("Délai de distribution", "Délai de distribution");
                    sqlBulkCopy.ColumnMappings.Add("Délai de livraison", "Délai de livraison");
                    sqlBulkCopy.ColumnMappings.Add("Statut", "Statut");
                    sqlBulkCopy.ColumnMappings.Add("Autre identifiant", "Autre identifiant");
                    sqlBulkCopy.ColumnMappings.Add("A l'attention de", "A l'attention de");
                    sqlBulkCopy.ColumnMappings.Add("Informations", "Informations");
                    sqlBulkCopy.ColumnMappings.Add("Date clôture", "Date clôture");
                    sqlBulkCopy.ColumnMappings.Add("Date dernière position", "Date dernière position");
                    sqlBulkCopy.ColumnMappings.Add("Gare dernière position", "Gare dernière position");
                    sqlBulkCopy.ColumnMappings.Add("SPEEDUP", "FL3");
                    sqlBulkCopy.ColumnMappings.Add("SITECREATION", "SITECREATION");
                    sqlBulkCopy.ColumnMappings.Add("SITEDEPOSE", "SITEDEPOSE");
                    sqlBulkCopy.ColumnMappings.Add("TOURNEE", "TOURNEE");
                    sqlBulkCopy.ColumnMappings.Add("NBUM", "NBUM");
                    

                    // Loop through the CSV and load each set of 100,000 records into a DataTable
                    // Then send it to the LiveTable
                    while (!textFieldParser.EndOfData)
                    {
                        dataTable.Rows.Add(textFieldParser.ReadFields());

                        createdCount++;

                        if (createdCount % _batchSize == 0)
                        {
                            InsertDataTable(sqlBulkCopy, sqlConnection, dataTable);

                            break;
                        }
                    }

                    // Don't forget to send the last batch under 100,000
                    InsertDataTable(sqlBulkCopy, sqlConnection, dataTable);

                    sqlConnection.Close();
                }
            }
        }

        protected void InsertDataTable(SqlBulkCopy sqlBulkCopy, SqlConnection sqlConnection, DataTable dataTable)
        {
            sqlBulkCopy.WriteToServer(dataTable);

            dataTable.Rows.Clear();
        }
            

        protected void UP_BON102_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
            string excelPath = Server.MapPath("/App_Data/UploadTemp/" + UP_BON102.FileName.ToString());
            UP_BON102.SaveAs(excelPath);

            var createdCount = 0;

            using (var textFieldParser = new TextFieldParser(excelPath))
            {
                textFieldParser.TextFieldType = FieldType.Delimited;
                textFieldParser.Delimiters = new[] { "," };
                textFieldParser.HasFieldsEnclosedInQuotes = true;

                var dataTable = new DataTable("YourTableName2");

                // Add the columns in the temp table        
                dataTable.Columns.Add("N° Bon");
                dataTable.Columns.Add("Référenceélémentdistribué");
                dataTable.Columns.Add("Libellé type de flux");
                dataTable.Columns.Add("Date de création");
                dataTable.Columns.Add("Date de 1ère prise");
                dataTable.Columns.Add("Date de remise");
                dataTable.Columns.Add("Nb de colis contenus");
                dataTable.Columns.Add("Gare de départ");
                dataTable.Columns.Add("Gare de destination");
                dataTable.Columns.Add("Délai de distribution");
                dataTable.Columns.Add("Délai de livraison");
                dataTable.Columns.Add("Statut");
                dataTable.Columns.Add("Autre identifiant");
                dataTable.Columns.Add("A l'attention de");
                dataTable.Columns.Add("Informations");
                dataTable.Columns.Add("Date clôture");
                dataTable.Columns.Add("Date dernière position");
                dataTable.Columns.Add("Gare dernière position");
                dataTable.Columns.Add("TOURNEE");
                dataTable.Columns.Add("MATERIELAERO");
                dataTable.Columns.Add("SPEEDUP");
                dataTable.Columns.Add("COMMANDE");
                dataTable.Columns.Add("EMBALLAGE");
                dataTable.Columns.Add("FOURNISSEUR");
                dataTable.Columns.Add("TELEPHONE");
                dataTable.Columns.Add("ZLECI");
                dataTable.Columns.Add("ADRESSEDEMANDEUR");
                dataTable.Columns.Add("NBPIECES");
                dataTable.Columns.Add("ENCASABSENCE");

                #region  SQL
                using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString))
                {
                    sqlConnection.Open();
                    SqlCommand sqlComm2 = new SqlCommand();
                    sqlComm2 = sqlConnection.CreateCommand();
                    //sqlComm2.CommandText = @"DELETE FROM [dbo].[T_OD2_SPEEDUP]";
                    //sqlComm2.ExecuteNonQuery();


                    // Create the bulk copy object
                    var sqlBulkCopy = new SqlBulkCopy(sqlConnection)
                    {
                        DestinationTableName = "[dbo].[T_OD2_SPEEDUP_TEMP]"
                    };

                    //// Setup the column mappings, anything ommitted is skipped
                    //sqlBulkCopy.ColumnMappings.Add("FirstName", "FirstName");
                    //sqlBulkCopy.ColumnMappings.Add("LastName", "LastName");
                    sqlBulkCopy.ColumnMappings.Add("N° Bon", "N° Bon");
                    sqlBulkCopy.ColumnMappings.Add("Référenceélémentdistribué", "Référenceélémentdistribué");
                    sqlBulkCopy.ColumnMappings.Add("Libellé type de flux", "Libellé type de flux");
                    sqlBulkCopy.ColumnMappings.Add("Date de création", "Date de création");
                    sqlBulkCopy.ColumnMappings.Add("Date de 1ère prise", "Date de 1ère prise");
                    sqlBulkCopy.ColumnMappings.Add("Date de remise", "Date de remise");
                    sqlBulkCopy.ColumnMappings.Add("Nb de colis contenus", "Nb de colis contenus");
                    sqlBulkCopy.ColumnMappings.Add("Gare de départ", "Gare de départ");
                    sqlBulkCopy.ColumnMappings.Add("Gare de destination", "Gare de destination");
                    sqlBulkCopy.ColumnMappings.Add("Délai de distribution", "Délai de distribution");
                    sqlBulkCopy.ColumnMappings.Add("Délai de livraison", "Délai de livraison");
                    sqlBulkCopy.ColumnMappings.Add("Statut", "Statut");
                    sqlBulkCopy.ColumnMappings.Add("Autre identifiant", "Autre identifiant");
                    sqlBulkCopy.ColumnMappings.Add("A l'attention de", "A l'attention de");
                    sqlBulkCopy.ColumnMappings.Add("Informations", "Informations");
                    sqlBulkCopy.ColumnMappings.Add("Date clôture", "Date clôture");
                    sqlBulkCopy.ColumnMappings.Add("Date dernière position", "Date dernière position");
                    sqlBulkCopy.ColumnMappings.Add("Gare dernière position", "Gare dernière position");
                    sqlBulkCopy.ColumnMappings.Add("SPEEDUP", "FL3");





                    // Loop through the CSV and load each set of 100,000 records into a DataTable
                    // Then send it to the LiveTable
                    while (!textFieldParser.EndOfData)
                    {
                        dataTable.Rows.Add(textFieldParser.ReadFields());

                        createdCount++;

                        if (createdCount % _batchSize == 0)
                        {
                            InsertDataTable(sqlBulkCopy, sqlConnection, dataTable);

                            break;
                        }
                    }

                    // Don't forget to send the last batch under 100,000
                    InsertDataTable(sqlBulkCopy, sqlConnection, dataTable);
                    sqlConnection.Close();
                }
                #endregion
                string commandText ="sp_SU_Update_Download";

                RunCommandAsynchronously(commandText, new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString));
            }
        }

        private static void RunCommandAsynchronously(string commandText, SqlConnection connectionString)
        {
            // Given command text and connection string, asynchronously execute
            // the specified command against the connection. For this example,
            // the code displays an indicator as it is working, verifying the 
            // asynchronous behavior. 
            using (SqlConnection connection =  connectionString)
            {
                try
                {
                    int count = 0;
                    SqlCommand command = new SqlCommand(commandText, connection);
                    connection.Open();

                    IAsyncResult result = command.BeginExecuteNonQuery();
                    while (!result.IsCompleted)
                    {
                        
                        Console.WriteLine("Waiting ({0}",count++);
                        // Wait for 1/10 second, so the counter
                        // does not consume all available resources 
                        // on the main thread.
                        System.Threading.Thread.Sleep(100);
                    }
                    Console.WriteLine("Command complete. Affected {0} rows.",
                        command.EndExecuteNonQuery(result));
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Error ({0}): {1}", ex.Number, ex.Message);
                }
                catch (InvalidOperationException ex)
                {
                    Console.WriteLine("Error: {0}", ex.Message);
                }
                catch (Exception ex)
                {
                    // You might want to pass these errors
                    // back out to the caller.
                    Console.WriteLine("Error: {0}", ex.Message);
                }
            }
        }


       

    }
}