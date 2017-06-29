<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion_AmontBL.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.GestionAmont.Gestion_AmontBL" %>
<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
              
        function gridBegin(s, e) {
            callbackName = e.command;
            if (e.command == "ADDNEWROW"){
                mode = "ajout";
            }

        }
        function gridEnd(s, e) {
            //alert(callbackName);
            //alert(mode);
            if (callbackName == 'UPDATEEDIT' && mode == 'ajout') {        

                if (s.cp_Arg != "Vide") {
                    //alert(s.cp_Arg);
                    var link = "mailto:" + s.cp_Arg
                    + "&subject=" + escape("Votre Amont BR N") +s.cp_ID
                    + "&body=Bonjour,%0A%0A"
                    +txt_mail
                    + " %0A Cordialement";

                    window.location.href = link;
                    mode = null;
                    delete (s.cp_Arg);
                }
                delete (s.cp_Arg);
            }
        }
        function blocage_change(s, e) {
            var_txt_mail = s.GetSelectedItem().texts[3];
            corp_mail.SetText(var_txt_mail);
            
        }
        function corp_mail_change(s_e) {

            txt_mail = corp_mail.GetText();
        }
       
      

    </script>

    
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
      <dx:ASPxTextBox ID="IdReport" runat="server" Width="170px" Text="1065" ClientVisible="false"></dx:ASPxTextBox>


    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="IDAmont" ClientInstanceName="grid"
        OnCellEditorInitialize="grid_CellEditorInitialize" OnRowInserted="grid_RowInserted1" OnStartRowEditing="grid_StartRowEditing" OnInitNewRow="grid_InitNewRow"  > 
        <ClientSideEvents BeginCallback="gridBegin" EndCallback="gridEnd"   />      
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        
        <Settings ShowFilterRow="True" />
        
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowEllipsisInText="false" />
        <SettingsSearchPanel Visible="False" />
        <EditFormLayoutProperties ColCount="2" SettingsItems-Width="800">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="Type_Amont BL" ColSpan="2" Caption="Type Amont">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="Statut" Name="statut">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewLayoutGroup Caption="Declaration" ColCount="2" ColSpan="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Approvisionneur" Caption="Appro/Emetteur">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Code_Appro">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Mail">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Type_Document">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Date_Document">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Probleme">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Reference">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="BL_Service">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="ZLECI">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem Caption="Corps Mail" ColumnName="txt_mail">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="BL_Fournisseur">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Emplacement">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Fournisseur">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Num_Doc">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Defaut">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Divers">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:GridViewLayoutGroup Caption="Resolution" ColSpan="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Commentaire">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Division">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="BR_B102">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Service_AH">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Contact">
                        </dx:GridViewColumnLayoutItem>
                    </Items>
                </dx:GridViewLayoutGroup>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>

<SettingsItems Width="800px"></SettingsItems>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="IDAmont" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn VisibleIndex="2" Caption="Doc Amont">
                <DataItemTemplate>
                    <dx:ASPxButton runat="server" ID="btn_print" OnClick="btn_print_Click" Text="" Image-IconID="print_print_16x16" Height="16" Width="16" Theme="MetropolisBlue" VisibleIndex="13"></dx:ASPxButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Code_Appro" VisibleIndex="4">
                <PropertiesTextEdit ClientInstanceName="code_appro">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Emplacement" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Approvisionneur" VisibleIndex="6">          
             </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BL_Fournisseur" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ZLECI" VisibleIndex="11" Visible="False">                      
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Commentaire" VisibleIndex="15" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Service_AH" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Division" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BR_B102" VisibleIndex="16" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Fournisseur" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Contact" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Reference" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mail" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Num_Doc" VisibleIndex="21">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Defaut" VisibleIndex="22">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Divers" VisibleIndex="23" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Statut" VisibleIndex="3">
                <PropertiesComboBox AllowNull="False" ClientInstanceName="statut">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Creation" Value="Creation" />
                        <dx:ListEditItem Text="Resolution" Value="Resolution" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Type_AmontBL" VisibleIndex="12">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="Amont BL" Value="Amont BL" />
                        <dx:ListEditItem Text="Amont BR" Value="Amont BR" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Probleme" VisibleIndex="10">
                <PropertiesComboBox AllowNull="False" DataSourceID="DS_Blocage" TextField="Typologie" ValueField="ID_Blocage" DropDownStyle="DropDownList" DropDownWidth="800" TextFormatString="{0}">
                    <ClientSideEvents SelectedIndexChanged="blocage_change" />
                    <Columns>
                        <dx:ListBoxColumn FieldName="Typologie" Width="100%"/>
                        <dx:ListBoxColumn FieldName="ActionDaher" Width="100%"/>
                        <dx:ListBoxColumn FieldName="Action" Width="100%"/>
                        <dx:ListBoxColumn FieldName="TexteMail" Width="0"/>
                    </Columns>

