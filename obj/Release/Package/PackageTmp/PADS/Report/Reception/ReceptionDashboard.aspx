<%@ Page Title="" Language="C#" MasterPageFile="~/PADS/PADS.Master" AutoEventWireup="true" CodeBehind="ReceptionDashboard.aspx.cs" Inherits="DX_DAHERCMS.PADS.Image.Reception.ReceptionDashboard" %>

<%@ Register Assembly="DevExpress.Dashboard.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server"  DashboardSource="~\\PADS\Report\Reception\Mar_FlowBooster_REC.xml"  Width="100%"></dx:ASPxDashboardViewer>
</asp:Content>
