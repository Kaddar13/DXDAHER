
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

namespace DX_DAHERCMS.SecurePage.Rechange.B1
{
    public partial class B1_Impor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UPSAP_FilesUploadComplete(object sender, DevExpress.Web.FilesUploadCompleteEventArgs e)
        {
            string excelPath = Server.MapPath("/App_Data/UploadTemp/" + UP_XML.FileName.ToString());
            UP_XML.SaveAs(excelPath);


            string conString = string.Empty;
            string extension = Path.GetExtension(UP_XML.FileName);
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    //conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                    conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                    break;
                case ".xlsx": //Excel 07 or higher
                    conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                    break;

            }
            conString = string.Format(conString, excelPath);
            using (OleDbConnection excel_con = new OleDbConnection(conString))
            {
                excel_con.Open();
                //string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["Feuil1$"].ToString();
                DataTable dtExcelData = new DataTable();

                using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [DATA$]", excel_con))
                {
                    oda.Fill(dtExcelData);
                }
                excel_con.Close();


                string consString = ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        //Set the database table name
                        sqlBulkCopy.DestinationTableName = "dbo.T_B1_Quincaillerie";

                        con.Open();

                        SqlCommand sqlComm1 = new SqlCommand();
                        sqlComm1 = con.CreateCommand();
                        sqlComm1.CommandText = "DELETE FROM T_B1_Quincaillerie";
                        sqlComm1.ExecuteNonQuery();

                        sqlBulkCopy.WriteToServer(dtExcelData);
                        con.Close();
                    }
                }
            }
        }

    }
}