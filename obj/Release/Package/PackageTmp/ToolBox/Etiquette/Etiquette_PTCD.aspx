<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Etiquette_PTCD.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.Etiquette.Etiquette_PTCD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <telerik:RadIconTile ID="RadTextTile1" 
             runat="server" Skin="Metro" NavigateUrl="\ToolBox\Etiquette\Etiquette_PTCD\pneu.pdf" style="top: 0px; left: 0px">
            <Title Text="Etiquette Pneu"/>
        </telerik:RadIconTile>

        <telerik:RadIconTile Skin="Metro" ID="RadTextTile2" NavigateUrl="\ToolBox\Etiquette\Etiquette_PTCD\acetone.pdf"  runat="server">
            <Title Text="Etiquette Acetone"/>
        </telerik:RadIconTile>

    <telerik:RadIconTile  Skin="Metro" ID="RadTextTile3" NavigateUrl="\ToolBox\Etiquette\Etiquette_PTCD\bouchon.pdf" runat="server">
        <Title Text="Etiquette Bouchon Obturant"/>
    </telerik:RadIconTile>

    <telerik:RadIconTile Skin="Metro" ID="RadTextTile4" NavigateUrl="\ToolBox\Etiquette\Etiquette_PTCD\date.pdf" runat="server">
        <Title Text="Etiquette Date Validation"/>
    </telerik:RadIconTile>

</asp:Content>
