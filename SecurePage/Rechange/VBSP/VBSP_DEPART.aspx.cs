using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Rechange.VBSP
{
    public partial class VBSP_DEPART : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_date.Text = DateTime.Now.ToShortDateString();
            //txt_pn.Attributes.Add("onkeypress", "return handleTab('" + ASPxButton.ClientID + "',event)");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
        }
        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            DbCommand command = e.Command;
            DbConnection cx = command.Connection;
            cx.Open();
            DbTransaction tx = cx.BeginTransaction();
            command.Transaction = tx;

        }
        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            DbCommand command = e.Command;
            DbTransaction tx = command.Transaction;
            bool OtherProcessSucceeded = true;
            if (OtherProcessSucceeded)
            {
                tx.Commit();
                ASPxLabel.Text = "OK";

            }
            else
            {
                tx.Rollback();
                ASPxLabel.Text = "KO";
            }

        }


        protected void DS_Update()
        {
            SqlDataSource1.Update();
        }

        protected void txt_pn_TextChanged(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
            txt_pn.Focus();
        }



    }
}