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

namespace DX_DAHERCMS.SecurePage.Rechange.B1
{
    public partial class B1_GestionQuincaillerie : System.Web.UI.Page
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

        protected void btn_print_Click(object sender, EventArgs e)
        {
            string categoryId = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "ID").ToString();
            string Taille = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "CASIER").ToString().Substring(0,1);

             using (MemoryStream readStream = new MemoryStream())
            {

                if ((Taille == "P")||(Taille == "M"))
                {
                    DataRow row = reportsTable.Rows.Find(txt_casierPetit.Text);
                    byte[] reportData = (Byte[])row["LayoutData"];
                    readStream.Write(reportData, 0, reportData.Length);
                    newReport.LoadLayout(readStream);
                    newReport.FilterString = "[ID] =" + categoryId;
                    ASPxLabel1.Text = categoryId;
                    ASPxWebDocumentViewer1.OpenReport(newReport);
                }
                else
                {
                    DataRow row = reportsTable.Rows.Find(txt_casier.Text);
                    byte[] reportData = (Byte[])row["LayoutData"];
                    readStream.Write(reportData, 0, reportData.Length);
                    newReport.LoadLayout(readStream);
                    newReport.FilterString = "[ID] =" + categoryId;
                    ASPxLabel1.Text = categoryId;
                    ASPxWebDocumentViewer1.OpenReport(newReport);
                }

    
        
            }                    
          
            ASPxPopupControl2.ShowOnPageLoad = true;

            ASPxPopupControl2.Maximized = true;
        }

        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    
        }

        protected void btn_printPlaquette_Click(object sender, EventArgs e)
        {
            string categoryId = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "ID").ToString();
        
            using (MemoryStream readStream = new MemoryStream())
            {
                DataRow row = reportsTable.Rows.Find(txt_plaquette.Text);

                byte[] reportData = (Byte[])row["LayoutData"];
                readStream.Write(reportData, 0, reportData.Length);
                newReport.LoadLayout(readStream);
                newReport.FilterString = "[ID] =" + categoryId;

                ASPxLabel1.Text = categoryId;
                ASPxWebDocumentViewer1.OpenReport(newReport);
                
            }

            ASPxPopupControl2.ShowOnPageLoad = true;

            ASPxPopupControl2.Maximized = true;
        }

        protected void btn_commande_Click(object sender, EventArgs e)
        {
            string categoryId = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "ID").ToString();
            string Identifiant = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "Identifiant").ToString();
            Pop_Commande.HeaderText = "Gestion des commandes :" + Identifiant;
            Pop_Commande.ShowOnPageLoad = true;
       

            //ASPxPopupControl2.Maximized = true;
        }

        protected void ASPxGridView2_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)

        {
            string categoryId = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "ID").ToString();
            e.NewValues["FK_ID"] = categoryId;
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                string categoryId = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "ID").ToString();
                SqlDataSource2.InsertParameters["DATE"].DefaultValue = date_commande.Text;
                SqlDataSource2.InsertParameters["FK_ID"].DefaultValue = categoryId;
                SqlDataSource2.InsertParameters["date_reception"].DefaultValue = date_reception.Text;
                SqlDataSource2.InsertParameters["Num_Commande"].DefaultValue = num_commande.Text;
                
                       

                SqlDataSource2.Insert();
                ASPxEdit.ClearEditorsInContainer(ASPxFormLayout1);
                Pop_Commande.ShowOnPageLoad = false;


            }
            catch (Exception ex)
            {
                errorMessageLabel.Text = ex.Message;
                errorMessageLabel.Visible = true;
            }
        }

        protected void grid_detail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["FK_ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

      

   
    }
}