<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_Import.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.VBSP.VBSP_Import" %>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <dx:ASPxSplitter ID="ASPxSplitter1" runat="server">
        <Panes>
            <dx:SplitterPane>
               
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div>Import SAP</div>
                         <input id="Text1" type="text" runat="server"  />
                        &nbsp;&nbsp;&nbsp;<dx:ASPxUploadControl ID="UP_XML" runat="server"
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
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="PN">
                            <Settings ShowGroupPanel="True" />
                            <SettingsBehavior AutoExpandAllGroups="True" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="PN" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EMPL" ShowInCustomizationForm="True" VisibleIndex="1" GroupIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="LOADPLAN" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="STATUS" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="COMMENT" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="PRIORITE" ShowInCustomizationForm="True" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="DateData" ShowInCustomizationForm="True" VisibleIndex="6">
                                    <PropertiesDateEdit>
                                        <TimeSectionProperties>
                                            <TimeEditProperties>
                                                <ClearButton Visibility="Auto">
                                                </ClearButton>
                                            </TimeEditProperties>
                                        </TimeSectionProperties>
                                        <ClearButton Visibility="Auto">
                                        </ClearButton>
                                    </PropertiesDateEdit>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataDateColumn FieldName="DatePicture" ShowInCustomizationForm="True" VisibleIndex="7">
                                    <PropertiesDateEdit>
                                        <TimeSectionProperties>
                                            <TimeEditProperties>
                                                <ClearButton Visibility="Auto">
                                                </ClearButton>
                                            </TimeEditProperties>
                                        </TimeSectionProperties>
                                        <ClearButton Visibility="Auto">
                                        </ClearButton>
                                    </PropertiesDateEdit>
                                </dx:GridViewDataDateColumn>
                            </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT [PN]
      ,[EMPL]
      ,[LOADPLAN]
      ,[STATUS]
      ,[COMMENT]
      ,[PRIORITE]
      ,Dashboard.dbo.VBSP_TB_Article.DateData
      ,Dashboard.dbo.VBSP_TB_Article.DatePicture
  FROM [Dashboard].[dbo].[VBSP_Import]
  INNER JOIN Dashboard.dbo.VBSP_TB_Article ON LTRIM(RTRIM([Dashboard].[dbo].[VBSP_Import].PN)) = LTRIM(RTRIM(Dashboard.dbo.VBSP_TB_Article.PartNumber))"></asp:SqlDataSource>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>
    <%--<dx:ASPxButton runat="server" Text="Importer" OnClick="Import_Click" ></dx:ASPxButton>--%>
    <input id="Param_RetourProc" type="hidden"  runat="server" />
 <telerik:RadNotification ID="RadNotification1" runat="server" Position="Center" LoadContentOn="EveryShow" VisibleOnPageLoad="false" 
                             Width="330" Height="160" Animation="Fade" EnableRoundedCorners="true" EnableShadow="true" />
</asp:Content>
