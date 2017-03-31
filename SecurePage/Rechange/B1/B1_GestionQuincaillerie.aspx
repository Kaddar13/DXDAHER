<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="B1_GestionQuincaillerie.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.B1.B1_GestionQuincaillerie" %>

<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:TextBox ID="txt_casier" runat="server" Text="47" Visible="false"></asp:TextBox>
    <asp:TextBox ID="txt_casierPetit" runat="server" Text="46" Visible="false"></asp:TextBox>


    <asp:TextBox ID="txt_plaquette" runat="server" Text="48" Visible="false"></asp:TextBox>

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        KeyFieldName="ID" Theme="MetropolisBlue" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect">
        <SettingsPager AlwaysShowPager="True">
        </SettingsPager>
        <SettingsEditing Mode="EditForm">
        </SettingsEditing>
        <SettingsDetail ShowDetailRow="true" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Default">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn VisibleIndex="8" Caption="Commande">
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" ID="btn_commande" OnClick="btn_commande_Click" Text="" Image-IconID="businessobjects_boorder_16x16" Height="16" Width="16" Theme="MetropolisBlue"></dx:ASPxButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="UAP" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FAMEPLA" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SAP" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DESIGNATION" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="REFERENCE" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MPN" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CASIER" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="QteCommandee" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StockReserve" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MAGASIN" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="16">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="2" Caption="Etiquette Casier">
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" ID="btn_printCasier" OnClick="btn_print_Click" Text="" Image-IconID="print_print_16x16" Height="16" Width="16" Theme="MetropolisBlue" VisibleIndex="13"></dx:ASPxButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="3" Caption="Etiquette Plaquette">
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" ID="btn_printPlaquette" OnClick="btn_printPlaquette_Click" Text="" Image-IconID="print_print_16x16" Height="16" Width="16" Theme="MetropolisBlue" VisibleIndex="14"></dx:ASPxButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Identifiant" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EQUIVAL" VisibleIndex="5">
            </dx:GridViewDataTextColumn>

        </Columns>
         <SettingsPager Position="Bottom">
             <PageSizeItemSettings Visible="true" />
                    <PageSizeItemSettings Items="10, 20, 50" />
        </SettingsPager>
        <Styles AdaptiveDetailButtonWidth="22"></Styles>


        <Templates>
            <DetailRow>
                <dx:ASPxGridView runat="server" ID="grid_detail" DataSourceID="SqlDataSource2" Theme="MetropolisBlue" OnBeforePerformDataSelect="grid_detail_BeforePerformDataSelect" AutoGenerateColumns="False" KeyFieldName="ID">
                    <SettingsEditing Mode="EditForm">
                    </SettingsEditing>
                    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                    <EditFormLayoutProperties ColCount="2">
                        <Items>
                            <dx:GridViewColumnLayoutItem ColumnName="Date_reception">
                            </dx:GridViewColumnLayoutItem>
                            <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                            </dx:EditModeCommandLayoutItem>
                        </Items>
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonType="Default" ShowInCustomizationForm="True">
                        </dx:GridViewCommandColumn>

                        <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="1">
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
                        <dx:GridViewDataTextColumn FieldName="Num_Commande" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Date_reception" VisibleIndex="3">
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

            </DetailRow>
        </Templates>
       
    </dx:ASPxGridView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * ,SAP + '-'+Casier as Identifiant FROM [T_B1_Quincaillerie]"
        ConflictDetection="CompareAllValues"
        DeleteCommand="DELETE FROM [T_B1_Quincaillerie] WHERE [ID] = @original_ID AND (([UAP] = @original_UAP) OR ([UAP] IS NULL AND @original_UAP IS NULL)) AND (([FAMEPLA] = @original_FAMEPLA) OR ([FAMEPLA] IS NULL AND @original_FAMEPLA IS NULL)) AND (([SAP] = @original_SAP) OR ([SAP] IS NULL AND @original_SAP IS NULL)) AND (([DESIGNATION] = @original_DESIGNATION) OR ([DESIGNATION] IS NULL AND @original_DESIGNATION IS NULL)) AND (([REFERENCE] = @original_REFERENCE) OR ([REFERENCE] IS NULL AND @original_REFERENCE IS NULL)) AND (([MPN] = @original_MPN) OR ([MPN] IS NULL AND @original_MPN IS NULL)) AND (([CASIER] = @original_CASIER) OR ([CASIER] IS NULL AND @original_CASIER IS NULL)) AND (([QteCommandee] = @original_QteCommandee) OR ([QteCommandee] IS NULL AND @original_QteCommandee IS NULL)) AND (([StockReserve] = @original_StockReserve) OR ([StockReserve] IS NULL AND @original_StockReserve IS NULL)) AND (([MAGASIN] = @original_MAGASIN) OR ([MAGASIN] IS NULL AND @original_MAGASIN IS NULL)) AND (([EQUIVAL] = @original_EQUIVAL) OR ([EQUIVAL] IS NULL AND @original_EQUIVAL IS NULL))"
        InsertCommand="INSERT INTO [T_B1_Quincaillerie] ([UAP], [FAMEPLA], [SAP], [DESIGNATION], [REFERENCE], [MPN], [CASIER], [QteCommandee], [StockReserve], [MAGASIN], [EQUIVAL]) VALUES (@UAP, @FAMEPLA, @SAP, @DESIGNATION, @REFERENCE, @MPN, @CASIER, @QteCommandee, @StockReserve, @MAGASIN, @EQUIVAL)"
        UpdateCommand="UPDATE [T_B1_Quincaillerie] SET [UAP] = @UAP, [FAMEPLA] = @FAMEPLA, [SAP] = @SAP, [DESIGNATION] = @DESIGNATION, [REFERENCE] = @REFERENCE, [MPN] = @MPN, [CASIER] = @CASIER, [QteCommandee] = @QteCommandee, [StockReserve] = @StockReserve, [MAGASIN] = @MAGASIN, [EQUIVAL] = @EQUIVAL WHERE [ID] = @original_ID AND (([UAP] = @original_UAP) OR ([UAP] IS NULL AND @original_UAP IS NULL)) AND (([FAMEPLA] = @original_FAMEPLA) OR ([FAMEPLA] IS NULL AND @original_FAMEPLA IS NULL)) AND (([SAP] = @original_SAP) OR ([SAP] IS NULL AND @original_SAP IS NULL)) AND (([DESIGNATION] = @original_DESIGNATION) OR ([DESIGNATION] IS NULL AND @original_DESIGNATION IS NULL)) AND (([REFERENCE] = @original_REFERENCE) OR ([REFERENCE] IS NULL AND @original_REFERENCE IS NULL)) AND (([MPN] = @original_MPN) OR ([MPN] IS NULL AND @original_MPN IS NULL)) AND (([CASIER] = @original_CASIER) OR ([CASIER] IS NULL AND @original_CASIER IS NULL)) AND (([QteCommandee] = @original_QteCommandee) OR ([QteCommandee] IS NULL AND @original_QteCommandee IS NULL)) AND (([StockReserve] = @original_StockReserve) OR ([StockReserve] IS NULL AND @original_StockReserve IS NULL)) AND (([MAGASIN] = @original_MAGASIN) OR ([MAGASIN] IS NULL AND @original_MAGASIN IS NULL)) AND (([EQUIVAL] = @original_EQUIVAL) OR ([EQUIVAL] IS NULL AND @original_EQUIVAL IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_UAP" Type="String" />
            <asp:Parameter Name="original_FAMEPLA" Type="String" />
            <asp:Parameter Name="original_SAP" Type="String" />
            <asp:Parameter Name="original_DESIGNATION" Type="String" />
            <asp:Parameter Name="original_REFERENCE" Type="String" />
            <asp:Parameter Name="original_MPN" Type="String" />
            <asp:Parameter Name="original_CASIER" Type="String" />
            <asp:Parameter Name="original_QteCommandee" Type="String" />
            <asp:Parameter Name="original_StockReserve" Type="String" />
            <asp:Parameter Name="original_MAGASIN" Type="String" />
            <asp:Parameter Name="original_EQUIVAL" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UAP" Type="String" />
            <asp:Parameter Name="FAMEPLA" Type="String" />
            <asp:Parameter Name="SAP" Type="String" />
            <asp:Parameter Name="DESIGNATION" Type="String" />
            <asp:Parameter Name="REFERENCE" Type="String" />
            <asp:Parameter Name="MPN" Type="String" />
            <asp:Parameter Name="CASIER" Type="String" />
            <asp:Parameter Name="QteCommandee" Type="String" />
            <asp:Parameter Name="StockReserve" Type="String" />
            <asp:Parameter Name="MAGASIN" Type="String" />
            <asp:Parameter Name="EQUIVAL" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UAP" Type="String" />
            <asp:Parameter Name="FAMEPLA" Type="String" />
            <asp:Parameter Name="SAP" Type="String" />
            <asp:Parameter Name="DESIGNATION" Type="String" />
            <asp:Parameter Name="REFERENCE" Type="String" />
            <asp:Parameter Name="MPN" Type="String" />
            <asp:Parameter Name="CASIER" Type="String" />
            <asp:Parameter Name="QteCommandee" Type="String" />
            <asp:Parameter Name="StockReserve" Type="String" />
            <asp:Parameter Name="MAGASIN" Type="String" />
            <asp:Parameter Name="EQUIVAL" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_UAP" Type="String" />
            <asp:Parameter Name="original_FAMEPLA" Type="String" />
            <asp:Parameter Name="original_SAP" Type="String" />
            <asp:Parameter Name="original_DESIGNATION" Type="String" />
            <asp:Parameter Name="original_REFERENCE" Type="String" />
            <asp:Parameter Name="original_MPN" Type="String" />
            <asp:Parameter Name="original_CASIER" Type="String" />
            <asp:Parameter Name="original_QteCommandee" Type="String" />
            <asp:Parameter Name="original_StockReserve" Type="String" />
            <asp:Parameter Name="original_MAGASIN" Type="String" />
            <asp:Parameter Name="original_EQUIVAL" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel">
    </dx:ASPxLabel>








    <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" Theme="MetropolisBlue"
        PopupElementID="popupArea" CloseAction="CloseButton"
        AllowDragging="true" CloseOnEscape="True" Modal="True" ShowCollapseButton="True" ShowMaximizeButton="True">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div>
                    <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" ColorScheme="dark">
                    </dx:ASPxWebDocumentViewer>
                </div>

            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <%--Formulaire Commande--%>
    <dx:ASPxPopupControl ID="Pop_Commande" runat="server" Theme="MetropolisBlue" ShowSizeGrip="True"
        PopupElementID="popupArea" CloseAction="CloseButton"
        AllowDragging="true" CloseOnEscape="True" Modal="True" ShowCollapseButton="True" ShowMaximizeButton="True" Caption="Gestion des commandes" HeaderText="Gestion des Commandes" Text="Gestion des comandes">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div>

                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" DataSourceID="SqlDataSource2">
                        <Items>
                            <dx:LayoutItem Caption="Num Commande">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="num_commande" runat="server">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Date Commande">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="date_commande" runat="server">
                                            <TimeSectionProperties>
                                                <TimeEditProperties>
                                                    <ClearButton Visibility="Auto">
                                                    </ClearButton>
                                                </TimeEditProperties>
                                            </TimeSectionProperties>
                                            <ClearButton Visibility="Auto">
                                            </ClearButton>
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Date Reception" Visible="false">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxDateEdit ID="date_reception" runat="server">
                                            <TimeSectionProperties>
                                                <TimeEditProperties>
                                                    <ClearButton Visibility="Auto">
                                                    </ClearButton>
                                                </TimeEditProperties>
                                            </TimeSectionProperties>
                                            <ClearButton Visibility="Auto">
                                            </ClearButton>
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxButton ID="updateButton" runat="server" OnClick="updateButton_Click" Text="Creation Commande" Width="150px">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:ASPxFormLayout>



                </div>
                <dx:ASPxLabel runat="server" ID="errorMessageLabel" ForeColor="Red" EnableViewState="False" EncodeHtml="False" meta:resourcekey="errorMessageLabelResource1" />
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        DeleteCommand="DELETE FROM [T_B1_Commande] WHERE [ID] = @original_ID AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([FK_ID] = @original_FK_ID) OR ([FK_ID] IS NULL AND @original_FK_ID IS NULL)) AND (([Num_Commande] = @original_Num_Commande) OR ([Num_Commande] IS NULL AND @original_Num_Commande IS NULL)) AND (([Date_reception] = @original_Date_reception) OR ([Date_reception] IS NULL AND @original_Date_reception IS NULL))"
        InsertCommand="INSERT INTO [T_B1_Commande] 
                        ([Date], 
                        [FK_ID], 
                        [Num_Commande],
                        [Date_reception]) 
                        VALUES (@Date, @FK_ID, @Num_Commande, @Date_reception)"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [T_B1_Commande] WHERE FK_ID = @FK_ID"
        UpdateCommand="UPDATE [T_B1_Commande] SET [Date] = @Date, [FK_ID] = @FK_ID, [Num_Commande] = @Num_Commande, [Date_reception] = @Date_reception WHERE [ID] = @original_ID AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([FK_ID] = @original_FK_ID) OR ([FK_ID] IS NULL AND @original_FK_ID IS NULL)) AND (([Num_Commande] = @original_Num_Commande) OR ([Num_Commande] IS NULL AND @original_Num_Commande IS NULL)) AND (([Date_reception] = @original_Date_reception) OR ([Date_reception] IS NULL AND @original_Date_reception IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_Date" />
            <asp:Parameter Name="original_FK_ID" Type="Int32" />
            <asp:Parameter Name="original_Num_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Date_reception" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="FK_ID" Type="Int32" />
            <asp:Parameter Name="Num_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="Date_reception" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="FK_ID" Type="Int32" />
            <asp:Parameter Name="Num_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="Date_reception" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_Date" />
            <asp:Parameter Name="original_FK_ID" Type="Int32" />
            <asp:Parameter Name="original_Num_Commande" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Date_reception" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="FK_ID" SessionField="FK_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
