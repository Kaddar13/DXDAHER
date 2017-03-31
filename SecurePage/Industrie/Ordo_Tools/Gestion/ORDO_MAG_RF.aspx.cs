using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using DevExpress.Web;

namespace DX_DAHERCMS
{
    public partial class ORDO_MAG_RF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            DataTable dt = GetDataView(ASPxGridView1);
            dt.Columns.Remove("Appareil");
            dt.Columns.Remove("Magasin_Prenant");
            dt.Columns.Remove("Groupe");
            dt.Columns.Remove("Poste de l'ordre de transfert");
            dt.Columns.Remove("Start");
            dt.Columns.Remove("Type magasin cédant");
            
            ASPxMemo1.Text = GetSelectedValues(dt);
        }

        private string GetSelectedValues(DataTable DS)
        {

           var result = new StringBuilder();
        for (int i = 0; i < DS.Columns.Count; i++)
        {
            result.Append(DS.Columns[i].ColumnName);
            result.Append(i == DS.Columns.Count - 1 ? "\n" : ",");
        }

        foreach (DataRow row in DS.Rows)
        {
            for (int i = 0; i < DS.Columns.Count; i++)
            {
                result.Append(row[i].ToString());
                result.Append(i == DS.Columns.Count - 1 ? "\n" : ",");
            }
        }

        return result.ToString();
    }

        private DataTable GetDataView(ASPxGridView grid)
        {
            DataTable dt = new DataTable();
            foreach (GridViewColumn col in grid.VisibleColumns)
            {
                GridViewDataColumn dataColumn = col as GridViewDataColumn;
                if (dataColumn == null) continue;
                dt.Columns.Add(dataColumn.FieldName);
            }
            for (int i = 0; i < grid.VisibleRowCount; i++)
            {
                DataRow row = dt.Rows.Add();
                foreach (DataColumn col in dt.Columns)
                    row[col.ColumnName] = grid.GetRowValues(i, col.ColumnName);
            }
            return dt;
        }

        }
        
    }