<ClearButton Visibility="Auto"></ClearButton>
                </PropertiesComboBox>
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Type_Document" VisibleIndex="9">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="FTD" Value="FTD" />
                        <dx:ListEditItem Text="BE" Value="BE" />
                        <dx:ListEditItem Text="GROUPE" Value="GROUPE" />
                        <dx:ListEditItem Text="OT" Value="OT" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="Date_Document" VisibleIndex="24" Visible="False">
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
            <dx:GridViewDataComboBoxColumn FieldName="BL_Service" VisibleIndex="7">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Text="Expe P.Gouv" Value="Expe P.Gouv" />
                        <dx:ListEditItem Text="Expe. MonoColis" Value="Expe. MonoColis" />
                        <dx:ListEditItem Text="Expe. Kits" Value="Expe. Kits" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataMemoColumn FieldName="txt_mail" VisibleIndex="25" Visible="false">                
                <PropertiesMemoEdit ClientInstanceName="corp_mail" Height="200px">
                    <ClientSideEvents TextChanged="corp_mail_change" />
                </PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
         <SettingsDetail ShowDetailRow="True" />
         <Templates>
            <DetailRow>
                <dx:ASPxPageControl runat="server" ID="pagecontrol" EnableCallBacks="true" >
                    <TabPages>                       
                        <dx:TabPage Text="Mouvement">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxGridView ID="GridMouvement" runat="server" DataSourceID="DS_Mouvement" AutoGenerateColumns="False" OnBeforePerformDataSelect="Mouvement_DataSelect" KeyFieldName="ID_Mouvement">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ID_Mouvement" VisibleIndex="0" ReadOnly="True">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn FieldName="Date_Mouvement" VisibleIndex="1">
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
                                                    <dx:GridViewDataTextColumn FieldName="Statut" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Affectation" VisibleIndex="3" Caption="Mail"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Commentaire" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
											        <dx:GridViewDataTextColumn FieldName="IDAmont" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
											        <dx:GridViewDataTextColumn FieldName="User" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>

                                                <Styles AdaptiveDetailButtonWidth="22"></Styles>

                                            </dx:ASPxGridView> 
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>   
                        <dx:TabPage Text="Detail">
                            <ContentCollection>
                                <dx:ContentControl>                           
                                     <dx:ASPxGridView runat="server" ID="GridDetail" DataSourceID="DS_Detail" OnBeforePerformDataSelect="Mouvement_DataSelect" AutoGenerateColumns="False" KeyFieldName="IDAmont">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn FieldName="IDAmont" ReadOnly="True" VisibleIndex="0">
                                                                            <EditFormSettings Visible="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Code_Appro" VisibleIndex="1">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Emplacement" VisibleIndex="2">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Approvisionneur" VisibleIndex="3">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="BL_Fournisseur" VisibleIndex="4">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="ZLECI" VisibleIndex="5">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Commentaire" VisibleIndex="6">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Service_AH" VisibleIndex="8">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Division" VisibleIndex="9">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="BR_B102" VisibleIndex="10">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Type_Document" VisibleIndex="11">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Type_AmontBL" VisibleIndex="12">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Probleme" VisibleIndex="13">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Fournisseur" VisibleIndex="14">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Contact" VisibleIndex="15">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Reference" VisibleIndex="16">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Mail" VisibleIndex="17">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Num_Doc" VisibleIndex="18">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Defaut" VisibleIndex="19">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Divers" VisibleIndex="20">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Statut" VisibleIndex="21">
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataDateColumn FieldName="Date_Document" VisibleIndex="22">
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
                                                                        <dx:GridViewDataTextColumn FieldName="BL_Service" VisibleIndex="23">
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                <Styles AdaptiveDetailButtonWidth="22"></Styles>
                                                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>

                        </dx:TabPage>                     
                    </TabPages>
       
                </dx:ASPxPageControl>
            </DetailRow>  
          
        </Templates>
    </dx:ASPxGridView>
           
       

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



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"  OnInserted="Grid_Inserted"
        DeleteCommand="DELETE FROM [T_EXPE_Amont] WHERE [IDAmont] = @original_IDAmont AND (([Code_Appro] = @original_Code_Appro) OR ([Code_Appro] IS NULL AND @original_Code_Appro IS NULL)) AND (([Emplacement] = @original_Emplacement) OR ([Emplacement] IS NULL AND @original_Emplacement IS NULL)) AND (([Approvisionneur] = @original_Approvisionneur) OR ([Approvisionneur] IS NULL AND @original_Approvisionneur IS NULL)) AND (([BL_Fournisseur] = @original_BL_Fournisseur) OR ([BL_Fournisseur] IS NULL AND @original_BL_Fournisseur IS NULL)) AND (([ZLECI] = @original_ZLECI) OR ([ZLECI] IS NULL AND @original_ZLECI IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([Service_AH] = @original_Service_AH) OR ([Service_AH] IS NULL AND @original_Service_AH IS NULL)) AND (([Division] = @original_Division) OR ([Division] IS NULL AND @original_Division IS NULL)) AND (([BR_B102] = @original_BR_B102) OR ([BR_B102] IS NULL AND @original_BR_B102 IS NULL)) AND (([Type_Document] = @original_Type_Document) OR ([Type_Document] IS NULL AND @original_Type_Document IS NULL)) AND (([Type_AmontBL] = @original_Type_AmontBL) OR ([Type_AmontBL] IS NULL AND @original_Type_AmontBL IS NULL)) AND (([Probleme] = @original_Probleme) OR ([Probleme] IS NULL AND @original_Probleme IS NULL)) AND (([Fournisseur] = @original_Fournisseur) OR ([Fournisseur] IS NULL AND @original_Fournisseur IS NULL)) AND (([Contact] = @original_Contact) OR ([Contact] IS NULL AND @original_Contact IS NULL)) AND (([Reference] = @original_Reference) OR ([Reference] IS NULL AND @original_Reference IS NULL)) AND (([Mail] = @original_Mail) OR ([Mail] IS NULL AND @original_Mail IS NULL)) AND (([Num_Doc] = @original_Num_Doc) OR ([Num_Doc] IS NULL AND @original_Num_Doc IS NULL)) AND (([Defaut] = @original_Defaut) OR ([Defaut] IS NULL AND @original_Defaut IS NULL)) AND (([Divers] = @original_Divers) OR ([Divers] IS NULL AND @original_Divers IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Date_Document] = @original_Date_Document) OR ([Date_Document] IS NULL AND @original_Date_Document IS NULL)) AND (([BL_Service] = @original_BL_Service) OR ([BL_Service] IS NULL AND @original_BL_Service IS NULL))" 
        InsertCommand="INSERT INTO [T_EXPE_Amont] 
        ([Code_Appro], 
        [Emplacement], 
        [Approvisionneur], 
        [BL_Fournisseur], 
        [ZLECI], 
        [Commentaire],
         [Service_AH], 
        [Division], 
        [BR_B102],
         [Type_Document], 
        [Type_AmontBL], 
        [Probleme], [Fournisseur], [Contact], [Reference], [Mail], [Num_Doc], [Defaut], [Divers], [Statut], [Date_Document], [BL_Service],[txt_mail])
         VALUES (@Code_Appro, @Emplacement, @Approvisionneur, @BL_Fournisseur, @ZLECI, @Commentaire, @Service_AH, @Division, @BR_B102, @Type_Document, 
        @Type_AmontBL, @Probleme, @Fournisseur, @Contact, @Reference, @Mail, @Num_Doc, @Defaut, @Divers, @Statut, @Date_Document, @BL_Service,@txt_mail)
