<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RDLC.aspx.cs" Inherits="DX_DAHERCMS.RDLC" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <dx:ASPxUploadControl ID="UP" runat="server"
            UploadMode="Auto"
            FileUploadMode="OnPageLoad"
            ShowProgressPanel="true"
            ShowUploadButton="true"
            Width="280px"
            OnFilesUploadComplete="UploadControl_FileUploadComplete">
        </dx:ASPxUploadControl>
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Load Report" OnClick="ASPxButton1_Click" ></dx:ASPxButton>
        <dx:ASPxLabel ID="SRC" runat="server" Text="Allo"  ></dx:ASPxLabel>
    </div>
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="RDL\ORDO.rdlc">
            </LocalReport>
            
        </rsweb:ReportViewer>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
