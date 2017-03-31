<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DX_DAHERCMS.Ordo_Tools.WebForm2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadTileList ID="RadTileList1" RenderMode="Lightweight" runat="server">
        <Groups>
            <telerik:TileGroup Name="Plannification" >
                <telerik:RadTextTile runat="server" Name="PlannifMP" Text="Planif : MP">
                </telerik:RadTextTile>
            </telerik:TileGroup>
            <telerik:TileGroup Name="Gestion">
            </telerik:TileGroup>
            <telerik:TileGroup Name="Pilotage">
            </telerik:TileGroup>
        </Groups>
    </telerik:RadTileList>
    
   </asp:Content>

