using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.ToolBox.SPEEDUP
{
    public partial class SU_NEW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_user.Text = Environment.UserName;

        }
        protected void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                #region Insertion de la SpeedUp
                SqlDataSource1.InsertParameters["SU_Destinataire"].DefaultValue = txt_su_destinataire.Text;
                SqlDataSource1.InsertParameters["SU_EOTP"].DefaultValue = txt_SU_EOTP.Text;
                SqlDataSource1.InsertParameters["SU_Localisation"].DefaultValue = HiddenField1.Value;
                SqlDataSource1.InsertParameters["SU_Affectation"].DefaultValue = HiddenField1.Value;
                SqlDataSource1.InsertParameters["SU_Site"].DefaultValue = txt_SiteDepart.Text;
                SqlDataSource1.InsertParameters["SU_SiteDepart"].DefaultValue = txt_SiteDepart.Text;
                SqlDataSource1.InsertParameters["SU_Type"].DefaultValue = Rbl_SU_Type.SelectedItem.Value.ToString();
                SqlDataSource1.InsertParameters["SU_Telephone"].DefaultValue = txt_telephone.Text;
                SqlDataSource1.InsertParameters["SU_Commentaire"].DefaultValue = txt_commentaire.Text;

                SqlDataSource1.InsertParameters["Reception_BR"].DefaultValue = txt_reception_br.Text;
                SqlDataSource1.InsertParameters["Reception_Commande"].DefaultValue = txt_reception_commande.Text;
                SqlDataSource1.InsertParameters["Reception_DateLivraison"].DefaultValue = txt_reception_datelivraion.Text;
                SqlDataSource1.InsertParameters["Reception_Fournisseur"].DefaultValue = txt_reception_fournisseur.Text;
                SqlDataSource1.InsertParameters["Reception_Origine"].DefaultValue = txt_reception_origine.Text;
                SqlDataSource1.InsertParameters["Reception_Track"].DefaultValue = txt_reception_track.Text;
                SqlDataSource1.InsertParameters["Reception_Transporteur"].DefaultValue = txt_reception_transporteur.Text;
                SqlDataSource1.InsertParameters["Reception_ZLECI"].DefaultValue = txt_reception_zleci.Text;
                SqlDataSource1.InsertParameters["Reception_PosteCommande"].DefaultValue = txt_reception_postecommande.Text;

                SqlDataSource1.InsertParameters["Expedition_Appareil"].DefaultValue = txt_expedition_appareil.Text;
                SqlDataSource1.InsertParameters["Expedition_BE"].DefaultValue = txt_expedition_be.Text;
                SqlDataSource1.InsertParameters["Expedition_FAL"].DefaultValue = txt_expedition_fal.Text;

                SqlDataSource1.InsertParameters["Distribtuion_GareArrivee"].DefaultValue = txt_distribution_garearrivee.Text;
                SqlDataSource1.InsertParameters["Distribtuion_GareDepart"].DefaultValue = txt_distribution_garedepart.Text;

                SqlDataSource1.InsertParameters["Distribution_Poids"].DefaultValue = txt_distribution_poids.Text.Replace(".", ",");
                SqlDataSource1.InsertParameters["Distribution_Longeur"].DefaultValue = Spin_Longueur.Value.ToString();
                    //txt_distribution_longueur.Text.Replace(".", ",");
                SqlDataSource1.InsertParameters["Distribution_Largeur"].DefaultValue = SpinLargeur.Value.ToString(); 
                //txt_distribution_largeur.Text.Replace(".", ",");
                SqlDataSource1.InsertParameters["Distribution_Hauteur"].DefaultValue = SpinHauteur.Value.ToString();
                    //txt_distribution_Hauteur.Text.Replace(".", ",");


                SqlDataSource1.InsertParameters["Autre_Commentaire"].DefaultValue = txt_autre_commentaire.Text;
                SqlDataSource1.InsertParameters["Autre_PVL"].DefaultValue = txt_autre_pvl.Text;
                SqlDataSource1.InsertParameters["Autre_Litige"].DefaultValue = txt_autre_litige.Text + txt_autre_litige2.Text;

                SqlDataSource1.InsertParameters["BL"].DefaultValue = txt_BL1.Text + ASPxTextBox1.Text;
                SqlDataSource1.InsertParameters["SU_TrpDediee"].DefaultValue = txt_trpDediee.Text + txt_trpDedieeMag.Text ;
                    //Convert.ToString(txt_trpDediee.SelectedItem.GetValue("txt_trpDediee"));
                SqlDataSource1.InsertParameters["AOG"].DefaultValue = txt_AOG.Text;

                SqlDataSource1.InsertParameters["Dossier_Demandeur"].DefaultValue = txt_dossier_demandeur.Text;
                SqlDataSource1.InsertParameters["Dossier_OF"].DefaultValue = txt_dossier_OF.Text;

                SqlDataSource1.InsertParameters["DocLibre"].DefaultValue = txt_doclibre.Text + txt_doclibre2.Text;
                SqlDataSource1.InsertParameters["OT"].DefaultValue = txt_ot.Text + txt_ot2.Text;
                SqlDataSource1.InsertParameters["OT_Poste"].DefaultValue = txt_ot_poste.Text + txt_otposte2.Text;
                SqlDataSource1.InsertParameters["Quantite"].DefaultValue = txt_quantite.Text;
                SqlDataSource1.InsertParameters["Designation"].DefaultValue = txt_designation.Text;
                SqlDataSource1.InsertParameters["Reference"].DefaultValue = txt_reference.Text + txt_reference2.Text + txt_reference3.Text;
                SqlDataSource1.InsertParameters["Stock_Mag"].DefaultValue = txt_stock_mag.Text;
                SqlDataSource1.InsertParameters["UserDemande"].DefaultValue = txt_demandeur.Text;
                SqlDataSource1.Insert();


                ASPxEdit.ClearEditorsInContainer(formLayout);

