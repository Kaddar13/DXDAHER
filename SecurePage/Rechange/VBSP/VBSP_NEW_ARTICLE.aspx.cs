using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Export;
using DX_DAHERCMS.UserControl;
using DevExpress.XtraPrinting;
using DevExpress.Web;
using System.Globalization;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.IO;
using System.Data.Common;
using System.Configuration;

namespace DX_DAHERCMS.VBSP
{
    public partial class VBSP_NEW_ARTICLE : System.Web.UI.Page
    {
      

        protected override void InitializeCulture()
        {
            if (!string.IsNullOrEmpty(GetDXCurrentLanguageValue()))
            {
                //for regional server standards 
                Culture = GetDXCurrentLanguageValue();
                //for DevExpress localizable strings 
                UICulture = GetDXCurrentLanguageValue();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //btnGallery.Attributes.Add("onclick","window.open('WebForm2.aspx','','height=300,width=300');return false")
            if (!IsPostBack)
            {
                ddlExportMode.Items.AddRange(Enum.GetNames(typeof(GridViewDetailExportMode)));
                ddlExportMode.Text = GridViewDetailExportMode.Expanded.ToString();
            }
        }
        protected void btnXlsExport_Click(object sender, EventArgs e)
        {
            //UpdateExportMode();
            ASPxGridViewExporter1.WriteXlsToResponse(new XlsExportOptionsEx() { ExportType = ExportType.WYSIWYG });
        }
        protected void UpdateExportMode()
        {
            gridVBSP.SettingsDetail.ExportMode = (GridViewDetailExportMode)Enum.Parse(typeof(GridViewDetailExportMode), ddlExportMode.Text);
        }
        protected string GetDXCurrentLanguageValue()
        {
            return Request.Cookies["DXCurrentLanguage"] == null ? "" : Request.Cookies["DXCurrentLanguage"].Value;
        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            foreach (SqlParameter parameter in e.Command.Parameters)
            {
                if (parameter.DbType == DbType.Object)
                    parameter.SqlDbType = SqlDbType.VarBinary;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            
        }
        protected void grid_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

            string Identifiant = gridVBSP.GetRowValues(gridVBSP.FocusedRowIndex, "PartNumber").ToString();
            Session["IDPartNumber"] = Identifiant;
            gridVBSP.SettingsText.PopupEditFormCaption = "Part N° " + Identifiant;
        }

        protected void DS_VBSPEdit_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            
        }
             

        protected void FormEdit_Init(object sender, EventArgs e)
        {
            string categoryId = gridVBSP.GetRowValues(gridVBSP.FocusedRowIndex, "IDPartNumber").ToString();
            DS_VBSPImage.SelectParameters["IDPartNumber"].DefaultValue = categoryId;
        }
       
       protected void gridVBSP_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
       {
           ASPxFormLayout formedit = gridVBSP.FindEditFormTemplateControl("FormEdit") as ASPxFormLayout;
           ASPxBinaryImage imgbi1 = formedit.FindControl("txt_imgbi1") as ASPxBinaryImage;
           ASPxBinaryImage imgbi2 = formedit.FindControl("txt_imgbi2") as ASPxBinaryImage;
           ASPxBinaryImage imgbi3 = formedit.FindControl("txt_imgbi3") as ASPxBinaryImage;
           ASPxBinaryImage imgbi4 = formedit.FindControl("txt_imgbi4") as ASPxBinaryImage;

           string ID = gridVBSP.GetRowValues(gridVBSP.FocusedRowIndex, "IDPartNumber").ToString();
           Console.WriteLine(ID);
           byte[] byte1 = imgbi1.ContentBytes;
           byte[] byte2 = imgbi2.ContentBytes;
           byte[] byte3 = imgbi3.ContentBytes;
           byte[] byte4 = imgbi4.ContentBytes;

           string consString = ConfigurationManager.ConnectionStrings["Dashboard_ConnectionString"].ConnectionString;
           using (SqlConnection connection = new SqlConnection(consString))
           {
               // Create the command and set its properties.
               SqlCommand command = new SqlCommand();
               command.Connection = connection;
               command.CommandText = "VBSP_UpdateImage";
               command.CommandType = CommandType.StoredProcedure;

               // Add the input parameter and set its properties.

               SqlParameter parameter0 = new SqlParameter();
               parameter0.ParameterName = "@IDPARTNUMBER";
               parameter0.SqlDbType = SqlDbType.Int;
               parameter0.Direction = ParameterDirection.Input;
               parameter0.Value = ID;



               SqlParameter parameter1 = new SqlParameter();
               parameter1.ParameterName = "@Img1";
               parameter1.SqlDbType = SqlDbType.Image;
               parameter1.Direction = ParameterDirection.Input;
               parameter1.Value = byte1;


               SqlParameter parameter2 = new SqlParameter();
               parameter2.ParameterName = "@Img2";
               parameter2.SqlDbType = SqlDbType.Image;
               parameter2.Direction = ParameterDirection.Input;
               parameter2.Value = byte2;

               SqlParameter parameter3 = new SqlParameter();
               parameter3.ParameterName = "@Img3";
               parameter3.SqlDbType = SqlDbType.Image;
               parameter3.Direction = ParameterDirection.Input;
               parameter3.Value = byte3;


               SqlParameter parameter4 = new SqlParameter();
               parameter4.ParameterName = "@Img4";
               parameter4.SqlDbType = SqlDbType.Image;
               parameter4.Direction = ParameterDirection.Input;
               parameter4.Value = byte4;

               // Add the parameter to the Parameters collection. 
               command.Parameters.Add(parameter0);
               command.Parameters.Add(parameter1);
               command.Parameters.Add(parameter2);
               command.Parameters.Add(parameter3);
               command.Parameters.Add(parameter4);

               // Open the connection and execute the reader.
               connection.Open();
               SqlDataReader reader = command.ExecuteReader();


               if (reader.HasRows)
               {
                   while (reader.Read())
                   {
                       Console.WriteLine("{0}: {1:C}", reader[0], reader[1]);
                   }
               }
               else
               {
                   Console.WriteLine("No rows found.");
               }
               reader.Close();
           }

       }


    }
}

