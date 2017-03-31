﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.SecurePage.Admin.Membership
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Is this Tito visiting the page?
                string userName = User.Identity.Name;
                if (string.Compare(userName, "Tito", true) == 0)
                    // This is Tito, SHOW the Delete column
                    FilesGrid.Columns[1].Visible = true;
                else
                    // This is NOT Tito, HIDE the Delete column
                    FilesGrid.Columns[1].Visible = false;

                string appPath = Request.PhysicalApplicationPath;
                DirectoryInfo dirInfo = new DirectoryInfo(appPath);

                FileInfo[] files = dirInfo.GetFiles();

                FilesGrid.DataSource = files;
                FilesGrid.DataBind();
            }
        }

        [PrincipalPermission(SecurityAction.Demand, Authenticated = true)]
        protected void FilesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Open the file and display it
            string fullFileName = FilesGrid.SelectedValue.ToString();
            string contents = File.ReadAllText(fullFileName);

            TextBox FileContentsTextBox = LoginViewForFileContentsTextBox.FindControl("FileContents") as TextBox;
            FileContentsTextBox.Text = contents;
        }

        [PrincipalPermission(SecurityAction.Demand, Name = "Tito")]
        protected void FilesGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string fullFileName = FilesGrid.DataKeys[e.RowIndex].Value.ToString();

            TextBox FileContentsTextBox = LoginViewForFileContentsTextBox.FindControl("FileContents") as TextBox;
            FileContentsTextBox.Text = string.Format("You have opted to delete {0}.", fullFileName);

            // To actually delete the file, uncomment the following line
            // File.Delete(fullFileName);
        }
    }
}