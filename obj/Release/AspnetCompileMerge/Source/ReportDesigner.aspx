<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportDesigner.aspx.cs" Inherits="DX_DAHERCMS.LABEL_EDITING" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
         // The CustomizeMenuActions event handler.
         function CustomizeMenuActions(s, e) {
             var actions = e.Actions;
             // Register the custom Close menu command.
             actions.push({
                 text: "Close",
                 imageClassName: "customButton",
                 disabled: ko.observable(false),
                 visible: true,
                 // The clickAction function recieves the client-side report model
                 // allowing you interact with the currently opened report.
                 clickAction: function (report) {
                     window.location = "Default.aspx";
                 },
                 container: "menu"
             });
         }
    </script>
  
    <div>
        <dx:ASPxReportDesigner ID="ASPxReportDesigner1" runat="server" ClientSideEvents-CustomizeMenuActions="CustomizeMenuActions"/>
    </div>
</asp:Content>
