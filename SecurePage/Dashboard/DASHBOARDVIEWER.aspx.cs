using DevExpress.DashboardCommon;
using DevExpress.Web;
using DevExpress.Xpo;
using DevExpress.XtraTreeList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.Dashboard
{
    public partial class DASHBOARDVIEWER : System.Web.UI.Page
    {
        const string FileImageUrl = "~/img/file.png";
        const string DirImageUrl = "~/img/directory.png";

        protected void Page_Load(object sender, EventArgs e)
        {




        }


        protected void treeView_VirtualModeCreateChildren(object sender,TreeViewVirtualModeCreateChildrenEventArgs e)
        {
            string parentNodePath = string.IsNullOrEmpty(e.NodeName) ?
                Server.MapPath("~/SecurePage/Dashboard/DashB_XML/") : e.NodeName;
            List<TreeViewVirtualNode> children = new List<TreeViewVirtualNode>();
            if (Directory.Exists(parentNodePath))
            {
                PopulateChildNodes(Directory.GetDirectories(parentNodePath), false,
                    DirImageUrl, children);
                PopulateChildNodes(Directory.GetFiles(parentNodePath), true,
                    FileImageUrl, children);
            }
            e.Children = children;
        }

        void PopulateChildNodes(string[] paths, bool isLeaf, string imageUrl,
            List<TreeViewVirtualNode> children)
        {
            foreach (string childPath in paths)
            {
                string childFileName = Path.GetFileName(childPath);
                if (IsSystemName(childFileName))
                    continue;
                TreeViewVirtualNode childNode = new TreeViewVirtualNode(childPath, childFileName);
                childNode.IsLeaf = isLeaf;
                childNode.Image.Url = imageUrl;
                children.Add(childNode);
            }
        }

        bool IsSystemName(string name)
        {
            name = name.ToLower();
            return name.StartsWith("app_") || name == "bin"
                || name.EndsWith(".aspx.cs") || name.EndsWith(".aspx.vb");
        }

        protected void ASPxTreeView1_NodeClick(object source, TreeViewNodeEventArgs e)
        {
            
            ASPxDashboardViewer1.DashboardSource = e.Node.Name;



        }


     

    }
}