using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS
{
    public partial class REC_ECRAN_PROD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView dvObjectif2 = (DataView)DS_Objectif2.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvObjectif2 in dvObjectif2)
            {
                Txt_Objectif2.Text = drvObjectif2["NB_LIGNE_OBJECTIF"].ToString();
            }

            DataView dvObjectif1 = (DataView)DS_Objectif1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvObjectif1 in dvObjectif1)
            {
                Txt_Objectif1.Text = drvObjectif1["NB_LIGNE_OBJECTIF"].ToString();
            }


            DataView dvRealise1 = (DataView)DS_Realise1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvRealise1 in dvRealise1)
            {
                Txt_Realise1.Text = drvRealise1["ObjectifGlobal"].ToString();
            }


            DataView dvRealise2 = (DataView)DS_Realise2.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvRealise2 in dvRealise2)
            {
                Txt_Realise2.Text = drvRealise2["ObjectifGlobal"].ToString();
            }


            Smiley1.ImageUrl = ColorSmiley(Txt_Objectif1.Text.ToString(), Txt_Realise1.Text.ToString());
            Smiley2.ImageUrl = ColorSmiley(Txt_Objectif2.Text.ToString(), Txt_Realise2.Text.ToString());
            Smiley0.ImageUrl = ColorSmileyGlobal(Txt_Objectif1.Text.ToString(), Txt_Realise1.Text.ToString(), Txt_Objectif2.Text.ToString(), Txt_Realise2.Text.ToString());
            Ecart1.Text = Ecart(Txt_Objectif1.Text.ToString(), Txt_Realise1.Text.ToString()).ToString();
            Ecart2.Text = Ecart(Txt_Objectif2.Text.ToString(), Txt_Realise2.Text.ToString()).ToString();
        }


        protected void Param1_ValueChanged(object sender, EventArgs e)
        {

        }

        private string ColorSmiley(string strObjectif, string strRealise)
        {
            try
            {
                if (Convert.ToInt32(strObjectif) < Convert.ToInt32(strRealise))
                {
                    return "~/img/SmileyVert.png";
                }
                else
                {
                    return "~/img/SmileyRouge.png";
                }
            }
            catch
            {
                return "~/img/SmileyVert.png";
            }
        }
        private string ColorSmileyGlobal(string strObjectif1, string strRealise1, string strObjectif2, string strRealise2)
        {
            try
            {
                if (Convert.ToInt32(strObjectif1) + Convert.ToInt32(strObjectif2) < Convert.ToInt32(strRealise1) + Convert.ToInt32(strRealise2))
                {
                    return "~/img/SmileyVert.png";
                }
                else
                {
                    return "~/img/SmileyRouge.png";
                }
            }
            catch
            {
                return "~/img/SmileyVert.png";
            }

        }
        private int Ecart(string strObjectif, string strRealise)
        {
            try
            {
                return Convert.ToInt32(strRealise)-Convert.ToInt32(strObjectif) ;
            }
            catch
            {
                return 0;
            }

        }
    }
}