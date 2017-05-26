using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Rechange.GTI
{
    public partial class gti_ba_ah : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {


            string Id = grid.GetRowValues(grid.FocusedRowIndex, "ID_CDE").ToString();
              string statut =  grid.GetRowValues(grid.FocusedRowIndex, "Statut").ToString();

            if (statut == "REC"){
                PopUp.HeaderText = "Alerte";
                
                PopUp.Text = "Vous ne pouvez pas supprimer une commande dont vous avez déjà validé une réception.";
                PopUp.ShowOnPageLoad = true;
            }
            else
            {
                PopUp.HeaderText = "Alerte : Confirmation de suppression";
                PopUp.Text = "Confirmez-vous la suppression de la commande n°" + Id + " ?";
                popValidation.Visible = true;
                PopUp.ShowOnPageLoad = true;
            }

          


        }

        protected void yesButton_Click(object sender, EventArgs e)
        {
            string Id = grid.GetRowValues(grid.FocusedRowIndex, "ID_CDE").ToString();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            connection.Open();
            SqlCommand sqlComm2 = new SqlCommand();
            sqlComm2 = connection.CreateCommand();
            sqlComm2.CommandText = @"DELETE  FROM GTI_Tbl_Roll WHERE ID_CDE=" + Id + "";
            SqlCommand sqlComm3 = new SqlCommand();
            sqlComm3 = connection.CreateCommand();
            sqlComm3.CommandText = @"DELETE  FROM GTI_Tbl_Cde WHERE ID_CDE=" + Id + "";
            sqlComm2.ExecuteNonQuery();
            sqlComm3.ExecuteNonQuery();
            connection.Close();
            PopUp.ShowOnPageLoad = false;
        }

       
    }
}