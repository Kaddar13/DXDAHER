<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_Import.aspx.cs" Inherits="DX_DAHERCMS.Ordo_Tools.ORDO_Import" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <dx:ASPxSplitter ID="ASPxSplitter1" runat="server">
        <Panes>
            <dx:SplitterPane>
               
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div>Import SAP</div>
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
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                      
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>
    <dx:ASPxButton runat="server" Text="Importer" OnClick="Import_Click" ></dx:ASPxButton>
    <input id="Param_RetourProc" type="hidden"  runat="server" />
 <telerik:RadNotification ID="RadNotification1" runat="server" Position="Center" LoadContentOn="EveryShow" VisibleOnPageLoad="false" 
                             Width="330" Height="160" Animation="Fade" EnableRoundedCorners="true" EnableShadow="true" />




       </asp:Content>

