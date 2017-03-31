<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ordo_MP_Dashboard.aspx.cs" Inherits="DX_DAHERCMS.PADS.Report.Ordo.Ordo_MP_Dashboard" %>
<%@ Register Assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="6000" >
        <ClientSideEvents Tick="function(s, e) {
	ASPxDashboardViewer1.ReloadData();
}" />
        </dx:ASPxTimer>
    <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server" ClientInstanceName="ASPxDashboardViewer1"  DashboardSource="~\\PADS\Report\Ordo\Pilotage Charge MP Jour.xml"  Width="100%" ExportOptions-PaperKind="A4"></dx:ASPxDashboardViewer>
</asp:Content>


