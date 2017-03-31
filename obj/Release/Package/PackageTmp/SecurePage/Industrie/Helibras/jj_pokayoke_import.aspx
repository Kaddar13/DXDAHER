<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="jj_pokayoke_import.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Helibras.jj_pokayoke_import" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:FileUpload ID="FileUpload1" runat="server" />       
        <asp:Button ID="Button1" runat="server" Text="Export" OnClick="btnUpload_Click" />

        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


</asp:Content>
