using DevExpress.DataAccess.ConnectionParameters;
using DevExpress.DataAccess.Native;
using DevExpress.XtraReports.Web.ReportDesigner.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace DX_DAHERCMS.ToolBox.Etiquette
{
    class MyDataSourceWizardConnectionStringsProvider : IDataSourceWizardConnectionStringsProvider
    {
        public Dictionary<string, string> GetConnectionDescriptions()
        {
            Dictionary<string, string> connections = new Dictionary<string, string>();

            // Customize the loaded connections list.  
            connections.Remove("LocalSqlServer");
            //connections.Add("CustomMdbConnection", "Custom DB Connection");
            connections.Add("CustomSqlConnection", "Custom SQL Connection");
            return connections;
        }

        public DataConnectionParametersBase GetDataConnectionParameters(string name)
        {
            // Return custom connection parameters for the custom connection(s).  
            //if (name == "CustomMdbConnection") {
            //    return new Access97ConnectionParameters("|DataDirectory|nwind.mdb", "", "");
            //}
            if (name == "CustomSqlConnection")
            {
                //return new MsSqlConnectionParameters("localhost", "Dashboard", "sa", "Aa123456", MsSqlAuthorizationType.SqlServer);
              CustomStringConnectionParameters customstringParams = new CustomStringConnectionParameters();
              customstringParams.ConnectionString = ConfigurationManager.ConnectionStrings["Dashboard_Ordo"].ToString();
             return customstringParams;
            }
            return AppConfigHelper.LoadConnectionParameters(name);
        }
    }
}
