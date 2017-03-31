<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_REQUESTOR.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion.ORDO_REQUESTOR" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <dx:ASPxQueryBuilder 
        ID="ASPxQueryBuilder1" 
        runat="server" 
        OnSaveQuery="ASPxQueryBuilder1_SaveQuery" 
        ValidateQueryByExecution="True">

    </dx:ASPxQueryBuilder>
</asp:Content>
