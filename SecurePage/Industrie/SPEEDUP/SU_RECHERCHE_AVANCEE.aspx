<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SU_RECHERCHE_AVANCEE.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.SPEEDUP.SU_RECHERCHE_AVANCEE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <dx:ASPxFilterControl ID="ASPxFilterControl1" runat="server">
         <ClientSideEvents Applied="function(s, e) { grid.ApplyFilter(e.filterExpression);}" />
    </dx:ASPxFilterControl>


    <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" runat="server" DataSourceID="SqlDataSource1"></dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT * FROM [T_SPEEDUP]"></asp:SqlDataSource>
    
</asp:Content>