#endregion
           }
            catch (Exception ex)
            {
                errorMessageLabel.Text = ex.Message;
                errorMessageLabel.Visible = true;
                
            }
            
        }

        protected void ASPxCallbackPanel1_Callback(object sender, CallbackEventArgsBase e)
        {
            FillRadioList(e.Parameter);   
           
        }

        protected void FillRadioList(string type)
        {
            if (string.IsNullOrEmpty(type)) return;
            SqlDataSource2.SelectParameters[0].DefaultValue = type;
            txt_SU_Localisation.DataBind();
            txt_SU_Localisation.SelectedIndex = -1;
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
        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            string sID = e.Command.Parameters["@QuoteID"].Value.ToString();
            lbl_numspeed.Text = "Voici votre Numero de suivi SpeedUp :" + sID.ToString();


            DS_Mouvement.InsertParameters["Statut"].DefaultValue = "Creation SU";
            DS_Mouvement.InsertParameters["Affectation"].DefaultValue = HiddenField1.Value;
            DS_Mouvement.InsertParameters["ID_SPEEDUP"].DefaultValue = sID.ToString();
            DS_Mouvement.Insert();



            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            string commandText = "DECLARE	@return_value int EXEC	@return_value = [dbo].[sp_SU_Update] @IDSPEEDUP= '" + sID.ToString() + "'SELECT	'Return Value' = @return_value";
            RunCommandAsynchronously(commandText, sqlConn);

            //using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString))
            //{
            //    using (SqlCommand cmd = new SqlCommand("sp_SU_Update", sqlConnection))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;

            //        cmd.Parameters.Add("@IDSPEEDUP", SqlDbType.VarChar).Value = sID.ToString();


            //        sqlConnection.Open();
            //        cmd.ExecuteNonQuery();
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

                   
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            
        }
        private static void RunCommandAsynchronously(string commandText, SqlConnection connectionString)
        {
            // Given command text and connection string, asynchronously execute
            // the specified command against the connection. For this example,
            // the code displays an indicator as it is working, verifying the 
            // asynchronous behavior. 
            using (SqlConnection connection = connectionString)
            {
                try
                {
                    int count = 0;
                    SqlCommand command = new SqlCommand(commandText, connection);
                    connection.Open();

                    IAsyncResult result = command.BeginExecuteNonQuery();
                    while (!result.IsCompleted)
                    {

                        Console.WriteLine("Waiting ({0}", count++);
                        // Wait for 1/10 second, so the counter
                        // does not consume all available resources 
                        // on the main thread.
                        System.Threading.Thread.Sleep(100);
                    }
                    Console.WriteLine("Command complete. Affected {0} rows.",
                        command.EndExecuteNonQuery(result));
                }
                catch (SqlException ex)
                {
                    Console.WriteLine("Error ({0}): {1}", ex.Number, ex.Message);
                }
                catch (InvalidOperationException ex)
                {
                    Console.WriteLine("Error: {0}", ex.Message);
                }
                catch (Exception ex)
                {
                    // You might want to pass these errors
                    // back out to the caller.
                    Console.WriteLine("Error: {0}", ex.Message);
                }
            }
        }
       
        }
      
    }
