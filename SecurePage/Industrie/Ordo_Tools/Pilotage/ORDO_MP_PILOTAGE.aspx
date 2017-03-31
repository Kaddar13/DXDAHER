<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_MP_PILOTAGE.aspx.cs" Inherits="DX_DAHERCMS.Ordo_Tools.ORDO_MP_PILOTAGE" %>

<%@ Register Assembly="DevExpress.XtraCharts.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxDockZone runat="server" ID="ASPxDockZone1" ZoneUID="LeftZone" Width="100%" PanelSpacing="3" CssClass="leftZone">
    </dx:ASPxDockZone>
    <dx:ASPxDockZone runat="server" ID="ASPxDockZone2" ZoneUID="RightZone" Width="100%" PanelSpacing="3" CssClass="rightZone">
    </dx:ASPxDockZone>

     <dx:ASPxDockPanel Theme="Moderno" runat="server" ID="Panel_Graph" PanelUID="ASPxDockZone1"
        OwnerZoneUID="LeftZone" HeaderText="Dashboard - Market Place"
        ShowCloseButton="false"
        ShowCollapseButton="true"
        ShowMaximizeButton="True"
        ShowSizeGrip="True"
        AllowResize="True">
        <ContentCollection>
   <dx:PopupControlContentControl>
                <div>                  
                    <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" Width="100%"  runat="server" DashboardSource="~/Dashboard/DashB_XML/Ordo_DB_MarketPlace.xml"></dx:ASPxDashboardViewer>
                </div>                
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxDockPanel>

    <dx:ASPxDockPanel Theme="Moderno" runat="server" ID="ASPxDockPanel1" PanelUID="ASPxDockZone2"
        OwnerZoneUID="LeftZone" HeaderText="Dashboard - Market Place Appareil / Poste"
        ShowCloseButton="false"
        ShowCollapseButton="true"
        ShowMaximizeButton="True"
        ShowSizeGrip="True"
        AllowResize="True">
        <ContentCollection>
   <dx:PopupControlContentControl>
                <div>                  
                    <dx:ASPxDashboardViewer ID="ASPxDashboardViewer2" Width="100%"  runat="server" DashboardSource="~/Dashboard/DashB_XML/Ordo_DB_MarketPlace_AppPoste.xml"></dx:ASPxDashboardViewer>
                </div>                
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxDockPanel>






</asp:Content>
