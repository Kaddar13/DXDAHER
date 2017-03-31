<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Import_CSV.aspx.cs" Inherits="DX_DAHERCMS.WebForm3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>Etape 1 : Import des données</div>
     <div>
   
        <dx:ASPxUploadControl ID="UP" runat="server"
            UploadMode="Auto"
            FileUploadMode="OnPageLoad"
            ShowProgressPanel="True"
            ShowUploadButton="True"
            Width="280px"
            OnFilesUploadComplete="UploadControl_FileUploadComplete" Theme="MetropolisBlue">
            <AdvancedModeSettings EnableFileList="True" EnableMultiSelect="True">
            </AdvancedModeSettings>
        </dx:ASPxUploadControl>

       <dx:ASPxButton runat="server" OnClick="Unnamed_Click"  Text="Suivant" ></dx:ASPxButton>

    </div>
</asp:Content>
