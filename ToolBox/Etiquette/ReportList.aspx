<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportList.aspx.cs" Inherits="DX_DAHERCMS.Default" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>Etape 2 : Selection du Rapport</div>

    <div>
        <h1>Report Catalog </h1>
        <p>Use the form below to manage reports in the catalog.</p>
    </div>
    <div>
        <asp:ListBox ID="reportsList" runat="server" Width="600px" Height="150px"></asp:ListBox>
    </div>
    <div>
        <asp:Label ID="test" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Button CssClass="catalogButton" ID="openButton" runat="server" Text="Open"
            OnClick="Open_Click" Visible="true"  />
        <asp:Button CssClass="catalogButton" ID="editButton" runat="server" Text="Edit"
            OnClick="EditButton_Click" />
        <asp:Button CssClass="catalogButton" ID="deleteButton" runat="server" Text="Delete"
            OnClick="DeleteButton_Click" />
    </div>
    <div>
        <asp:Button CssClass="catalogButton" ID="newReportButton" runat="server"
            Text="New Report" OnClick="NewReportButton_Click" />
    </div>

</asp:Content>
