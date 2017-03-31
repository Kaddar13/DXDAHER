using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

 

namespace DX_DAHERCMS
{
    public class XLSXLMDS
    {
        private static ColumnType getDefaultType()
        {
            return new ColumnType(typeof(String));
        }

        struct ColumnType
        {
            public Type type;
            private string name;
            public ColumnType(Type type) { this.type = type; this.name = type.ToString().ToLower(); }
            public object ParseString(string input)
            {
                if (String.IsNullOrEmpty(input))
                    return DBNull.Value;
                switch (type.ToString())
                {
                    case "system.datetime":
                        return DateTime.Parse(input);
                    case "system.decimal":
                        return decimal.Parse(input);
                    case "system.boolean":
                        return bool.Parse(input);
                    default:
                        return input;
                }
            }
        }

        private static ColumnType getType(XmlNode data)
        {
            string type = null;
            if (data.Attributes["ss:Type"] == null || data.Attributes["ss:Type"].Value == null)
                type = "";
            else
                type = data.Attributes["ss:Type"].Value;

            switch (type)
            {
                case "DateTime":
                    return new ColumnType(typeof(DateTime));
                case "Boolean":
                    return new ColumnType(typeof(Boolean));
                case "Number":
                    return new ColumnType(typeof(Decimal));
                case "":
                    decimal test2;
                    if (data == null || String.IsNullOrEmpty(data.InnerText) || decimal.TryParse(data.InnerText, out test2))
                    {
                        return new ColumnType(typeof(Decimal));
                    }
                    else
                    {
                        return new ColumnType(typeof(String));
                    }
                default://"String"
                    return new ColumnType(typeof(String));
            }
        }

        public static DataSet ImportExcelXML(string fileName, bool hasHeaders, bool autoDetectColumnType)
        {
            StreamReader sr = new StreamReader(fileName);
            Stream st = (Stream)sr.BaseStream;
            return ImportExcelXML(st, hasHeaders, autoDetectColumnType);
        }

        private static DataSet ImportExcelXML(Stream inputFileStream, bool hasHeaders, bool autoDetectColumnType)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(new XmlTextReader(inputFileStream));
            XmlNamespaceManager nsmgr = new XmlNamespaceManager(doc.NameTable);

            nsmgr.AddNamespace("o", "urn:schemas-microsoft-com:office:office");
            nsmgr.AddNamespace("x", "urn:schemas-microsoft-com:office:excel");
            nsmgr.AddNamespace("ss", "urn:schemas-microsoft-com:office:spreadsheet");

            DataSet ds = new DataSet();

            foreach (XmlNode node in
              doc.DocumentElement.SelectNodes("//ss:Worksheet", nsmgr))
            {
                DataTable dt = new DataTable(node.Attributes["ss:Name"].Value);
                ds.Tables.Add(dt);
                XmlNodeList rows = node.SelectNodes("ss:Table/ss:Row", nsmgr);
                if (rows.Count > 0)
                {

                    //*************************
                    //Add Columns To Table from header row
                    //*************************
                    List<ColumnType> columns = new List<ColumnType>();
                    int startIndex = 0;
                    if (hasHeaders)
                    {
                        foreach (XmlNode data in rows[0].SelectNodes("ss:Cell/ss:Data", nsmgr))
                        {
                            columns.Add(new ColumnType(typeof(string)));//default to text
                            dt.Columns.Add(data.InnerText, typeof(string));
                        }
                        startIndex++;
                    }
                    //*************************
                    //Update Data-Types of columns if Auto-Detecting
                    //*************************
                    if (autoDetectColumnType && rows.Count > 0)
                    {
                        XmlNodeList cells = rows[startIndex].SelectNodes("ss:Cell", nsmgr);
                        int actualCellIndex = 0;
                        for (int cellIndex = 0; cellIndex < cells.Count; cellIndex++)
                        {
                            XmlNode cell = cells[cellIndex];
                            if (cell.Attributes["ss:Index"] != null)
                                actualCellIndex =
                                  int.Parse(cell.Attributes["ss:Index"].Value) - 1;

                            ColumnType autoDetectType =
                              getType(cell.SelectSingleNode("ss:Data", nsmgr));

                            if (actualCellIndex >= dt.Columns.Count)
                            {
                                dt.Columns.Add("Column" +
                                  actualCellIndex.ToString(), autoDetectType.type);
                                columns.Add(autoDetectType);
                            }
                            else
                            {
                                dt.Columns[actualCellIndex].DataType = autoDetectType.type;
                                columns[actualCellIndex] = autoDetectType;
                            }

                            actualCellIndex++;
                        }
                    }
                    //*************************
                    //Load Data
                    //*************************
                    for (int i = startIndex; i < rows.Count; i++)
                    {
                        DataRow row = dt.NewRow();
                        XmlNodeList cells = rows[i].SelectNodes("ss:Cell", nsmgr);
                        int actualCellIndex = 0;
                        for (int cellIndex = 0; cellIndex < cells.Count; cellIndex++)
                        {
                            XmlNode cell = cells[cellIndex];
                            if (cell.Attributes["ss:Index"] != null)
                                actualCellIndex = int.Parse(cell.Attributes["ss:Index"].Value) - 1;

                            XmlNode data = cell.SelectSingleNode("ss:Data", nsmgr);

                            if (actualCellIndex >= dt.Columns.Count)
                            {
                                for (int ii = dt.Columns.Count; ii < actualCellIndex; ii++)
                                {
                                    dt.Columns.Add("Column" + actualCellIndex.ToString(), typeof(string)); columns.Add(getDefaultType());
                                } // ii
                                ColumnType autoDetectType =
                                   getType(cell.SelectSingleNode("ss:Data", nsmgr));
                                dt.Columns.Add("Column" + actualCellIndex.ToString(),
                                               typeof(string));
                                columns.Add(autoDetectType);
                            }
                            if (data != null)
                                row[actualCellIndex] = data.InnerText;

                            actualCellIndex++;
                        }

                        dt.Rows.Add(row);
                    }
                }
            }
            return ds;
        }

