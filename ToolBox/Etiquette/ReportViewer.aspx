<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportViewer.aspx.cs" Inherits="DX_DAHERCMS.ReportViewer" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <div style="margin-bottom:10px">
                                       <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String">
            </dx:ASPxComboBox>
                <asp:Button ID="Button1" runat="server" Text="Print on Server" OnClick="Button1_Click"/>
            </div>
            <div>
        <dx:ASPxWebDocumentViewer ID="Viewer" runat="server">
        </dx:ASPxWebDocumentViewer>
            </div>

            <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="170px"></dx:ASPxMemo>

    </div>

</asp:Content>
