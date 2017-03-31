<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DX_DAHERCMS.Default1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadTileList ID="RadTileList1" runat="server">
        <Groups>
            <telerik:TileGroup Name="DaherTools">
                <telerik:RadImageAndTextTile runat="server" Name="@service" NavigateUrl="https://daher.easyvista.com/" Shape="Wide"  Text="@Service : Creation et suivi de vos demande informatique.">
                </telerik:RadImageAndTextTile>
                <telerik:RadTextTile runat="server" Name="Maintenance" NavigateUrl="https://maintenance-marlog.daher.com/" Shape="Wide" Text="Maintenance : Ouverture de tickets de maintenance.">
                </telerik:RadTextTile>
                <telerik:RadTextTile runat="server" Name="Talentsoft" NavigateUrl="https://daher.talent-soft.com/" Shape="Wide" Text="TalentSoft">
                </telerik:RadTextTile>
                <telerik:RadTextTile runat="server" Name="GAP" NavigateUrl="https://marlog.daher.com/" Shape="Wide" Text="GAP : Gestion administrative du personnel">
                </telerik:RadTextTile>
                <telerik:RadTextTile runat="server" Name="Sharepoint" NavigateUrl="https://daher.sharepoint.com/gedmarlog" Shape="Wide" Text="Sharepoint DAHER">
                </telerik:RadTextTile>
                <telerik:RadTextTile runat="server" Name="Notilus" NavigateUrl="https://s42.mynotilus.com/daher" ImageUrl="~/img/Tiles/notilus.png" Shape="Wide" Text="Notilus">
                </telerik:RadTextTile>
            </telerik:TileGroup>
        </Groups>

    </telerik:RadTileList>

</asp:Content>