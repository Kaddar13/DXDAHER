<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SU_IMPORT.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.SPEEDUP.SU_IMPORT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        Etape 1 : Import OD2 Données Specifiques : FL3
                         <input id="Text1" type="text" runat="server" visible="false" />
        <dx:ASPxUploadControl ID="UP_XML" runat="server"
            UploadMode="Auto"
            FileUploadMode="OnPageLoad"
            ShowProgressPanel="True"
            ShowUploadButton="True"
            Width="280px"
            OnFilesUploadComplete="UPSAP_FilesUploadComplete" Theme="MetropolisBlue">
            <AdvancedModeSettings EnableFileList="True" EnableMultiSelect="True">
            </AdvancedModeSettings>
        </dx:ASPxUploadControl>
    </div>
    <div>
        Etape 2 : Import OD2 Données Specificques : BON102        
                            <dx:ASPxUploadControl ID="UP_BON102" runat="server"
                                UploadMode="Auto"
                                FileUploadMode="OnPageLoad"
                                ShowProgressPanel="True"
                                ShowUploadButton="True"
                                Width="280px"
                                OnFilesUploadComplete="UP_BON102_FilesUploadComplete" Theme="MetropolisBlue">
                                <AdvancedModeSettings EnableFileList="True" EnableMultiSelect="True">
                                </AdvancedModeSettings>
                            </dx:ASPxUploadControl>
    </div>

   


</asp:Content>
