<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ORDO_REQUESTOR_LIST.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion.ORDO_REQUESTOR_LIST" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Listes des Requetes"></asp:Label>
        </div>
        <div>
            <asp:ListBox ID="ListBox1" runat="server"  Width="515px"></asp:ListBox>
        </div>

        <div>
                <asp:Button ID="Button1" runat="server" Text="Open Query" OnClick="OpenButton_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Edit Query" OnClick="Button2_Click"/>
        </div>

    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT * FROM [REQUESTOR_QUERY]"></asp:SqlDataSource>
</asp:Content>
