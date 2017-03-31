using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Telerik.Web.UI;
using Microsoft.SqlServer.Dts.Runtime;
using Microsoft.SqlServer.Dts.Runtime.Wrapper;

namespace DX_DAHERCMS.SecurePage.Rechange.Volumetrie
{
    public partial class Synthese_MagVolumetrie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public DataTable GetDataTable()
        {

            string query = "SELECT  [Date de saisie], Volumetrie, [Nom de l'utilisateur], NB_Article FROM View_synthese_volumag WHERE ([Date de saisie] >=@Param1) and  ([Date de saisie] <=@Param2)";
            String ConnString = ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);

            if (Param_Hidden1.Value == "")
            {
                adapter.SelectCommand.Parameters.Add("@Param1", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
                adapter.SelectCommand.Parameters.Add("@Param2", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();

            }
            else
            {
                adapter.SelectCommand.Parameters.Add("@Param1", SqlDbType.Date).Value = Param_Hidden1.Value;
                adapter.SelectCommand.Parameters.Add("@Param2", SqlDbType.Date).Value = Param_Hidden2.Value;
            }


            DataTable myDataTable = new DataTable();

            conn.Open();
            try
            {
                adapter.Fill(myDataTable);
            }
            finally
            {
                conn.Close();
            }

            return myDataTable;
        }
        private void LoadDataForRadGrid1()
        {
            RadGrid1.DataSource = GetDataTable();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(Param_Hidden1.Value + "      " + Param_Hidden2.Value);
            LoadDataForRadGrid1();
            RadGrid1.Rebind();


        }
        protected void RadGrid1_ExcelMLWorkBookCreated(object sender, Telerik.Web.UI.GridExcelBuilder.GridExcelMLWorkBookCreatedEventArgs e)
        {

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();


            SqlParameter returnParameter = cmd.Parameters.Add("@return_value", SqlDbType.Int);
            returnParameter.Direction = ParameterDirection.ReturnValue;
            cmd.CommandText = "DECLARE	@return_value int EXEC	@return_value = [dbo].[Proc_Import_mb51] SELECT	'Return Value' = @return_value";
            cmd.Connection = sqlConnection1;
            sqlConnection1.Open();
            cmd.ExecuteNonQuery();
            int id = (int)returnParameter.Value;

            if (id == 0)
            {

                RadNotification1.Title = "Execution Package.";
                RadNotification1.Text = "The package executed successfully.";
                RadNotification1.TitleIcon = "info";
                RadNotification1.ContentIcon = "info";
                RadNotification1.Show();

                Param_RetourProc.Value = "The package executed successfully.";
            }
            else
            {
                RadNotification1.Title = "Execution Package.";
                RadNotification1.Text = "The package failed.";
                RadNotification1.TitleIcon = "warning";
                RadNotification1.ContentIcon = "warning";
                RadNotification1.Show();

                Param_RetourProc.Value = "The package failed.";
            }



            sqlConnection1.Close();

        }
        protected void RadGrid1_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
        {
            LoadDataForRadGrid1();
        }
        protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            LoadDataForRadGrid1();
        }
        protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            LoadDataForRadGrid1();
        }
        protected void executePAackage(object sender, EventArgs e)
        {
            string pkgLocation;
            Package pkg;
            Application app;
            DTSExecResult pkgResults;

            //pkgLocation = @"C:\Users\Mohamed\Documents\visual studio 2013\Projects\CMS_DAHERAH\CMS_DAHERAH/Package.dtsx";
            //app = new Microsoft.SqlServer.Dts.Runtime.Application();
            //pkg = app.LoadPackage(pkgLocation, null);
            //pkgResults = pkg.Execute();

            //Console.WriteLine(pkgResults.ToString());
            //Console.ReadKey();
        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            LoadDataForRadGrid1();
        }
    }
}