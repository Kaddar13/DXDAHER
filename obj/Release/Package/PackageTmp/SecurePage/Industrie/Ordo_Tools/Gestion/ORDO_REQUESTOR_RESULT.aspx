<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_REQUESTOR_RESULT.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion.ORDO_REQUESTOR_RESULT" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Result"></asp:Label>
        </div>
        <div style="margin-bottom:30px">
             <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Export" OnClick="ASPxButton1_Click"></dx:ASPxButton>

        </div>
        <div style="margin-left:30px">
             <dx:ASPxGridView ID="ASPxGridView1" runat="server" OnDataBinding="ASPxGridView1_DataBinding">
                 <Settings ShowFilterRow="True" ShowGroupPanel="True" />
<Styles AdaptiveDetailButtonWidth="22"></Styles>
             </dx:ASPxGridView>
        </div>
    </div>  
   
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" ExportEmptyDetailGrid="True" FileName="Export" GridViewID="ASPxGridView1"></dx:ASPxGridViewExporter>
    
</asp:Content>
