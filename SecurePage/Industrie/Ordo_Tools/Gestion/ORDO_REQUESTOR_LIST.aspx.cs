using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using DevExpress.Web;
using DX_DAHERCMS.CatalogReportTableAdapters;
using System.Data.SqlClient;
using System.Configuration;

namespace DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion
{
    public partial class ORDO_REQUESTOR_LIST : System.Web.UI.Page
    {
        private CatalogReport catalogDataSet;
        private DataTable reportsTable;
        private REQUESTOR_QUERYTableAdapter reportsTableAdapter;

        protected void Page_Load(object sender, EventArgs e)
        {
            catalogDataSet = new CatalogReport();
            reportsTableAdapter = new REQUESTOR_QUERYTableAdapter();
            reportsTableAdapter.Fill(catalogDataSet.REQUESTOR_QUERY);
            reportsTable = catalogDataSet.Tables["REQUESTOR_QUERY"];

            if (!IsPostBack)
            {
                ListBox1.DataSource = catalogDataSet;
                ListBox1.DataMember = "REQUESTOR_QUERY";
                ListBox1.DataTextField = "Query_Name";
                ListBox1.DataValueField = "ID_QUERY";

                this.DataBind();
            }
        }
        protected void OpenButton_Click(object sender, EventArgs e)
        {
            
            ListItem selected = ListBox1.SelectedItem;
            
            if (selected != null)
            {

                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
                SqlCommand cmdSelect = new SqlCommand();
                SqlDataReader reader;

                cmdSelect.CommandText = "SELECT * FROM [REQUESTOR_QUERY] WHERE ID_QUERY= " + selected.Value ;
                cmdSelect.CommandType = CommandType.Text;
                cmdSelect.Connection = connection;
                connection.Open();
                reader = cmdSelect.ExecuteReader();
               
          
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string s = reader.GetString(3);
                        string sql = s.Replace("$", "'");
                        s.Replace("$","'");
                        Session["selectCommandSQL"] = sql ;
                        Response.Redirect("ORDO_REQUESTOR_RESULT.aspx");
                    }                   
                    
                }
                else
                {
                    
                }
               
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ListItem selected = ListBox1.SelectedItem;
            if (selected != null)
            {

                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
                SqlCommand cmdSelect = new SqlCommand();
                SqlDataReader reader;

                cmdSelect.CommandText = "SELECT * FROM [REQUESTOR_QUERY] WHERE ID_QUERY= '" + selected.Value + "'";
                cmdSelect.CommandType = CommandType.Text;
                cmdSelect.Connection = connection;
                connection.Open();
                reader = cmdSelect.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string x = reader.GetString(2);
                        string xml = x.Replace("$", "'");
                        Session["selectCommand"] = xml;
                        Response.Redirect("ORDO_REQUESTOR.aspx");
                    }

                }
                else
                {
                   
                }

            }
        }
    }
}