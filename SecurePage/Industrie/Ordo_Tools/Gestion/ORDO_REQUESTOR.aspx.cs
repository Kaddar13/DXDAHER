using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraReports.Web;
using DevExpress.Web;
using System.Data.SqlClient;
using System.Configuration;
using DevExpress.DataAccess.Sql;
using DevExpress.DataAccess.Native.Sql;
using System.Web.SessionState;
using System.Xml.Linq;
using System.Data;
using DX_DAHERCMS.CatalogReportTableAdapters;

namespace DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion
{
    public partial class ORDO_REQUESTOR : System.Web.UI.Page
    {
  
        protected void Page_Load(object sender, EventArgs e)
        {
            var query = QuerySerializer.LoadFromXml(XElement.Parse(Session["selectCommand"].ToString()), null) as TableQuery;
            ASPxQueryBuilder1.OpenConnection("Dashboard_Ordo", query);
          
        }

        
        protected void ASPxQueryBuilder1_SaveQuery(object sender, DevExpress.XtraReports.Web.SaveQueryEventArgs e)
        {

            Session["selectCommand"] = QuerySerializer.SaveToXml(e.ResultQuery, null);
            Session["selectCommandSQL"] = e.SelectStatement;
            Session["selectName"] = e.ResultQuery;

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            SqlCommand cmdSelect = new SqlCommand();
            SqlDataReader reader;
            
            cmdSelect.CommandText = "SELECT * FROM [REQUESTOR_QUERY] WHERE QUERY_NAME = '" + e.ResultQuery + "'";
            cmdSelect.CommandType = CommandType.Text;
            cmdSelect.Connection = connection;
            connection.Open();

            reader = cmdSelect.ExecuteReader();
            int numRows = reader.Cast<Object>().Count();
            connection.Close();
            string s = e.SelectStatement;
            string sql = s.Replace("'", "$");

            string x = QuerySerializer.SaveToXml(e.ResultQuery, null).ToString();
            string xml = x.Replace("'", "$");


            if (numRows > 0)
            {

                SqlCommand cmdUpdate = new SqlCommand();
                cmdUpdate.CommandText = "UPDATE [REQUESTOR_QUERY] SET QUERY_SELECT = '" + xml + "',QUERY_STATEMENT = '" + sql + "' WHERE QUERY_NAME = '" + e.ResultQuery + "'";
                cmdUpdate.CommandType = CommandType.Text;
                cmdUpdate.Connection = connection;
                connection.Open();
                cmdUpdate.ExecuteNonQuery();
                connection.Close();
            }
            else
            {
                SqlCommand cmdInsert = new SqlCommand();
                cmdInsert.CommandText = "INSERT INTO [dbo].[REQUESTOR_QUERY] ([QUERY_NAME] ,[QUERY_SELECT],[QUERY_STATEMENT]) VALUES ('" + e.ResultQuery + "', '" + xml + "','" + sql + "') ";
                cmdInsert.CommandType = CommandType.Text;
                cmdInsert.Connection = connection;
                connection.Open();
                cmdInsert.ExecuteNonQuery();
                connection.Close();
            }



            ASPxWebControl.RedirectOnCallback("ORDO_REQUESTOR_RESULT.aspx");
            }





        }
        
    }
