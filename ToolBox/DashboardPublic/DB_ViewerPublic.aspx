<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DB_ViewerPublic.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.DashboardPublic.WebForm1" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Width="100%" Height="600px" Theme="Moderno">
        <Panes>
            <dx:SplitterPane ShowCollapseBackwardButton="True" Name="ListXML" AutoWidth="true" >
                <ContentCollection>
                    <dx:SplitterContentControl>
                            <dx:ASPxTreeView ID="ASPxTreeView1" runat="server"  OnVirtualModeCreateChildren="treeView_VirtualModeCreateChildren" OnNodeClick="ASPxTreeView1_NodeClick" Theme="Moderno" /> 
                    </dx:SplitterContentControl>                        
                </ContentCollection>
                      
            </dx:SplitterPane>

            <dx:SplitterPane>
                          <ContentCollection>
                    <dx:SplitterContentControl>
                           <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server"  Width="100%" AllowExportDashboardItems="True"  Height="600px" ></dx:ASPxDashboardViewer>
                    </dx:SplitterContentControl>                        
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>
</asp:Content>
