using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DX_DAHERCMS.ToolBox.SPEEDUP
{
    public partial class SU_CONSULTATION : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ASPxTreeList1_VirtualModeNodeCreated(object sender, DevExpress.Web.ASPxTreeList.TreeListVirtualNodeEventArgs e)
        {
        }

        protected void ASPxTreeList1_VirtualModeNodeCreating(object sender, DevExpress.Web.ASPxTreeList.TreeListVirtualModeNodeCreatingEventArgs e)
        {
            DataRowView rowView = e.NodeObject as DataRowView;
            if (rowView == null) return;
            e.NodeKeyValue = rowView["IDSPEEDUP"];

            e.SetNodeValue("IDSPEEDUP", rowView["IDSPEEDUP"]);
            e.SetNodeValue("SU_Localisation", rowView["SU_Localisation"]);

        }

        protected void ASPxTreeList1_VirtualModeCreateChildren(object sender, DevExpress.Web.ASPxTreeList.TreeListVirtualModeCreateChildrenEventArgs e)
        {
            DataView children = null;
            DataRowView parent = e.NodeObject as DataRowView;
            if (parent == null)
            {
                children = (DataView)DS_SPEEDUP.Select(DataSourceSelectArguments.Empty);
            }
            else
            {
                DS_Mouvement.SelectParameters["IDSPEEDUP"].DefaultValue = parent["IDSPEEDUP"].ToString();
                children = (DataView)DS_Mouvement.Select(DataSourceSelectArguments.Empty);
            }
            e.Children = children;
        }
    }
}