SET @QuoteID = Scope_Identity();"
         OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_EXPE_Amont]"
         UpdateCommand="UPDATE
         [T_EXPE_Amont] SET [Code_Appro] = @Code_Appro, [Emplacement] = @Emplacement, [Approvisionneur] = @Approvisionneur, [BL_Fournisseur] = @BL_Fournisseur, [ZLECI] = @ZLECI,
         [Commentaire] = @Commentaire, [Service_AH] = @Service_AH, [Division] = @Division, [BR_B102] = @BR_B102, [Type_Document] = @Type_Document, [Type_AmontBL] = @Type_AmontBL, 
        [Probleme] = @Probleme, [Fournisseur] = @Fournisseur, [Contact] = @Contact, [Reference] = @Reference, [Mail] = @Mail, [txt_mail]=@txt_mail,[Num_Doc] = @Num_Doc, [Defaut] = @Defaut, [Divers] = @Divers, 
        [Statut] = @Statut, [Date_Document] = @Date_Document, [BL_Service] = @BL_Service 
        WHERE [IDAmont] = @original_IDAmont AND (([Code_Appro] = @original_Code_Appro) OR ([Code_Appro] IS NULL AND @original_Code_Appro IS NULL)) AND (([Emplacement] = @original_Emplacement) OR ([Emplacement] IS NULL AND @original_Emplacement IS NULL)) AND (([Approvisionneur] = @original_Approvisionneur) OR ([Approvisionneur] IS NULL AND @original_Approvisionneur IS NULL)) AND (([BL_Fournisseur] = @original_BL_Fournisseur) OR ([BL_Fournisseur] IS NULL AND @original_BL_Fournisseur IS NULL)) AND (([ZLECI] = @original_ZLECI) OR ([ZLECI] IS NULL AND @original_ZLECI IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([Service_AH] = @original_Service_AH) OR ([Service_AH] IS NULL AND @original_Service_AH IS NULL)) AND (([Division] = @original_Division) OR ([Division] IS NULL AND @original_Division IS NULL)) AND (([BR_B102] = @original_BR_B102) OR ([BR_B102] IS NULL AND @original_BR_B102 IS NULL)) AND (([Type_Document] = @original_Type_Document) OR ([Type_Document] IS NULL AND @original_Type_Document IS NULL)) AND (([Type_AmontBL] = @original_Type_AmontBL) OR ([Type_AmontBL] IS NULL AND @original_Type_AmontBL IS NULL)) AND (([Probleme] = @original_Probleme) OR ([Probleme] IS NULL AND @original_Probleme IS NULL)) AND (([Fournisseur] = @original_Fournisseur) OR ([Fournisseur] IS NULL AND @original_Fournisseur IS NULL)) AND (([Contact] = @original_Contact) OR ([Contact] IS NULL AND @original_Contact IS NULL)) AND (([Reference] = @original_Reference) OR ([Reference] IS NULL AND @original_Reference IS NULL)) AND (([Mail] = @original_Mail) OR ([Mail] IS NULL AND @original_Mail IS NULL)) AND (([Num_Doc] = @original_Num_Doc) OR ([Num_Doc] IS NULL AND @original_Num_Doc IS NULL)) AND (([Defaut] = @original_Defaut) OR ([Defaut] IS NULL AND @original_Defaut IS NULL)) AND (([Divers] = @original_Divers) OR ([Divers] IS NULL AND @original_Divers IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Date_Document] = @original_Date_Document) OR ([Date_Document] IS NULL AND @original_Date_Document IS NULL)) AND (([BL_Service] = @original_BL_Service) OR ([BL_Service] IS NULL AND @original_BL_Service IS NULL))
