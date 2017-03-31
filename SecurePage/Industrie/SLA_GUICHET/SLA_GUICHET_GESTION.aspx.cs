using DevExpress.Utils;
using DevExpress.Web;
using DevExpress.XtraReports.UI;
using DX_DAHERCMS.CatalogReportTableAdapters;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DX_DAHERCMS.SecurePage.Industrie.SLA_GUICHET
{
    public partial class SLA_GUICHET_GESTION : System.Web.UI.Page
    {
        private StreamReader streamToPrint;
        static string filePath;
        private CatalogReport catalogDataSet;
        private DataTable reportsTable;
        private ReportsTableAdapter reportsTableAdapter;
        XtraReport newReport = new XtraReport();

        protected void Page_Load(object sender, EventArgs e)
        {
            catalogDataSet = new CatalogReport();
            reportsTableAdapter = new ReportsTableAdapter();
            reportsTableAdapter.Fill(catalogDataSet.Reports);
            reportsTable = catalogDataSet.Tables["Reports"];

        }

        protected void Grid_DataSelect(object sender, EventArgs e)
        {
            Session["IDGUICHET"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void grid_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {

            (sender as ASPxGridView).JSProperties["cpInfo"] = "hi from server";

        }


        protected void timer_Tick(object sender, EventArgs e)
        {
            int a = grid.VisibleRowCount;
            grid.DataBind();
            int b = grid.VisibleRowCount;

            if (b > a)
            {
                myID.Text = "Ca bouge";
            }


        }

        protected void btn_print_Click(object sender, EventArgs e)
        {
            string categoryId = grid.GetRowValues(grid.FocusedRowIndex, "IDGUICHET").ToString();

            using (MemoryStream readStream = new MemoryStream())
            {

                DataRow row = reportsTable.Rows.Find(IdReport.Text);
                byte[] reportData = (Byte[])row["LayoutData"];
                readStream.Write(reportData, 0, reportData.Length);
                newReport.LoadLayout(readStream);
                newReport.FilterString = "[IDGUICHET] =" + categoryId;
                ASPxLabel1.Text = categoryId;
                ASPxWebDocumentViewer1.OpenReport(newReport);




            }

            ASPxPopupControl2.ShowOnPageLoad = true;

            ASPxPopupControl2.Maximized = true;
        }

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (hidden_actvity.Text == "MAGASIN")
            {
                if (e.Column.FieldName == "Exclusion")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "OT")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "OT2")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "OT3")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "OT4")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "OT5")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "SU_Commentaire")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "Exlusion_Commentaires")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "Exclusion")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "OT_Poste")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "Guichet_RemiseClient")
                    e.Editor.Enabled = false;
            }
            else if (hidden_actvity.Text == "GUICHET")
            {
                if (e.Column.FieldName == "Guichet_ExclusionMagasin")
                    e.Editor.Enabled = false;
                if (e.Column.FieldName == "Guichet_Depose")
                    e.Editor.Enabled = false;
            }
        }

        protected void btn_Message_Click(object sender, EventArgs e)
        {
            string categoryId = grid.GetRowValues(grid.FocusedRowIndex, "IDGUICHET").ToString();



            if (File.Exists(Server.MapPath("/App_Data/Guichet_MSG/" + categoryId + ".msg")))
            {
                Response.ContentType = "application/vnd.ms-outlook";
                Response.AppendHeader("Content-Disposition", "attachment; filename=Message.msg");
                Response.TransmitFile(Server.MapPath("/App_Data/Guichet_MSG/" + categoryId + ".msg"));
                Response.End();
            }




        }
    }
}