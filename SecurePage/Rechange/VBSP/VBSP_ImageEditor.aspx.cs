using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Rechange.VBSP
{
    public partial class VBSP_ImageEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void RadImageEditor1_ImageSaving(object sender, Telerik.Web.UI.ImageEditorSavingEventArgs e)
        {
            //Save the image to a custom location
            string fullPath = Server.MapPath("../../images/testImages");
            string fileName = string.Format("relax-{0}.jpg", DateTime.Now.ToString("yyyyMMdd-hhmmss"));
            fullPath = Path.Combine(fullPath, fileName);

            Telerik.Web.UI.ImageEditor.EditableImage img = e.Image;
            img.Image.Save(fullPath);
            //lblError.Text = "File Saved";
            e.Argument = String.Format("The image is saved under the name: <strong>{0}</strong>.", fileName);

            e.Cancel = true;
        }
      
    }
}