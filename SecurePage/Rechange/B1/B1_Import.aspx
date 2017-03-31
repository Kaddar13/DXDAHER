<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="B1_Import.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.B1.B1_Impor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>Import XLS</div>
                         <input id="Text1" type="text" runat="server"  />
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
</asp:Content>
