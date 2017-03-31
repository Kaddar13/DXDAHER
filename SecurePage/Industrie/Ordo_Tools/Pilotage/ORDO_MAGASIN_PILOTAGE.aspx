<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_MAGASIN_PILOTAGE.aspx.cs" Inherits="DX_DAHERCMS.Ordo_Tools.ORDO_MAGASIN_PILOTAGE" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server" DashboardSource="~/Dashboard/DashB_XML/Ordo_DB_Magasin.xml"  Width="100%" AllowExportDashboardItems="True" Height="600px" ></dx:ASPxDashboardViewer>
</asp:Content>
