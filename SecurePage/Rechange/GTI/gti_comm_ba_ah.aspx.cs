using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using DX_DAHERCMS.SecurePage.Rechange.GTI.gestRoll;

namespace DX_DAHERCMS.SecurePage.Rechange.GTI
{
    public partial class gti_comm_ba_ah : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string lastRouleau;
            Int32 lastCarton;
            Int32 lastCommande;

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            connection.Open();


            using (var command2 = new SqlCommand(@"SELECT CONVERT(VARCHAR,ID_ROLL1) + '/' + CONVERT(VARCHAR,ID_ROLL2)+ '/' + CONVERT(VARCHAR,ID_ROLL3)
                                        FROM GTI_Tbl_Roll
                                            WHERE ID_NROLL = (SELECT MAX(ID_NROLL) FROM GTI_Tbl_Roll)", connection))
            {
                lastRouleau = (string)command2.ExecuteScalar();
            };


            using (var command3 = new SqlCommand(@"SELECT MAX(ID_CDE) as DernierCommande
                                                    FROM GTI_Tbl_Cde", connection))
            {
                lastCarton = (Int32)command3.ExecuteScalar();
            }

            using (var command4 = new SqlCommand(@"SELECT MAX(ID_CART) as DernierCarton
                                                    FROM GTI_Tbl_Roll", connection))
            {
                lastCommande = (Int32)command4.ExecuteScalar();

            }



            form_comm_E3.Text = lastRouleau;
            form_comm_E1.Text = lastCarton.ToString();
            form_comm_E6.Text = lastCommande.ToString(); ;

            connection.Close();


        }

        protected void form_comm_E4_Click(object sender, EventArgs e)
        {
            
        }

        public void AddRolls()
        {
            
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            connection.Open(); 

            int i ;
            int num_id1;
            string str_id1;
            string str_id3;
            int num_carta;
            int num_cart;
            int ChangementForcee;
            int id_carta;
            string lastRouleau;
            Int32 lastCommande;
            string id_rolla;
            int ID_LastCarton;
            int j;
            string lettre;
            

            ChangementForcee = 983;

            # region lastRouleau
            using (var command2 = new SqlCommand(@"SELECT CONVERT(VARCHAR,ID_ROLL1))
                                        FROM GTI_Tbl_Roll
                                            WHERE ID_NROLL = (SELECT MAX(ID_NROLL) FROM GTI_Tbl_Roll)", connection))
            {
                lastRouleau = (string)command2.ExecuteScalar();
            };

            #endregion

            #region last commande
            using (var command4 = new SqlCommand(@"SELECT MAX(ID_CART) as DernierCarton
                                                    FROM GTI_Tbl_Roll", connection))
            {
                lastCommande = (Int32)command4.ExecuteScalar();

            }
            # endregion

            #region last carton
            using (var command2 = new SqlCommand(@"SELECT MAX(ID_CART) from GTI_Tbl_Roll", connection))
            {

                {
                    num_carta = (int)command2.ExecuteScalar();
                };

                id_carta = num_carta + 1;
            }

            #endregion

            id_rolla = lastRouleau + "/" + "2016" + "/" + lastCommande;

            ID_LastCarton = id_carta;
            j = 0;

            #region lettre
            using (var command2 = new SqlCommand(@"CONVERT(VARCHAR,ID_ROLL3)
                                        FROM GTI_Tbl_Roll
                                            WHERE ID_NROLL = (SELECT MAX(ID_NROLL) FROM GTI_Tbl_Roll)", connection))
            {
               
                lettre = (string)command2.ExecuteScalar();
            };

            #endregion

            int qte_comm = (int)comm_qte.SelectedItem.Value;


            using (var command4 = new SqlCommand(@"SELECT MAX(ID_ROLL) as DernierCarton
                                                    FROM GTI_Tbl_Roll", connection))
            {
                int max_roll;
                max_roll = (Int32)command4.ExecuteScalar();

                if ((max_roll + qte_comm) > 983)
                {
                    str_id3 = Convert.ToString((char)charde2("a"));
                }

            }

            for (int x = 0;x <= qte_comm - 1;x++ )
            {
                num_cart = ((x/24)+1) + num_carta;

                if (num_cart != ID_LastCarton)
                {

                }


            }

        }


        public int charde2(string lettre)
        {
            int functionReturnValue = 0;
            switch (lettre)
            {
                case "A":
                    functionReturnValue = 65;
                    break;
                case "B":
                    functionReturnValue = 66;
                    break;
                case "C":
                    functionReturnValue = 67;
                    break;
                case "D":
                    functionReturnValue = 68;
                    break;
                case "E":
                    functionReturnValue = 69;
                    break;
                case "F":
                    functionReturnValue = 70;
                    break;
                case "G":
                    functionReturnValue = 71;
                    break;
                case "H":
                    functionReturnValue = 72;
                    break;
                case "I":
                    functionReturnValue = 73;
                    break;
                case "J":
                    functionReturnValue = 74;
                    break;
                case "K":
                    functionReturnValue = 75;
                    break;
                case "L":
                    functionReturnValue = 76;
                    break;
                case "M":
                    functionReturnValue = 77;
                    break;
                case "N":
                    functionReturnValue = 78;
                    break;
                case "O":
                    functionReturnValue = 79;
                    break;
                case "P":
                    functionReturnValue = 80;
                    break;
                case "Q":
                    functionReturnValue = 81;
                    break;
                case "R":
                    functionReturnValue = 82;
                    break;
                case "S":
                    functionReturnValue = 83;
                    break;
                case "T":
                    functionReturnValue = 84;
                    break;
                case "U":
                    functionReturnValue = 85;
                    break;
                case "V":
                    functionReturnValue = 86;
                    break;
                case "W":
                    functionReturnValue = 87;
                    break;
                case "X":
                    functionReturnValue = 88;
                    break;
                case "Y":
                    functionReturnValue = 89;
                    break;
                case "Z":
                    functionReturnValue = 90;
                    break;
            }
            return functionReturnValue;


        }
}
    }

