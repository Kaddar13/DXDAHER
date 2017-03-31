using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Industrie.DemandeLogistic.SpeedUp
{
    public partial class SU_Regul : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ds_IDPEEDUP_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {

           
        }

        protected void ds_IDPEEDUP_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            TextBox1.Text = "update";
        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {

            using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SU_Update", sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@IDSPEEDUP", SqlDbType.VarChar).Value = e.NewValues["IDSPEEDUP"];

                    sqlConnection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void ASPxGridView1_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {

            string IdSpeedup = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, "IDSPEEDUP").ToString();


            using (var sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SU_Update", sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@IDSPEEDUP", SqlDbType.VarChar).Value = IdSpeedup;

                    sqlConnection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

    }
}