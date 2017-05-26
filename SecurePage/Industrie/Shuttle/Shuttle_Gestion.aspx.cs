using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Industrie.Shuttle
{
    public partial class Shuttle_Gestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
  
        }

        protected void Grid_DataSelect(object sender, EventArgs e)
        {
            Session["ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)      

{
    // if (e.Column.FieldName == "Depart"){
    //     //ASPxComboBox myCombo1 = (ASPxComboBox)e.Editor;
    //     //myCombo1.Callback += new CallbackEventHandlerBase(cmbArrivee_OnCallback);
    // }
    //else 
         if (e.Column.FieldName == "Arrivee")
    {
  
        ASPxComboBox myCombo1 = (ASPxComboBox)e.Editor;
        myCombo1.Callback += new CallbackEventHandlerBase(cmbDepart_OnCallback);
    }
    else if (e.Column.FieldName == "Type")
    {
    
        ASPxComboBox myCombo2 = (ASPxComboBox)e.Editor;
        myCombo2.Callback += new CallbackEventHandlerBase(cmbArrivee_OnCallback);
    }
     else if (e.Column.FieldName == "Tranporteur")    
     {
        
         ASPxComboBox myCombo3 = (ASPxComboBox)e.Editor;
         myCombo3.Callback += new CallbackEventHandlerBase(cmbType_OnCallback);
     }
         else if (e.Column.FieldName == "Metre_Lineaire")
         {
             ASPxComboBox myCombo3 = (ASPxComboBox)e.Editor;
             myCombo3.Callback += new CallbackEventHandlerBase(cmbTransporteur_OnCallback);
         }



    if (!(sender as ASPxGridView).IsEditing || e.Column.FieldName != "Depart" || e.Column.FieldName != "Arrivee" || e.Column.FieldName != "Type"||e.Column.FieldName != "Transporteur") return;

    object val1 = (sender as ASPxGridView).GetRowValuesByKeyValue(e.KeyValue, "Depart");
    object val2 = (sender as ASPxGridView).GetRowValuesByKeyValue(e.KeyValue, "Arrivee");
    object val3 = (sender as ASPxGridView).GetRowValuesByKeyValue(e.KeyValue, "Type");
    object val4 = (sender as ASPxGridView).GetRowValuesByKeyValue(e.KeyValue, "Transporteur");

        }

        void cmbDepart_OnCallback(object source, CallbackEventArgsBase e)
        {
            ASPxComboBox cb = (ASPxComboBox)source;
            Session["param_depart"] = e.Parameter;          
            cb.DataBind();

        }

        void cmbArrivee_OnCallback(object source, CallbackEventArgsBase e)
        {
            ASPxComboBox cb = (ASPxComboBox)source;
            Session["param_arrivee"] = e.Parameter;
            cb.DataBind();

        }

        void cmbType_OnCallback(object source, CallbackEventArgsBase e)
        {
            ASPxComboBox cb = (ASPxComboBox)source;
            Session["param_type"] = e.Parameter;
            cb.DataBind();

        }
        void cmbTransporteur_OnCallback(object source, CallbackEventArgsBase e)
        {
            ASPxComboBox cb = (ASPxComboBox)source;
            //Session["param_type"] = e.Parameter;
            cb.DataBind();

        }
       
    }
}