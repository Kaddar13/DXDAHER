using DevExpress.XtraReports.Native;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.DataAccess.Excel;
using DevExpress.XtraReports.UI;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrinting.Preview;

namespace DX_DAHERCMS
{
    public class MyDataSerializer : IDataSerializer
    {
        public const string Name = "MyDataSerializer";

        public bool CanSerialize(object data, object extensionProvider)
        {
            return data is DataSet;
        }

        public string Serialize(object data, object extensionProvider)
        {
            var ds = (DataSet)data;
            return ds.DataSetName;
        }

        public bool CanDeserialize(string value, string typeName, object extensionProvider)
        {
            return value == "Dataset";
        }

        public object Deserialize(string value, string typeName, object extensionProvider)
        {
            if (value == "Dataset")
            {
                return GenerateActorMembers();
            }
            return null;
        }

        public static DataSet GenerateActorMembers()
        {
            DataSet DS = new DataSet();
            DS.DataSetName = "Dataset";
            DataTable DT = new DataTable();
               DS.Tables.Add(DT);
            //Read all lines from selected file and assign to string array variable.
            if (ClassGlobal.CheminFichier == null)
                        {
                return null ;
                        }
            else
            {
                string[] fileContent = File.ReadAllLines(ClassGlobal.CheminFichier);
            //Checks fileContent count > 0 then we have some lines in the file. If = 0 then file is empty
            if (fileContent.Count() > 0)
            {
                //In CSV file, 1st line contains column names. When you read CSV file, each delimited by ','.
                //fileContent[0] contains 1st line and splitted by ','. columns string array contains list of columns.
                string[] columns = fileContent[0].Split('\t');
                for (int i = 0; i < columns.Count(); i++)
                {
                    DT.Columns.Add(columns[i]);
                }

                //Same logic for row data.
                for (int i = 1; i < fileContent.Count(); i++)
                {
                    string[] rowData = fileContent[i].Split('\t');
                    DT.Rows.Add(rowData);
                }
            }
            return DS;
            }
        }
    }
}