using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Industrie
{
    public partial class Qualite_commnunication : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            string userName = User.Identity.Name;
            e.NewValues["User"] = userName;
            e.NewValues["Date"] = DateTime.Today;
        }
        protected void Grid_DataSelect(object sender, EventArgs e)
        {
            Session["UserCreateur"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
           

        }

        protected void ASPxGridView1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            string userName = User.Identity.Name;
            string UserCreateur = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "User").ToString().Trim();

            if ((ASPxGridView1.IsNewRowEditing == false && (e.Column.FieldName == "User_answer" && userName != UserCreateur )))
            {
                e.Editor.Value = userName;


            }
            if ((ASPxGridView1.IsNewRowEditing == false && (e.Column.FieldName == "Date_answer" && userName != UserCreateur)))
            {
                e.Editor.Value = DateTime.Today; ;


            }
            

            if ((ASPxGridView1.IsNewRowEditing == false && (e.Column.FieldName == "Answer"|| e.Column.FieldName == "Returned")&& userName ==UserCreateur ))
            {
                e.Editor.ReadOnly = true;
            

            }
               
            
        }
        

        
    }
}