using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.ToolBox.SPEEDUP
{
    public partial class GUICHETSLA_NEW : System.Web.UI.Page
    {
    string str_filename;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.InsertParameters["SU_EOTP"].DefaultValue = txt_sigle.Text;
                SqlDataSource1.InsertParameters["Type_Demande"].DefaultValue = "GUICHET";
                SqlDataSource1.InsertParameters["UserDemande"].DefaultValue = txt_email.Text;
                SqlDataSource1.InsertParameters["SU_Telephone"].DefaultValue = txt_telephone.Text;
                SqlDataSource1.InsertParameters["Stock_Mag"].DefaultValue = txt_Magasin.Text;
                SqlDataSource1.InsertParameters["Num_Resa"].DefaultValue = txt_resa.Text;
                SqlDataSource1.InsertParameters["Autre_PVL"].DefaultValue = txt_Enlevement.Value.ToString();
                SqlDataSource1.InsertParameters["Reference"].DefaultValue = txt_ref1.Text;
                SqlDataSource1.InsertParameters["Quantite"].DefaultValue = txt_ref1Qte.Text;
                SqlDataSource1.InsertParameters["Reference2"].DefaultValue = txt_ref2.Text;
                SqlDataSource1.InsertParameters["Qte2"].DefaultValue = txt_ref2Qte.Text;
                SqlDataSource1.InsertParameters["Reference3"].DefaultValue = txt_ref3.Text;
                SqlDataSource1.InsertParameters["Qte3"].DefaultValue = txt_ref3Qte.Text;
                SqlDataSource1.InsertParameters["Reference4"].DefaultValue = txt_ref4.Text;
                SqlDataSource1.InsertParameters["Qte4"].DefaultValue = txt_ref4Qte.Text;
                SqlDataSource1.InsertParameters["Reference5"].DefaultValue = txt_ref5.Text;
                SqlDataSource1.InsertParameters["Qte5"].DefaultValue = txt_ref5Qte.Text;
                SqlDataSource1.InsertParameters["Txt_appareil"].DefaultValue = txt_appareil.Text;


                if (  string.IsNullOrEmpty(FileUpload1.FileName) == true){
                    SqlDataSource1.InsertParameters["Txt_File"].DefaultValue = "0";
                }
                else {
                     SqlDataSource1.InsertParameters["Txt_File"].DefaultValue = "1";
                }
               
                
                SqlDataSource1.Insert();
                ASPxEdit.ClearEditorsInContainer(formLayout);

            }
            catch (Exception ex)
            {
                errorMessageLabel.Text = ex.Message;
                errorMessageLabel.Visible = true;
            }
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string sID = e.Command.Parameters["@QuoteID"].Value.ToString();
            lbl_numspeed.Text = "Voici votre Numero de Reservation Guichet :" + sID.ToString();

            FileUpload1.SaveAs(Server.MapPath("/App_Data/Guichet_MSG/" + sID.ToString()+".msg"));
        
            //if (DocumentsUploadControl.UploadedFiles.Length > 0)
            //{
            //    foreach (var file in DocumentsUploadControl.UploadedFiles)
            //    {
            //        file.SaveAs(MapPath("/App_Data/Guichet_MSG/"+ sID.ToString()));
            //    }
            //}


            PopupWindow pcWindow = new PopupWindow(lbl_numspeed.Text);
            pcWindow.FooterText = DateTime.Now.ToString("MM/dd/yyyy HH:mm");
            pcWindow.ShowOnPageLoad = true;
            pcWindow.Left = StartLeft;
            pcWindow.Top = StartTop;
            StartLeft += 20;
            StartTop += 20;
            ASPxPopupControl1.Windows.Add(pcWindow);
            //ASPxMemo1.Text = WindowText;
            //ASPxMemo1.Style[HtmlTextWriterStyle.Color] = "gray";

        }
        
        int StartLeft
        {
            set { ViewState["StartLeft"] = value; }
            get { return ViewState["StartLeft"] != null ? (int)ViewState["StartLeft"] : 650; }
        }
        int StartTop
        {
            set { ViewState["StartTop"] = value; }
            get { return ViewState["StartTop"] != null ? (int)ViewState["StartTop"] : 270; }
        }

        protected void DocumentsUploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {

            str_filename = Server.MapPath("/App_Data/Guichet_MSG/" + e.UploadedFile.FileName);
            e.UploadedFile.SaveAs(str_filename);  
            
        }

       

     
    }
}