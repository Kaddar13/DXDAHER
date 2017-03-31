<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IMPORT_ACTIVTYTYPE.aspx.cs" Inherits="DX_DAHERCMS.IMPORT_ACTIVTYTYPE" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxSplitter ID="ASPxSplitter1" runat="server">
        <Panes>
            <dx:SplitterPane>
               
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div>Import XML</div>
                         <input id="Text1" type="text" runat="server"  />
                        <dx:ASPxUploadControl ID="UP_XML" runat="server"
                            UploadMode="Auto"
                            FileUploadMode="OnPageLoad"
                            ShowProgressPanel="True"
                            ShowUploadButton="True"
                            Width="280px"
                            OnFilesUploadComplete="UPXML_FilesUploadComplete" Theme="MetropolisBlue">
                            <AdvancedModeSettings EnableFileList="True" EnableMultiSelect="True">
                            </AdvancedModeSettings>
                        </dx:ASPxUploadControl>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div>Import TXT</div>
                         <input id="Text2" type="text" runat="server"  />
                        <dx:ASPxUploadControl ID="UP_TXT" runat="server"
                            UploadMode="Auto"
                            FileUploadMode="OnPageLoad"
                            ShowProgressPanel="True"
                            ShowUploadButton="True"
                            Width="280px"
                            OnFilesUploadComplete="UPTXT_FileUploadComplete" Theme="MetropolisBlue">
                            <AdvancedModeSettings EnableFileList="True" EnableMultiSelect="True">
                            </AdvancedModeSettings>
                        </dx:ASPxUploadControl>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>


    <dx:ASPxButton runat="server" Text="Suivant" OnClick="Click_Edition" ></dx:ASPxButton>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server"></dx:ASPxGridView>










    </asp:Content>
