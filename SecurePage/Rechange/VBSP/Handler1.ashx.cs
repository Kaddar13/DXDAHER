using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace DX_DAHERCMS.SecurePage.Rechange.VBSP
{
    /// <summary>
    /// Description résumée de Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.ContentType = "text/html";

            Image readedImage = null;
            Image finalImage = null;

            if (context.Request.QueryString["imgPath"] != null)
            {
                string imgPath = context.Request.QueryString["imgPath"].ToString();
                //imgPath = @"\\DESKTOP-N1I9K33\Img_VBSP\2.JPG";

                if (File.Exists(imgPath) == true)
                {
                    readedImage = Image.FromFile(imgPath);

                    byte[] bt = null;
                    using (MemoryStream ms = new MemoryStream())
                    {
                        readedImage.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                        bt = ms.ToArray();
                        finalImage = System.Drawing.Image.FromStream(ms);

                        // Save the image to the OutputStream                  
                        finalImage.Save(context.Response.OutputStream, ImageFormat.Jpeg);
                        ms.Flush();
                        ms.Close();
                        ms.Dispose();
                    }
                }
            }

            if (readedImage != null)
            {
                readedImage.Dispose();
                readedImage = null;
            }

            if (finalImage != null)
            {
                finalImage.Dispose();
                finalImage = null;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
            ~Handler1()  { Dispose(); }
    public void Dispose() { GC.SuppressFinalize(this); }
}

    }
