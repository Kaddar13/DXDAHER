using DevExpress.Export;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion
{
    public partial class ORDO_GESTION_MP_CONFNONPOINTE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(GetDXCurrentLanguageValue()))
                LanguageComboBox.SelectedItem = LanguageComboBox.Items.FindByValue(GetDXCurrentLanguageValue());
            else
                LanguageComboBox.SelectedIndex = 0;
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse(new XlsExportOptionsEx() { ExportType = ExportType.WYSIWYG });
        }

        protected string GetDXCurrentLanguageValue()
        {
            return Request.Cookies["DXCurrentLanguage"] == null ? "" : Request.Cookies["DXCurrentLanguage"].Value;
        }

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
    }
}