SET @QuoteID = Scope_Identity();">
        <DeleteParameters>
            <asp:Parameter Name="original_IDAmont" Type="Int32" />
            <asp:Parameter Name="original_Code_Appro" Type="String" />
            <asp:Parameter Name="original_Emplacement" Type="String" />
            <asp:Parameter Name="original_Approvisionneur" Type="String" />
            <asp:Parameter Name="original_BL_Fournisseur" Type="String" />
            <asp:Parameter Name="original_ZLECI" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_Service_AH" Type="String" />
            <asp:Parameter Name="original_Division" Type="String" />
            <asp:Parameter Name="original_BR_B102" Type="String" />
            <asp:Parameter Name="original_Type_Document" Type="String" />
            <asp:Parameter Name="original_Type_AmontBL" Type="String" />
            <asp:Parameter Name="original_Probleme" Type="String" />
            <asp:Parameter Name="original_Fournisseur" Type="String" />
            <asp:Parameter Name="original_Contact" Type="String" />
            <asp:Parameter Name="original_Reference" Type="String" />
            <asp:Parameter Name="original_Mail" Type="String" />
            <asp:Parameter Name="original_Num_Doc" Type="String" />
            <asp:Parameter Name="original_Defaut" Type="String" />
            <asp:Parameter Name="original_Divers" Type="String" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Date_Document" Type="DateTime" />
            <asp:Parameter Name="original_BL_Service" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Code_Appro" Type="String" />
            <asp:Parameter Name="Emplacement" Type="String" />
            <asp:Parameter Name="Approvisionneur" Type="String" />
            <asp:Parameter Name="BL_Fournisseur" Type="String" />
            <asp:Parameter Name="ZLECI" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="Service_AH" Type="String" />
            <asp:Parameter Name="Division" Type="String" />
            <asp:Parameter Name="BR_B102" Type="String" />
            <asp:Parameter Name="Type_Document" Type="String" />
            <asp:Parameter Name="Type_AmontBL" Type="String" />
            <asp:Parameter Name="Probleme" Type="String" />
            <asp:Parameter Name="Fournisseur" Type="String" />
            <asp:Parameter Name="Contact" Type="String" />
            <asp:Parameter Name="Reference" Type="String" />
            <asp:Parameter Name="Mail" Type="String" />
            <asp:Parameter Name="Num_Doc" Type="String" />
            <asp:Parameter Name="Defaut" Type="String" />
            <asp:Parameter Name="Divers" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
             <asp:Parameter Name="Date_Document" Type="DateTime"/>
            <asp:Parameter Name="BL_Service" Type="String" />   
            <asp:Parameter Name="txt_mail" Type="String" />       
           <asp:Parameter Name="QuoteID" Direction="Output" Type="Int32"/>
          
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Code_Appro" Type="String" />
            <asp:Parameter Name="Emplacement" Type="String" />
            <asp:Parameter Name="Approvisionneur" Type="String" />
            <asp:Parameter Name="BL_Fournisseur" Type="String" />
            <asp:Parameter Name="ZLECI" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="Service_AH" Type="String" />
            <asp:Parameter Name="Division" Type="String" />
            <asp:Parameter Name="BR_B102" Type="String" />
            <asp:Parameter Name="Type_Document" Type="String" />
            <asp:Parameter Name="Type_AmontBL" Type="String" />
            <asp:Parameter Name="Probleme" Type="String" />
            <asp:Parameter Name="Fournisseur" Type="String" />
            <asp:Parameter Name="Contact" Type="String" />
            <asp:Parameter Name="Reference" Type="String" />
            <asp:Parameter Name="Mail" Type="String" />
            <asp:Parameter Name="Num_Doc" Type="String" />
            <asp:Parameter Name="Defaut" Type="String" />
            <asp:Parameter Name="Divers" Type="String" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="txt_mail" Type="String" />
            <asp:Parameter Name="Date_Document" Type="DateTime" />
            <asp:Parameter Name="BL_Service" Type="String" />
            <asp:Parameter Name="original_txt_mail" Type="String" />
            <asp:Parameter Name="original_IDAmont" Type="Int32" />
            <asp:Parameter Name="original_Code_Appro" Type="String" />
            <asp:Parameter Name="original_Emplacement" Type="String" />
            <asp:Parameter Name="original_Approvisionneur" Type="String" />
            <asp:Parameter Name="original_BL_Fournisseur" Type="String" />
            <asp:Parameter Name="original_ZLECI" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_Service_AH" Type="String" />
            <asp:Parameter Name="original_Division" Type="String" />
            <asp:Parameter Name="original_BR_B102" Type="String" />
            <asp:Parameter Name="original_Type_Document" Type="String" />
            <asp:Parameter Name="original_Type_AmontBL" Type="String" />
            <asp:Parameter Name="original_Probleme" Type="String" />
            <asp:Parameter Name="original_Fournisseur" Type="String" />
            <asp:Parameter Name="original_Contact" Type="String" />
            <asp:Parameter Name="original_Reference" Type="String" />
            <asp:Parameter Name="original_Mail" Type="String" />
            <asp:Parameter Name="original_Num_Doc" Type="String" />
            <asp:Parameter Name="original_Defaut" Type="String" />
            <asp:Parameter Name="original_Divers" Type="String" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Date_Document" Type="DateTime" />
            <asp:Parameter Name="original_BL_Service" Type="String" />
           <asp:Parameter Name="QuoteID" Direction="Output" Type="Int32"/>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Mouvement" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [T_Expe_Amont_Mouvement] WHERE IDAMONT = @IDAmont"  
        DeleteCommand="DELETE FROM [T_Expe_Amont_Mouvement] 
        WHERE [ID_Mouvement] = @original_ID_Mouvement AND (([Date_Mouvement] = @original_Date_Mouvement) OR ([Date_Mouvement] IS NULL AND @original_Date_Mouvement IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Affectation] = @original_Affectation) OR ([Affectation] IS NULL AND @original_Affectation IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([IDAmont] = @original_IDAmont) OR ([IDAmont] IS NULL AND @original_IDAmont IS NULL)) AND (([User] = @original_User) OR ([User] IS NULL AND @original_User IS NULL))" 
        InsertCommand="INSERT INTO [T_Expe_Amont_Mouvement] ([Date_Mouvement], [Statut], [Affectation], [Commentaire], [IDAmont], [User]) VALUES (@Date_Mouvement, @Statut, @Affectation, @Commentaire, @IDAmont, @User)" 
        UpdateCommand="UPDATE [T_Expe_Amont_Mouvement] SET [Date_Mouvement] = @Date_Mouvement, [Statut] = @Statut, [Affectation] = @Affectation, [Commentaire] = @Commentaire, [IDAmont] = @IDAmont, [User] = @User WHERE [ID_Mouvement] = @original_ID_Mouvement AND (([Date_Mouvement] = @original_Date_Mouvement) OR ([Date_Mouvement] IS NULL AND @original_Date_Mouvement IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Affectation] = @original_Affectation) OR ([Affectation] IS NULL AND @original_Affectation IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([IDAmont] = @original_IDAmont) OR ([IDAmont] IS NULL AND @original_IDAmont IS NULL)) AND (([User] = @original_User) OR ([User] IS NULL AND @original_User IS NULL))" >
      <SelectParameters>
          <asp:SessionParameter Name="IDAmont" SessionField="IDAmont" Type="Int32"/>
      </SelectParameters>  
                                        
      <DeleteParameters>
            <asp:Parameter Name="original_ID_Mouvement" Type="Int32" />
            <asp:Parameter Name="original_Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Affectation" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_IDAmont" Type="Int32" />
            <asp:Parameter Name="original_User" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Affectation" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="IDAmont" Type="Int32" />
            <asp:Parameter Name="User" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Affectation" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="IDAmont" Type="Int32" />
            <asp:Parameter Name="User" Type="String" />
            <asp:Parameter Name="original_ID_Mouvement" Type="Int32" />
            <asp:Parameter Name="original_Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Affectation" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_IDAmont" Type="Int32" />
            <asp:Parameter Name="original_User" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Blocage" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        SelectCommand="SELECT * FROM [T_Expe_Amont_Blocage]">

    </asp:SqlDataSource>       



    <asp:SqlDataSource ID="DS_Detail" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="Select * From T_Expe_Amont WHERE IDAmont = @IDAmont">
        <SelectParameters>
            <asp:SessionParameter Name="IDAmont" SessionField="IDAmont" Type="Int32" />
        </SelectParameters>
        
    </asp:SqlDataSource>
    
</asp:Content>
