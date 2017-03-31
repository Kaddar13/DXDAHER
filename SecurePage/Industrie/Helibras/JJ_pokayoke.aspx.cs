using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Media;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.ToolBox.Industrie
{
    public partial class JJ_pokayoke : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void InsertClick(object sender, EventArgs e)
        {
                SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);

                string commandText = "SELECT COUNT(*) FROM [T_JJ_SAP] WHERE NumColis = @COLIS AND NumCommande = @COMMANDE AND [Item Label] = @LIVRAISON";


            ASPxComboBox cboColis = ASPxFormLayout1.FindControl("cboColis") as ASPxComboBox;
            ASPxComboBox cboCommande = ASPxFormLayout1.FindControl("cboCommande") as ASPxComboBox;
            ASPxTextBox txtLivraison = ASPxFormLayout1.FindControl("txtLivraison") as ASPxTextBox;
            ASPxImage image = ASPxFormLayout1.FindControl("ASPxImage1") as ASPxImage;

            SqlCommand command = new SqlCommand(commandText, sqlConnection1);
            command.Parameters.AddWithValue("@Colis", cboColis.Text);
            command.Parameters.AddWithValue("@Commande", cboCommande.Text);
            command.Parameters.AddWithValue("@Livraison", txtLivraison.Text);

            command.CommandType = CommandType.Text;
            command.Connection = sqlConnection1;

            //txt_log.Text = "";
            try
            {
                sqlConnection1.Open();
                Int32 rows = (Int32)command.ExecuteScalar();
                if (rows > 0)
                {
                    ds_temp.InsertParameters["COMMANDE"].DefaultValue = cboCommande.Text;
                    ds_temp.InsertParameters["COLIS"].DefaultValue = cboColis.Text;
                    ds_temp.InsertParameters["LIVRAISON"].DefaultValue = txtLivraison.Text;
                    ds_temp.InsertParameters["USER"].DefaultValue = User.Identity.Name;
                    ds_temp.InsertParameters["Evenement"].DefaultValue = "OK";
                    ds_temp.Insert();
                    grid2.DataBind();
                    grid1.DataBind();
                    grid_recap.DataBind();
                    //Session["Log"] = Session["Log"] + "Saisie valide :" + txtLivraison.Text + "\n";
                    //txt_log.Text = Session["Log"].ToString();
                    txtLivraison.Focus();
                    ASPxFormLayout1.BackColor = System.Drawing.Color.FromName("#00cc99");
                   
                }
                else if (rows == 0)
                {
                    ASPxFormLayout1.BackColor = System.Drawing.Color.FromName("#ff4d4d");

                    ds_temp.InsertParameters["COMMANDE"].DefaultValue = cboCommande.Text;
                    ds_temp.InsertParameters["COLIS"].DefaultValue = cboColis.Text;
                    ds_temp.InsertParameters["LIVRAISON"].DefaultValue = txtLivraison.Text;
                    ds_temp.InsertParameters["USER"].DefaultValue = User.Identity.Name;
                    ds_temp.InsertParameters["Evenement"].DefaultValue = "KO";
                    ds_temp.Insert();
                    grid2.DataBind();
                    grid1.DataBind();
                    grid_recap.DataBind();


                    //string sSelectedAudio = Server.MapPath(@"\sounds\Error.wav");
                    //SoundPlayer objSoundPlayer = new SoundPlayer(sSelectedAudio);
                    //objSoundPlayer.Play();
                    //Session["Log"] = Session["Log"] + "Saisie non valides :" + txtLivraison.Text + "\n";
                    //txt_log.Text = Session["Log"].ToString();
                    
                    txtLivraison.Focus();
                }
                   
                       
            }
            catch (Exception ex)
            {
                ds_temp.InsertParameters["COMMANDE"].DefaultValue = cboCommande.Text;
                ds_temp.InsertParameters["COLIS"].DefaultValue = cboColis.Text;
                ds_temp.InsertParameters["LIVRAISON"].DefaultValue = txtLivraison.Text;
                ds_temp.InsertParameters["USER"].DefaultValue = User.Identity.Name;
                ds_temp.InsertParameters["Evenement"].DefaultValue = "Doublon";
                ds_temp.Insert();
                grid2.DataBind();
                grid1.DataBind();
                grid_recap.DataBind();
                ASPxFormLayout1.BackColor = System.Drawing.Color.FromName("#FFCC66");
                Session["Log"] = Session["Log"] + "Doublon sur :" + txtLivraison.Text + "\n";
                txt_log.Text = ex.Message;
                //string sSelectedAudio = Server.MapPath(@"\sounds\Error.wav");
                //SoundPlayer objSoundPlayer = new SoundPlayer(sSelectedAudio);
                //objSoundPlayer.Play();
                Console.WriteLine(ex.Message);
            }

            //sqlConnection1.Close();

            
        }
       
        protected void btnUpdate(object sender, EventArgs e)
        {
            grid1.DataBind();
            grid2.DataBind();
            grid_recap.DataBind();
        }

        protected void bntPrint_Click(object sender, EventArgs e)
        {
            //ASPxFormLayout1.BackColor = System.Drawing.Color.FromName("#fffff");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PrintElem()", true);
        }

        protected void cboColis_Callback(object sender, CallbackEventArgsBase e)
        {
            ASPxComboBox cboColis = ASPxFormLayout1.FindControl("cboColis") as ASPxComboBox;
            cboColis.DataSource = ds_colis.Select(DataSourceSelectArguments.Empty);
            cboColis.DataBind();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ds_temp.Delete();
            grid1.DataBind();
            grid2.DataBind();
            grid_recap.DataBind();

        }

       

    }
}