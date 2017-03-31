﻿using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.ToolBox.Industrie.Expedition.Kit
{
    public partial class Kit_DoubleControl : System.Web.UI.Page
    {
       

        DataTable GetTable()
        {
            DataTable table = Session["Table"] as DataTable;

            //You can store a DataTable in the session state
           
            if (table == null)
            {
                table = new DataTable();

                DataColumn colid = table.Columns.Add("ID", typeof(Int32));
                DataColumn nameid = table.Columns.Add("Name", typeof(String));
                table.PrimaryKey = new DataColumn[] { colid };
                colid.ReadOnly = true;

                //for (int i = 0; i < 23; i++)
                //{
                //    DataRow aRow = table.NewRow();
                //    aRow["ID"] = i;
                //    aRow["Name"] = String.Format("Name{0}", i);

                //    table.Rows.Add(aRow);
                //}
                Session["Table"] = table;
            }
            return table;
        }

        public Int32 GetLastKey()
        {
            DataTable table = GetTable();

            Int32 max = Int32.MinValue;
            foreach (DataRow row in table.Rows)
            {
                if (Convert.ToInt32(row["ID"]) > max)
                    max = Convert.ToInt32(row["ID"]);
            }
            return max;
        }


        protected void Page_Init(object sender, EventArgs e)
        {
            grid.DataSource = GetTable();
            grid.KeyFieldName = "ID";
            grid.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            DataTable table = GetTable();
            DataRow found = table.Rows.Find(e.Keys[0]);
            table.Rows.Remove(found);

            Session["Table"] = table;

            e.Cancel = true;
        }

        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            DataTable table = GetTable();
            table.Rows.Add(new Object[] { e.NewValues["ID"], e.NewValues["Name"] });

            Session["Table"] = table;

            e.Cancel = true;
            grid.CancelEdit();
        }

        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;

            DataTable table = GetTable();
            DataRow found = table.Rows.Find(e.Keys[0]);
            found["Name"] = e.NewValues["Name"];

            Session["Table"] = table;

            e.Cancel = true;
            grid.CancelEdit();
        }

        protected void grid_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["ID"] = GetLastKey() + 1;
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            DataTable table = GetTable();
            DataRow aRow = table.NewRow();
            aRow["ID"] = 1;
            aRow["Name"] = ASPxTextBox1.Text;
            table.Rows.Add(aRow);
            grid.DataSource = GetTable();
            grid.KeyFieldName = "ID";
            grid.DataBind();
        }
    }
}
