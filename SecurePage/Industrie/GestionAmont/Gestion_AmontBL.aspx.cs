using DevExpress.Export;
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

namespace DX_DAHERCMS.SecurePage.Industrie.GestionAmont
{
    public partial class Gestion_AmontBL : System.Web.UI.Page
    {
        string sID;
        string strMail;
        string typeAmont;
         private StreamReader streamToPrint;
        static string filePath;
        private CatalogReport catalogDataSet;
        private DataTable reportsTable;
        private ReportsTableAdapter reportsTableAdapter;
        XtraReport newReport = new XtraReport();

        protected void Page_Load(object sender, EventArgs e)
        {
            typeAmont=  Request.QueryString["type"];
            catalogDataSet = new CatalogReport();
            reportsTableAdapter = new ReportsTableAdapter();
            reportsTableAdapter.Fill(catalogDataSet.Reports);
            reportsTable = catalogDataSet.Tables["Reports"];
        }

        protected void Mouvement_DataSelect(object sender, EventArgs e)
        {
            Session["IDAmont"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            if ((grid.IsNewRowEditing == true && (e.Column.FieldName == "Statut")))
            {
                e.Editor.Value = "Creation";
            }
           if ((grid.IsNewRowEditing == false && (e.Column.FieldName == "Statut")))
            {
                e.Editor.Value = "";
            }
            if ((grid.IsNewRowEditing == true && (e.Column.FieldName == "Type_AmontBL") && typeAmont == "BL"))
            {
                e.Editor.Value = "Amont BL";
                
            }   


        }

        protected void grid_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

            string Identifiant = grid.GetRowValues(grid.FocusedRowIndex, "IDAmont").ToString();
            grid.SettingsText.PopupEditFormCaption = "Saisie des Mouvements Amont BR " + Identifiant;
            HideField();
        }
             

        protected void Grid_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
             sID = e.Command.Parameters["@QuoteID"].Value.ToString();
         }

  

        protected void grid_RowInserted1(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            string adress_mail;


            if (e.NewValues["Mail"] == null)
            {
                adress_mail = "Vide"; 
            }
            else
            {
                adress_mail = e.NewValues["Mail"].ToString(); 
            }

            strMail= e.NewValues["txt_mail"].ToString(); 

            if (e.Exception == null)
                ((ASPxGridView)sender).JSProperties["cp_Arg"] = adress_mail;
            ((ASPxGridView)sender).JSProperties["cp_ID"] = sID;

            insertMvt();
           

        }

        protected void btn_print_Click(object sender, EventArgs e)
        {
            string categoryId = grid.GetRowValues(grid.FocusedRowIndex, "IDAmont").ToString();
            ASPxLabel1.Text = categoryId + "/" + IdReport.Text;
            using (MemoryStream readStream = new MemoryStream())
            {

                DataRow row = reportsTable.Rows.Find(IdReport.Text);
                byte[] reportData = (Byte[])row["LayoutData"];
                readStream.Write(reportData, 0, reportData.Length);
                newReport.LoadLayout(readStream);
                newReport.FilterString = "[IDAmont] =" + categoryId;

                ASPxWebDocumentViewer1.OpenReport(newReport);

                ASPxPopupControl2.ShowOnPageLoad = true;

                ASPxPopupControl2.Maximized = true;

            }
        }


        void insertMvt()
        {
            DS_Mouvement.InsertParameters["USER"].DefaultValue = User.Identity.Name;
            DS_Mouvement.InsertParameters["Statut"].DefaultValue = "Creation";
            DS_Mouvement.InsertParameters["IDAmont"].DefaultValue = sID;
            DS_Mouvement.InsertParameters["Date_Mouvement"].DefaultValue = DateTime.Now.ToShortDateString();
            DS_Mouvement.InsertParameters["Affectation"].DefaultValue = strMail;
            DS_Mouvement.Insert();
        }

        void HideField()
        {
            if (typeAmont == "BL"){
                grid.EditFormLayoutProperties.FindColumnItem("ZLECI").Visible = false;
            }
         
        }

        protected void grid_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            HideField();
        }

       
       
    }
}