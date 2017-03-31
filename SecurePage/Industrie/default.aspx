<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <dx:ASPxSiteMapDataSource ID="ASPxSiteMapDataSource1" runat="server" SiteMapFileName="~/SecurePage/Industrie/Industrie.sitemap" EnableRoles="True" />
    <dx:ASPxSiteMapControl ID="ASPxSiteMapControl1" runat="server" Categorized="True" DataSourceID="ASPxSiteMapDataSource1" EnableTheming="True" RepeatDirection="Horizontal" Theme="MetropolisBlue">
        <DefaultLevelProperties BulletStyle="Disc">
        </DefaultLevelProperties>
    </dx:ASPxSiteMapControl>
</asp:Content>
