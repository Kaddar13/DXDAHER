﻿using DevExpress.Export;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DX_DAHERCMS.CatalogReportTableAdapters;
using System.Data.SqlClient;
using System.Configuration;




namespace DX_DAHERCMS.ToolBox.SPEEDUP
{

    public partial class SU_Gestion : System.Web.UI.Page
    {
         private StreamReader streamToPrint;
        static string filePath;
        private CatalogReport catalogDataSet;
        private DataTable reportsTable;
        private ReportsTableAdapter reportsTableAdapter;
        XtraReport newReport = new XtraReport();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["IDSPEEDUP"] = 16;
            catalogDataSet = new CatalogReport();
            reportsTableAdapter = new ReportsTableAdapter();
            reportsTableAdapter.Fill(catalogDataSet.Reports);
            reportsTable = catalogDataSet.Tables["Reports"];
            
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            string categoryId = grid.GetRowValues(grid.FocusedRowIndex, "IDSPEEDUP").ToString();

            using (MemoryStream readStream = new MemoryStream())
            {

                DataRow row = reportsTable.Rows.Find(IdReport.Text);
                byte[] reportData = (Byte[])row["LayoutData"];
                readStream.Write(reportData, 0, reportData.Length);
                newReport.LoadLayout(readStream);
                newReport.FilterString = "[IDSPEEDUP] =" + categoryId;
                ASPxLabel1.Text = categoryId;
                ASPxWebDocumentViewer1.OpenReport(newReport);

                ASPxPopupControl2.ShowOnPageLoad = true;

                ASPxPopupControl2.Maximized = true;

            }
        }

        protected void Grid_DataSelect(object sender, EventArgs e)
        {
            Session["IDSPEEDUP"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
       
        protected void grid_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {

            (sender as ASPxGridView).JSProperties["cpInfo"] = "hi from server";

            ASPxPageControl pageedit = grid.FindEditFormTemplateControl("pageEdit") as ASPxPageControl;
            ASPxFormLayout formedit = pageedit.FindControl("FormEdit") as ASPxFormLayout;

            ASPxComboBox cbo_statut = formedit.FindControl("cbo_mvtStatut") as ASPxComboBox;
            ASPxComboBox cbo_Affectation = formedit.FindControl("cbo_mvtAffectation") as ASPxComboBox;
            ASPxMemo memo_commentaires = formedit.FindControl("memo_Commentaire") as ASPxMemo;


            DS_Mouvement.InsertParameters["USER"].DefaultValue = User.Identity.Name;
            DS_Mouvement.InsertParameters["Statut"].DefaultValue = cbo_statut.Text + e.NewValues["Exclusion"];
            DS_Mouvement.InsertParameters["Affectation"].DefaultValue = cbo_Affectation.Text;
            DS_Mouvement.InsertParameters["Commentaire"].DefaultValue = memo_commentaires.Text;
            DS_Mouvement.InsertParameters["IDSPEEDUP"].DefaultValue = grid.GetRowValues(grid.FocusedRowIndex, "IDSPEEDUP").ToString();
            DS_Mouvement.Insert();

            using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SU_Update", sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@IDSPEEDUP", SqlDbType.VarChar).Value = grid.GetRowValues(grid.FocusedRowIndex, "IDSPEEDUP").ToString();


                    sqlConnection.Open();
                    cmd.ExecuteNonQuery();
                }
            }





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

        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            //UpdateExportMode();
            ASPxGridViewExporter1.WriteXlsToResponse(new XlsExportOptionsEx() { ExportType = ExportType.WYSIWYG });
        }

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            if (e.Column.FieldName == "SU_Affectation")
            {
                e.Editor.Value = grid.GetRowValues(grid.FocusedRowIndex, "SU_Localisation").ToString();
            }
            

        }

        protected void grid_Init(object sender, EventArgs e)
        {
            //string filter = String.Format("Statut = 'Cloturé' OR Statut = 'Créé' OR Statut = 'En transit' ");
            //grid.FilterExpression = filter;
           


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            ASPxPageControl pageedit = grid.FindEditFormTemplateControl("pageEdit") as ASPxPageControl;
            ASPxFormLayout formedit = pageedit.FindControl("FormEdit") as ASPxFormLayout;
            if (ASPxEdit.AreEditorsValid(formedit))
            {
                grid.UpdateEdit();
              
            }
        }

       
        protected void cbo_mvtStatut_Callback(object sender, CallbackEventArgsBase e)
        {
            ASPxPageControl pageedit = grid.FindEditFormTemplateControl("pageEdit") as ASPxPageControl;
            ASPxFormLayout formedit = pageedit.FindControl("FormEdit") as ASPxFormLayout;
            ASPxComboBox cbo_statut = formedit.FindControl("cbo_mvtStatut") as ASPxComboBox;
            SqlDataSource ds_Statut = formedit.FindControl("DS_Statut") as SqlDataSource;
            cbo_statut.DataSource = ds_Statut.Select(DataSourceSelectArguments.Empty);
            cbo_statut.DataBind();
        }

 

        protected void grid_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

            string Identifiant = grid.GetRowValues(grid.FocusedRowIndex, "IDSPEEDUP").ToString();
            grid.SettingsText.PopupEditFormCaption = "Saisie des Mouvements SpeedUp N° " + Identifiant;
        }


        protected string GetDXCurrentLanguageValue()
        {
            return Request.Cookies["DXCurrentLanguage"] == null ? "" : Request.Cookies["DXCurrentLanguage"].Value;
        }

        protected override void InitializeCulture()
        {
            if (!string.IsNullOrEmpty(GetDXCurrentLanguageValue()))
            {
                //for regional server standards 
                Culture = GetDXCurrentLanguageValue();
                //for DevExpress localizable strings 
                UICulture = GetDXCurrentLanguageValue();
            }
        }

    }
}
