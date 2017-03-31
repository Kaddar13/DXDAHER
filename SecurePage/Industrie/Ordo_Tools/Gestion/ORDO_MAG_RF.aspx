<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_MAG_RF.aspx.cs" Inherits="DX_DAHERCMS.ORDO_MAG_RF" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div>Magasin RF</div>
    
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server">
        <Panes>
            <dx:SplitterPane AllowResize="True" AutoHeight="True" AutoWidth="True">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div>
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Theme="MetropolisBlue" KeyFieldName="Groupe" >
                                <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                                <SettingsSearchPanel Visible="True" />
                                <Columns>
                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Numéro de l'ordre de transfert" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Poste de l'ordre de transfert" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Groupe" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="Start" VisibleIndex="4">
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
                                    <dx:GridViewDataTextColumn FieldName="Type magasin cédant" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <TotalSummary>
                                    <dx:ASPxSummaryItem FieldName="Numéro de l'ordre de transfert" ShowInColumn="Numéro de l'ordre de transfert" SummaryType="Count" />
                                </TotalSummary>
                                <Styles AdaptiveDetailButtonWidth="22"></Styles>
                            </dx:ASPxGridView>

                        </div>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane AllowResize="True" AutoHeight="True" AutoWidth="True">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                        <div>
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Generer les OT" OnClick="ASPxButton1_Click"></dx:ASPxButton>
                            <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="182px" Width="471px"></dx:ASPxMemo>
                        </div>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT T_Ordo.[Numéro de l'ordre de transfert], T_Ordo.[Poste de l'ordre de transfert], T_Ordo.[Type magasin cédant], T_Ordo.Groupe, T_Ordo_Appointments_DragAndDrop.Start, T_Ordo.Statut FROM T_Ordo INNER JOIN T_Ordo_Appointments_DragAndDrop ON T_Ordo.AppointmentID = T_Ordo_Appointments_DragAndDrop.AppointmentID WHERE (T_Ordo.Statut = 2) AND (NOT (T_Ordo.[Type magasin cédant] LIKE N'5AU')) AND (T_Ordo_Appointments_DragAndDrop.Start = GETDATE())"></asp:SqlDataSource>
</asp:Content>