        public static DataSet ImportCSVTAB()
        {
            DataSet DS = new DataSet();
            DS.DataSetName = ClassGlobal.FichierNomTXT;
            DataTable DT = new DataTable();
            DS.Tables.Add(DT);
            //Read all lines from selected file and assign to string array variable.
            if (ClassGlobal.FichierNomTXT == null)
            {
                return null;
            }
            else
            {
                string[] fileContent = File.ReadAllLines(ClassGlobal.FichierNomTXT);
                //Checks fileContent count > 0 then we have some lines in the file. If = 0 then file is empty
                if (fileContent.Count() > 0)
                {
                    //In CSV file, 1st line contains column names. When you read CSV file, each delimited by ','.
                    //fileContent[0] contains 1st line and splitted by ','. columns string array contains list of columns.
                    string[] columns = fileContent[1].Split('\t');
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

        public static DataSet ImportCSVCOMMA()
        {
            DataSet DS = new DataSet();
            DS.DataSetName = ClassGlobal.FichierNomXML;
            DataTable DT = new DataTable();
            DS.Tables.Add(DT);
            //Read all lines from selected file and assign to string array variable.
            if (ClassGlobal.FichierNomXML == null)
            {
                return null;
            }
            else
            {
                string[] fileContent = File.ReadAllLines(ClassGlobal.FichierNomXML);
                //Checks fileContent count > 0 then we have some lines in the file. If = 0 then file is empty
                if (fileContent.Count() > 0)
                {
                    //In CSV file, 1st line contains column names. When you read CSV file, each delimited by ','.
                    //fileContent[0] contains 1st line and splitted by ','. columns string array contains list of columns.
                    string[] columns = fileContent[1].Split(';');
                    for (int i = 0; i < columns.Count(); i++)
                    {
                        DT.Columns.Add(columns[i]);
                    }

                    //Same logic for row data.
                    for (int i = 1; i < fileContent.Count(); i++)
                    {
                        string[] rowData = fileContent[i].Split(';');
                        DT.Rows.Add(rowData);
                    }
                }
                return DS;
            }
        }

        public static DataSet ImportCSVVIRGULE()
        {
            DataSet DS = new DataSet();
            DS.DataSetName = ClassGlobal.FichierNomXML;
            DataTable DT = new DataTable();
            DS.Tables.Add(DT);
            //Read all lines from selected file and assign to string array variable.
            if (ClassGlobal.FichierNomXML == null)
            {
                return null;
            }
            else
            {
                string[] fileContent = File.ReadAllLines(ClassGlobal.FichierNomXML);
                //Checks fileContent count > 0 then we have some lines in the file. If = 0 then file is empty
                if (fileContent.Count() > 0)
                {
                    //In CSV file, 1st line contains column names. When you read CSV file, each delimited by ','.
                    //fileContent[0] contains 1st line and splitted by ','. columns string array contains list of columns.
                    string[] columns = fileContent[0].Split('\"');
                    for (int i = 0; i < columns.Count(); i++)
                    {
                        DT.Columns.Add(columns[i]);
                    }

                    //Same logic for row data.
                    for (int i = 1; i < fileContent.Count(); i++)
                    {
                      
                        //string[] rowData = Regex.Split(fileContent[i], pattern);
                        string[] rowData = fileContent[i].Split('\"');
                        DT.Rows.Add(rowData);
                    }
                }
                return DS;
            }
        }
            
            
        }
    
}