using System;
using DevExpress.Utils;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using DevExpress.Web;
using System.Text;
using DevExpress.Data;
using System.Linq;

namespace DX_DAHERCMS
{
    public partial class ORDO_MAGASIN : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bnt_Lock_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
            connection.Open();
            SqlCommand sqlComm2 = new SqlCommand();
            sqlComm2 = connection.CreateCommand();
            sqlComm2.CommandText = @"UPDATE [dbo].[T_Ordo_Appointments_DragAndDrop] SET [Locke] = 1 , [Locke_Date] = GETDATE()  WHERE CONVERT(VARCHAR(10),Start,103) = CONVERT(VARCHAR(10),GETDATE(),103)";
            SqlCommand sqlComm3 = new SqlCommand();
            sqlComm3 = connection.CreateCommand();
            sqlComm3.CommandText = @"UPDATE T_Ordo SET T_Ordo.Statut = 2 FROM   T_Ordo INNER JOIN T_Ordo_Appointments_DragAndDrop ON T_Ordo_Appointments_DragAndDrop.AppointmentID = T_Ordo.AppointmentID WHERE CONVERT(VARCHAR(10),[T_Ordo_Appointments_DragAndDrop].Start,103) = CONVERT(VARCHAR(10),GETDATE(),103) AND T_ordo.Statut = 1";
            
            sqlComm2.ExecuteNonQuery();
            sqlComm3.ExecuteNonQuery();
            connection.Close();
            
        }      
        private string GetSelectedValues(DataTable DS, string OTGROUPE)
        {

            var result = new StringBuilder();
            //for (int i = 0; i < DS.Columns.Count; i++)
            //{
            //    //result.Append(DS.Columns[i].ColumnName);
            //    result.Append(i == DS.Columns.Count - 1 ? "\n" : ",");
            //}


            //DS.Select("Groupe Like '1%'");
            //DataTable dsOT = DS.Copy();

          if (OTGROUPE == "GROUPE")
          {
            int[] fibarray = new int[] { 1, 2, 3, 4, 5 };
            foreach (DataRow row in DS.Rows)
            {
                foreach (int element in fibarray)
                {
                    for (int i = 0; i < DS.Columns.Count; i++)
                    {                      
                        result.Append("000" + row[i].ToString() + "_" + element);
                        result.Append(i == DS.Columns.Count - 1 ? "\n" : ",");
                    }
                }
            }
          }
          else
          {
              foreach (DataRow row in DS.Rows)
              {                  
                      for (int i = 0; i < DS.Columns.Count; i++)
                      {
                          result.Append("00" + row[i].ToString());
                          result.Append(i == DS.Columns.Count - 1 ? "\n" : ",");
                      }
                  
              }
          }
            return result.ToString();
          
        }
        private DataTable GetDataView(ASPxGridView grid)
        {
            DataTable dt = new DataTable();
            foreach (GridViewColumn col in grid.VisibleColumns)
            {
                GridViewDataColumn dataColumn = col as GridViewDataColumn;
                if (dataColumn == null) continue;
                dt.Columns.Add(dataColumn.FieldName);
            }
            for (int i = 0; i < grid.VisibleRowCount; i++)
            {
                DataRow row = dt.Rows.Add();
                foreach (DataColumn col in dt.Columns)
                    row[col.ColumnName] = grid.GetRowValues(i, col.ColumnName);
            }
            return dt;
        }
        protected string GetClientButtonClickHandler(RepeaterItem container)
        {
            return string.Format("function(s, e) {{ ShowWidgetPanel('{0}') }}", container.DataItem);
        }
        void ChangeSeriesVisibility()
        {
            List<DataFilter> filters = new List<DataFilter>();
            foreach (List<object> dataList in WebChartControlPie.SelectedItems)
            {
                if (dataList.Count > 0)
                {
                    DataRowView dataRow = dataList[0] as DataRowView;
                    string region = (string)dataRow.Row["Libelle_Gare"];
                    DataFilter selectedSeriesFilter = new DataFilter("Libelle_Gare", typeof(string).FullName, DataFilterCondition.Equal, region);
                    filters.Add(selectedSeriesFilter);

                    Txt_NomGare.Value = region.Trim();
                    //Filtre du Grid a partir de la selection du Graph
                    Grid_Data.FilterExpression = "Libelle_Gare like '" + region + "%'";
                    //Grid_Liste_AppPoste.FilterExpression = "Libelle_Gare like '" + region + "%'";
                    //ASPxMemo1.Visible = false;

                    //if ((region == "MACS") || (region == "AUTRES GARES"))
                    //{
                    //    cb_app.Visible = false;
                    //}

                }
            }
      



        }
        protected void WebChartControlPie_ObjectSelected(object sender, HotTrackEventArgs e)
        {
            if (!(e.Object is Series))
            {
                e.Cancel = true;
                //WebChartControlPie.SelectedItems.Clear();
            }
        }
        protected void WebChartControlPie_SelectedItemsChanged(object sender, SelectedItemsChangedEventArgs e)
        {
            ChangeSeriesVisibility();
        }

        protected void btn_Generateur_Click(object sender, EventArgs e)
        {
            int siValue = Convert.ToInt32(Grid_Data.GetTotalSummaryValue(Grid_Data.TotalSummary["Demande", DevExpress.Data.SummaryItemType.Sum]));
            Txt_SUM.Value = siValue;         

            //DataTable :Liste des Groupe OT Encours
            DataTable dt = GetDataView(Grid_Data);
            DataTable ListeEncoursGroupeOT = dt.Copy();
            ListeEncoursGroupeOT.Select("Statut = 2", "[Date de création] ASC");
            ListeEncoursGroupeOT.Columns.Remove("Libelle_Gare");
            ListeEncoursGroupeOT.Columns.Remove("Nb_Traite");
            ListeEncoursGroupeOT.Columns.Remove("Statut");
            ListeEncoursGroupeOT.Columns.Remove("Start");
            ListeEncoursGroupeOT.Columns.Remove("Date de création");
            ListeEncoursGroupeOT.Columns.Remove("clé gare");
           

if ((cb_ligne.Checked) & (!cb_app.Checked ))
{
                #region 'Flux MACS et Autres Gares
    ///Si c'est du flux Pousse
             if ((Txt_NomGare.Value.ToString() == "AUTRES GARES") || (Txt_NomGare.Value.ToString() == "MACS"))
            {
                if (Convert.ToInt32(Txt_SUM.Value.ToString()) <= Convert.ToInt32(Txt_NbGeneration.Value.ToString()))
                {
                    GridToMemo(ListeEncoursGroupeOT);  
                }
                else
                {
                    Boucle(ListeEncoursGroupeOT);                    
                }
            }
    #endregion
             ///Si c est du flux tire
             else
             {
                 #region 'Flux Tire

                 step.Text = "FLUX TIRE";
                 if (Convert.ToInt32(Txt_SUM.Value.ToString()) <= Convert.ToInt32(Txt_NbGeneration.Value.ToString()))
                 {
                     GridToMemo(ListeEncoursGroupeOT);                    
                 }
                 else
                 {
                     Boucle(ListeEncoursGroupeOT);
                 }
             }
            
}
else if ((!cb_ligne.Checked) & (cb_app.Checked))
{
    #region 'Genration par Appareil Poste
    ///Selection des Criteres issues du grid AppPoste
    string CritApp = ASPxGridLookup1.GridView.GetRowValues(ASPxGridLookup1.GridView.FocusedRowIndex, "Appareil").ToString();
    string CritPoste = ASPxGridLookup1.GridView.GetRowValues(ASPxGridLookup1.GridView.FocusedRowIndex, "poste").ToString();

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
               string query = "SELECT dbo.T_Ordo.Groupe, dbo.T_Ordo.AppointmentID,COunt(dbo.T_Ordo_Appointments_DragAndDrop.NB_LIGNE) as Demande ";
               query = query + "FROM dbo.T_Ordo INNER JOIN ";
               query = query + "dbo.T_Ordo_TypeOrdo ON dbo.T_Ordo.[Clé gare] = dbo.T_Ordo_TypeOrdo.Cle_Gare RIGHT OUTER JOIN ";
               query = query +  "dbo.T_Ordo_Appointments_DragAndDrop ON dbo.T_Ordo.AppointmentID = dbo.T_Ordo_Appointments_DragAndDrop.AppointmentID ";
               query = query + "GROUP BY dbo.T_Ordo_Appointments_DragAndDrop.NB_LIGNE,dbo.T_Ordo.[Type magasin cédant], dbo.T_Ordo.Statut, dbo.T_Ordo.Groupe, dbo.T_Ordo_Appointments_DragAndDrop.Start, dbo.T_Ordo_TypeOrdo.Libelle_Gare,dbo.T_Ordo.AppointmentID, ";
               query = query +  "dbo.T_Ordo_Appointments_DragAndDrop.Appareil, dbo.T_Ordo_Appointments_DragAndDrop.Poste_Appareil ";
               query = query +"HAVING      (dbo.T_Ordo.[Type magasin cédant] = N'5AU') AND (dbo.T_Ordo.Statut = 2) AND (dbo.T_Ordo_TypeOrdo.Libelle_Gare = N'"+Txt_NomGare.Text+"') AND ";
               query = query +"(dbo.T_Ordo_Appointments_DragAndDrop.Appareil = N'"+CritApp+"') AND (dbo.T_Ordo_Appointments_DragAndDrop.Poste_Appareil = N'"+CritPoste+"')";
                
                SqlCommand cmd = new SqlCommand(query,con);
                con.Open();
                DataTable dt_ListeGroupApp = new DataTable();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt_ListeGroupApp );
                GridToMemo(dt_ListeGroupApp);
  
#endregion
}
else if ((cb_ligne.Checked) & (cb_app.Checked))
{
    if (Convert.ToInt32(Txt_SUM.Value.ToString()) <= Convert.ToInt32(Txt_NbGeneration.Value.ToString()))
    {
        ASPxGridView1.DataSource = ListeEncoursGroupeOT;
        ASPxGridView1.DataBind();
        ASPxMemo1.Text = ASPxMemo1.Text + GetSelectedValues(ListeEncoursGroupeOT, "GROUPE");
    }
    else
    {
        Boucle(ListeEncoursGroupeOT);
        
    }
}
                 #endregion

        }
        protected void cb_app_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_app.Checked == true) 
            {
                ASPxGridLookup1.Visible = true;
                ASPxGridLookup1.DataBind();                
                
                
            }
            else
            {
                ASPxGridLookup1.Visible = false;
            }
        }
        protected void cb_ligne_CheckedChanged(object sender, EventArgs e)
        {
            if (cb_ligne.Checked == true)
            {
                Txt_NbGeneration.Visible = true;
            }
            else
            {
                Txt_NbGeneration.Visible = false;
            }
        }
        protected void Btn_copy_Click(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString);
                 connection.Open();
                 SqlCommand sqlComm2 = new SqlCommand();
                 sqlComm2 = connection.CreateCommand();

            DataTable dt = GetDataView(ASPxGridView1);
            DataTable ListeGroupeActif = dt.Copy();
             foreach (DataRow dr in ListeGroupeActif.Rows )
             {
                 
                 sqlComm2.CommandText = @"UPDATE [dbo].[T_ORDO] SET Statut = 3  WHERE AppointmentID = '" + dr["AppointmentID"].ToString() + "'";
                 sqlComm2.ExecuteNonQuery();
             }

             WebChartControlPie.RefreshData();
             Grid_Data.DataBind();
             ASPxMemo1.Visible = true;

                
        }
        protected void Boucle(DataTable dtGroupeOT)
        {
            object sumObject;
            sumObject = 0;

            DataTable result = new DataTable();
            result.Columns.Add("Groupe", typeof(string));
            result.Columns.Add("Demande", typeof(int));
            result.Columns.Add("AppointmentID", typeof(int));

            //DataTable : Total des Ot a Inserer en fonction de la Qte user
            DataTable ListeGenerer = new DataTable();
            ListeGenerer.Columns.Add("Groupe", typeof(string));
            ListeGenerer.Columns.Add("Demande", typeof(int));
            ListeGenerer.Columns.Add("AppointmentID", typeof(int));

            #region 'Boucle OT par OT pour atteindre au moins le nombre de lignes demandées
            do
            {
                var mimo = (from table1 in dtGroupeOT.AsEnumerable()
                            join table2 in ListeGenerer.AsEnumerable() on (string)table1["Groupe"] equals (string)table2["Groupe"] into gj
                            from subpet in gj.DefaultIfEmpty()
                            where subpet == null
                            select new
                            {
                                Groupe = (subpet == null ? String.Empty : subpet["Groupe"]),
                                GroupeOT = table1["Groupe"],
                                Demande = table1["Demande"],
                                AppointmentID = table1["AppointmentID"]
                            }).Take(1);

                foreach (var item in mimo)
                {
                    result.Rows.Add(item.GroupeOT, item.Demande, item.AppointmentID);
                }

                foreach (DataRow dr in result.Rows)
                {
                    ListeGenerer.Rows.Add(dr.ItemArray);

                }

                       

                sumObject = result.Compute("Sum(Demande)", "");
                cdt2.Text = sumObject.ToString();

            } 
            while (Convert.ToInt32(cdt2.Text.ToString()) < Convert.ToInt32(Txt_NbGeneration.Value.ToString()));
            GridToMemo(result);

            #endregion
        }
        protected void GridToMemo(DataTable datatable)
        {
            DataTable r2 = datatable.Copy();
            r2.Columns.Remove("Demande");

            //DataTable dtGroupe = r2.Copy();

            DataView dvGroupe = new DataView(r2);
            dvGroupe.RowFilter = "[Groupe] Like '3%'";


            //DataTable dtOT = r2.Copy();
            DataView dvOT = new DataView(r2);
            dvOT.RowFilter = "[Groupe] Like '1%'";

            DataTable dtActif = dvGroupe.ToTable();
            dtActif.Merge(dvOT.ToTable());

            ASPxGridView1.DataSource = dtActif;
            ASPxGridView1.DataBind();


            DataTable dtOT2 = dvOT.ToTable();
            dtOT2.Columns.Remove("AppointmentID");

            DataTable dtGroupe2 = dvGroupe.ToTable();
            dtGroupe2.Columns.Remove("AppointmentID");

            ASPxMemo1.Text = ASPxMemo1.Text + GetSelectedValues(dtOT2, "OT") + GetSelectedValues(dtGroupe2, "GROUPE");

        }
    }
}