<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_DON_ARTICLE.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.VBSP.VBSP_DON_ARTICLE" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script>
      function genericPopup(href, width, height, scrollbars) {
          var param = "width=" + width + ", height=" + height + ", scrollbars=" + scrollbars + ", resizable, status";

          return window.open(href, "", param);
      }
      function LanguageComboBox_SelectedIndexChanged(s, e) {
          ASPxClientUtils.SetCookie("DXCurrentLanguage", s.GetValue());
      }
      function OnEditorValueChangedSurface(s, e) {
          var Hauteur = GridView.GetEditValue("Height");
          var Largeur = GridView.GetEditValue("Width");
          var Longueur = GridView.GetEditValue("Lenght");

          if (GridView.GetEditValue("Type") == "AUTRES") {
              GridView.SetEditValue("Surface", Longueur * Largeur);
          }
          else {

              GridView.SetEditValue("Surface", (2 * 3.14 * 3.14 * Hauteur) + (3.14 * H * Largeur));
          }
      }
      function OnEditorValueChangedVolume(s, e) {

          var Hauteur = GridView.GetEditValue("Height");
          var Largeur = GridView.GetEditValue("Width");
          var Longueur = GridView.GetEditValue("Lenght");

          if (GridView.GetEditValue("Type") == "AUTRES") {
              GridView.SetEditValue("Volume", Hauteur * Largeur * Longueur);

          }
          else {

              GridView.SetEditValue("Volume", Hauteur * Largeur * Longueur);
          }
      }
      function OnInitEdit(s, e) {
          s, e
          var User = '<%=@HttpContext.Current.User.Identity.Name%>';
            var now = new Date();
            GridView.SetEditValue("UserData", User);
            GridView.SetEditValue("DateData", now);
        }
        function OnSubmitHandler(s, e) {

            var text = s.GetText(e.PostedFile);
            alert(text);


            return true;


        }
    </script>

    <dx:ASPxComboBox runat="server" ID="ddlExportMode" Caption="Details Export Mode" AllowNull="False" Visible="False" meta:resourcekey="ddlExportModeResource1">
        <RootStyle CssClass="OptionsBottomMargin"></RootStyle>
        <CaptionCellStyle>
            <Paddings PaddingRight="4px" />
        </CaptionCellStyle>
    </dx:ASPxComboBox>
         <asp:LoginName ID="LoginName1" runat="server" meta:resourcekey="LoginName1Resource1" Visible="false" />

    <div style="margin-bottom: 10px">
        <div style="float:right">
            <dx:ASPxComboBox ID="LanguageComboBox" runat="server" AutoPostBack="True" ShowImageInEditBox="True" Caption="Language :" meta:resourcekey="ASPxComboBoxResource1" AllowNull="False">
             <ItemImage Height="24px" Width="23px" />
        <Items>
            <dx:ListEditItem Text="English" Value="en" meta:resourcekey="ListEditItemResource1" ImageUrl="~/img/UK-icon.png"/>
            <dx:ListEditItem Text="Francais" Value="fr" meta:resourcekey="ListEditItemResource2" ImageUrl="~/img/France-icon.png" />
            <dx:ListEditItem Text="Deutsch" Value="de" meta:resourcekey="ListEditItemResource3" ImageUrl="~/img/Germany-icon.png" />
        </Items>
        <ClientSideEvents SelectedIndexChanged="LanguageComboBox_SelectedIndexChanged" />

<ClearButton Visibility="Auto"></ClearButton>
    </dx:ASPxComboBox>
        </div>
        <div>
             <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to XLSX" UseSubmitBehavior="False" OnClick="btnXlsExport_Click" Theme="MetropolisBlue" meta:resourcekey="btnXlsxExportResource1">

             </dx:ASPxButton>
        </div>
       
       
         
    </div>

 


    <div>
        <dx:ASPxGridView ID="gridVBSP" runat="server" Theme="MetropolisBlue" AutoGenerateColumns="False" DataSourceID="DS_VBSP" KeyFieldName="IDPartNumber" ClientInstanceName="GridView" Style="margin-right: 1px" 
            OnStartRowEditing="grid_StartRowEditing" OnInitNewRow="gridVBSP_InitNewRow"
 OnRowUpdated="gridVBSP_RowUpdated" meta:resourcekey="gridVBSPResource1">
            <ClientSideEvents EndCallback="OnInitEdit" />
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
            <SettingsDetail ExportMode="All" />
            <Settings ShowFilterRow="True" />
            <SettingsSearchPanel Visible="False" />
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewColumnLayoutItem ColumnName="PartNumber" meta:resourcekey="GridViewColumnLayoutItemResource1">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="MOP" meta:resourcekey="GridViewColumnLayoutItemResource2">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Type">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Mass" meta:resourcekey="GridViewColumnLayoutItemResource3">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Lenght" meta:resourcekey="GridViewColumnLayoutItemResource4">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Width" meta:resourcekey="GridViewColumnLayoutItemResource5">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Height" meta:resourcekey="GridViewColumnLayoutItemResource6">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Materiel" meta:resourcekey="GridViewColumnLayoutItemResource7">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="FINO" meta:resourcekey="GridViewColumnLayoutItemResource8">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Litige" meta:resourcekey="GridViewColumnLayoutItemResource9">
                    </dx:GridViewColumnLayoutItem>
                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right" meta:resourcekey="EditModeCommandLayoutItemResource1">
                    </dx:EditModeCommandLayoutItem>
                </Items>
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" meta:resourcekey="GridViewCommandColumnResource1">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="IDPartNumber" ReadOnly="True" VisibleIndex="1" Visible="false" meta:resourcekey="GridViewDataTextColumnResource1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PartNumber" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="4" Caption="Gallery" meta:resourcekey="GridViewDataTextColumnResource3">
                    <DataItemTemplate>
                        <a id="clickElement" target="_blank" href="javascript:window.open('VBSP_Popup_DON.aspx?id=<%# Container.KeyValue %>','mywindowtitle','width=670,height=800')"><%# "Gallery = " + Eval("IDPartNumber").ToString()%></a>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mass" VisibleIndex="5" Caption="Poids(gr)" UnboundType="String" meta:resourcekey="GridViewDataTextColumnResource4">
                    <PropertiesTextEdit>

                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lenght" VisibleIndex="6" Caption="Longueur(mm)" meta:resourcekey="GridViewDataTextColumnResource5">
                    <PropertiesTextEdit>

                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Width" VisibleIndex="7" Caption="Largeur(mm)" meta:resourcekey="GridViewDataTextColumnResource6">
                    <PropertiesTextEdit>
                        <ClientSideEvents ValueChanged="OnEditorValueChangedSurface" />
                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Height" VisibleIndex="8" Caption="Hauteur(mm)" meta:resourcekey="GridViewDataTextColumnResource7">
                    <PropertiesTextEdit>
                        <ClientSideEvents ValueChanged="OnEditorValueChangedVolume" />
                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Surface" VisibleIndex="9" Caption="Surface(mm2)" ReadOnly="true" Visible="false" meta:resourcekey="GridViewDataTextColumnResource8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Volume" VisibleIndex="10" Caption="Volume(mm3)" ReadOnly="true" Visible="false" meta:resourcekey="GridViewDataTextColumnResource9">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataDateColumn FieldName="DatePicture" VisibleIndex="17" ReadOnly="true" meta:resourcekey="GridViewDataDateColumnResource1">
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
                <dx:GridViewDataTextColumn FieldName="UserPicture" VisibleIndex="18" Visible="true" ReadOnly="true" meta:resourcekey="GridViewDataTextColumnResource10">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataDateColumn FieldName="DateData" VisibleIndex="19" Visible="false" ReadOnly="true" meta:resourcekey="GridViewDataDateColumnResource2">
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

                <dx:GridViewDataTextColumn FieldName="UserData" VisibleIndex="20" Visible="false" ReadOnly="true" meta:resourcekey="GridViewDataTextColumnResource11">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Commentaires" VisibleIndex="21" Visible="false" meta:resourcekey="GridViewDataTextColumnResource12">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataComboBoxColumn FieldName="FINO" VisibleIndex="16" meta:resourcekey="GridViewDataComboBoxColumnResource1">
                    <PropertiesComboBox AllowNull="False">
                        <Items>
                            <dx:ListEditItem Text="NON" Value="NON" meta:resourcekey="ListEditItemResource4" />
                            <dx:ListEditItem Text="OUI" Value="OUI" meta:resourcekey="ListEditItemResource5" />
                        </Items>
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn FieldName="Materiel" VisibleIndex="11" meta:resourcekey="GridViewDataComboBoxColumnResource2">
                    <PropertiesComboBox AllowNull="False" DataSourceID="ds_material" TextField="MATERIAL" ValueField="MATERIAL">
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Name="Type" FieldName="Type" Caption="Type" VisibleIndex="22" meta:resourcekey="GridViewDataComboBoxColumnResource3">
                    <PropertiesComboBox AllowNull="False">
                        <Items>
                            <dx:ListEditItem Text="AUTRES" Value="AUTRES" meta:resourcekey="ListEditItemResource6" />
                            <dx:ListEditItem Text="VIS/ECROU/TUBE" Value="VIS/ECROU/TUBE" meta:resourcekey="ListEditItemResource7" />

                        </Items>
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataCheckColumn FieldName="Litige" VisibleIndex="23" meta:resourcekey="GridViewDataCheckColumnResource1">
                    <PropertiesCheckEdit ValueChecked="True      " ValueType="System.String" ValueUnchecked="False     ">
                    </PropertiesCheckEdit>
                </dx:GridViewDataCheckColumn>

                <dx:GridViewDataComboBoxColumn FieldName="MOP" VisibleIndex="3" meta:resourcekey="GridViewDataComboBoxColumnResource4">
                    <PropertiesComboBox AllowNull="False" DataSourceID="DS_MOP" TextField="LIBELLE_MOP" ValueField="ID_MOP">
                      
                     <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
               
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

            </Columns>
            <Styles AdaptiveDetailButtonWidth="22"></Styles>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
            <Templates>
                <EditForm>
                    <div>

                        <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormEditors" runat="server" ColumnID="" />

                              <dx:ASPxFormLayout runat="server" ID="FormEdit" DataSourceID="DS_VBSPImage" OnInit="FormEdit_Init" meta:resourcekey="FormEditResource1">
                            <Items>
                                <dx:LayoutGroup ColCount="2" meta:resourcekey="LayoutGroupResource1">
                                    <Items>
                                        <dx:LayoutItem Caption="Image1" FieldName="imgbi1" meta:resourcekey="LayoutItemResource1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource1">
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi1" meta:resourcekey="txt_imgbi1Resource1">
<EditingSettings Enabled="True"></EditingSettings>
                                                    </dx:ASPxBinaryImage>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Image2" FieldName="imgbi2" meta:resourcekey="LayoutItemResource2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource2">
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi2" meta:resourcekey="txt_imgbi2Resource1">
<EditingSettings Enabled="True"></EditingSettings>
                                                    </dx:ASPxBinaryImage>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Image3" FieldName="imgbi3" RowSpan="2" meta:resourcekey="LayoutItemResource3">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource3">
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi3" meta:resourcekey="txt_imgbi3Resource1">
<EditingSettings Enabled="True"></EditingSettings>
                                                    </dx:ASPxBinaryImage>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Image4" FieldName="imgbi4" RowSpan="2" meta:resourcekey="LayoutItemResource4">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource4">
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi4" meta:resourcekey="txt_imgbi4Resource1">
<EditingSettings Enabled="True"></EditingSettings>
                                                    </dx:ASPxBinaryImage>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>


                    
                    </div>
                    <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormUpdateButton" runat="server" ColumnID="" />
                    <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormCancelButton" runat="server" ColumnID="" />
                </EditForm>
            </Templates>
        </dx:ASPxGridView>
    </div>


    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" ExportEmptyDetailGrid="True" GridViewID="Grid_Export" FileName="Export" ExportSelectedRowsOnly="False">
    </dx:ASPxGridViewExporter>
    <dx:ASPxGridView ID="Grid_Export" runat="server" DataSourceID="DS_VBSP" Visible="False" AutoGenerateColumns="False" KeyFieldName="IDPartNumber" meta:resourcekey="Grid_ExportResource1">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IDPartNumber" ReadOnly="True" VisibleIndex="0" meta:resourcekey="GridViewDataTextColumnResource13">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PartNumber" VisibleIndex="1" meta:resourcekey="GridViewDataTextColumnResource14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mass" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Lenght" VisibleIndex="3" meta:resourcekey="GridViewDataTextColumnResource16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Width" VisibleIndex="4" meta:resourcekey="GridViewDataTextColumnResource17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Height" VisibleIndex="5" meta:resourcekey="GridViewDataTextColumnResource18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Surface" VisibleIndex="6" meta:resourcekey="GridViewDataTextColumnResource19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Volume" VisibleIndex="7" meta:resourcekey="GridViewDataTextColumnResource20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Materiel" VisibleIndex="8" meta:resourcekey="GridViewDataTextColumnResource21">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img1" VisibleIndex="9" meta:resourcekey="GridViewDataTextColumnResource22">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img2" VisibleIndex="10" meta:resourcekey="GridViewDataTextColumnResource23">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img3" VisibleIndex="11" meta:resourcekey="GridViewDataTextColumnResource24">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img4" VisibleIndex="12" meta:resourcekey="GridViewDataTextColumnResource25">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FINO" VisibleIndex="13" meta:resourcekey="GridViewDataTextColumnResource26">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DatePicture" VisibleIndex="14" meta:resourcekey="GridViewDataDateColumnResource3">
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
            <dx:GridViewDataTextColumn FieldName="UserPicture" VisibleIndex="15" meta:resourcekey="GridViewDataTextColumnResource27">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DateData" VisibleIndex="16" meta:resourcekey="GridViewDataDateColumnResource4">
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
            <dx:GridViewDataTextColumn FieldName="UserData" VisibleIndex="17" meta:resourcekey="GridViewDataTextColumnResource28">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Commentaires" VisibleIndex="18" meta:resourcekey="GridViewDataTextColumnResource29">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="19" meta:resourcekey="GridViewDataTextColumnResource30">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Litige" VisibleIndex="20" meta:resourcekey="GridViewDataTextColumnResource31">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MOP2" VisibleIndex="21" meta:resourcekey="GridViewDataTextColumnResource32">               

            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="DS_VBSP" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" OnInserting="SqlDataSource1_Inserting"
        DeleteCommand="DELETE FROM [VBSP_TB_ArticleDON] WHERE [IDPartNumber] = @original_IDPartNumber"
        InsertCommand="
        INSERT INTO 
        [VBSP_TB_ArticleDON] 
        ([PartNumber], 
        [MassZ], 
        [Lenght], [Width], [Height], [Surface], [Volume], [Materiel], [DateData], [UserData], [Commentaires], [Type], [Litige], [Mass],[FINO],[MOP]) 
        VALUES (@PartNumber, @MassZ, @Lenght, @Width, @Height, @Surface, @Volume, @Materiel, @DateData, @UserData, @Commentaires, @Type, @Litige, @Mass,@FINO,@MOP)"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT 
        VBSP_TB_ArticleDON.IDPartNumber, 
        VBSP_TB_ArticleDON.PartNumber, 
        VBSP_TB_ArticleDON.MassZ, 
        VBSP_TB_ArticleDON.Lenght, VBSP_TB_ArticleDON.Width, VBSP_TB_ArticleDON.Height, VBSP_TB_ArticleDON.Surface, VBSP_TB_ArticleDON.Volume, VBSP_TB_ArticleDON.Materiel, 
        VBSP_TB_ArticleDON.FINO, VBSP_TB_ArticleDON.DatePicture, VBSP_TB_ArticleDON.UserPicture, VBSP_TB_ArticleDON.DateData, VBSP_TB_ArticleDON.UserData, 
        VBSP_TB_ArticleDON.Commentaires, VBSP_TB_ArticleDON.Type, VBSP_TB_ArticleDON.Litige, VBSP_TB_ArticleDON.Mass, VBSP_TB_ArticleDON.MOP, VBSP_TB_ArticleDON.img1,VBSP_TB_ArticleDON.img2,VBSP_TB_ArticleDON.img3,VBSP_TB_ArticleDON.img4,VBSP_TB_MOP.MOP AS MOP2 FROM VBSP_TB_ArticleDON LEFT OUTER JOIN VBSP_TB_MOP ON VBSP_TB_ArticleDON.MOP = VBSP_TB_MOP.ID_MOP"
        UpdateCommand="UPDATE 
        [VBSP_TB_ArticleDON] 
        SET [PartNumber] = @PartNumber
        , [MassZ] = @MassZ
        , [Lenght] = @Lenght
        , [Width] = @Width
        , [Height] = @Height
        , [Surface] = @Surface
        , [Volume] = @Volume
        , [Materiel] = @Materiel
         ,[FINO] = @FINO,
 
        
       [MOP]= @MOP, 

        [DatePicture] = @DatePicture, [UserPicture] = @UserPicture, [DateData] = @DateData, [UserData] = @UserData, [Commentaires] = @Commentaires, [Type] = @Type, [Litige] = @Litige, [Mass] = @Mass 
        WHERE [IDPartNumber] = @original_IDPartNumber">
        <DeleteParameters>
            <asp:Parameter Name="original_IDPartNumber" Type="Int32" />

        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PartNumber" Type="String" />
            <asp:Parameter Name="MassZ" Type="Int32" />
            <asp:Parameter Name="Lenght" Type="Int32" />
            <asp:Parameter Name="Width" Type="Int32" />
            <asp:Parameter Name="Height" Type="Int32" />
            <asp:Parameter Name="Surface" Type="Double" />
            <asp:Parameter Name="Volume" Type="Double" />
            <asp:Parameter Name="Materiel" Type="String" />
            <asp:Parameter DbType="Date" Name="DateData" />
            <asp:Parameter Name="UserData" Type="String" />
            <asp:Parameter Name="Commentaires" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Litige" Type="String" />
            <asp:Parameter Name="Mass" Type="Double" />
            <asp:Parameter Name="FINO" Type="String" />
            <asp:Parameter Name="MOP" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PartNumber" Type="String" />
            <asp:Parameter Name="MassZ" Type="Int32" />
            <asp:Parameter Name="Lenght" Type="Int32" />
            <asp:Parameter Name="Width" Type="Int32" />
            <asp:Parameter Name="Height" Type="Int32" />
            <asp:Parameter Name="Surface" Type="Double" />
            <asp:Parameter Name="Volume" Type="Double" />
            <asp:Parameter Name="Materiel" Type="String" />
            <asp:Parameter Name="FINO" Type="String" />
           
            <asp:Parameter Name="MOP" Type="Int32" />

            <asp:Parameter DbType="Date" Name="DatePicture" />
            <asp:Parameter Name="UserPicture" Type="String" />
            <asp:Parameter DbType="Date" Name="DateData" />
            <asp:Parameter Name="UserData" Type="String" />
            <asp:Parameter Name="Commentaires" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Litige" Type="String" />
            <asp:Parameter Name="Mass" Type="Double" />
            <asp:Parameter Name="original_IDPartNumber" Type="Int32" />

        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_VBSPImage" runat="server"
       
        ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
       
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT IDPartNumber,
        imgbi1,imgbi2,imgbi3,imgbi4 
        FROM VBSP_TB_ArticleDON where IDPartNumber = @IDPartNumber">

        <SelectParameters>
            <asp:Parameter Name="IDPartNumber" Type="Int32" DefaultValue="1755" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_MOP" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" 
        DeleteCommand="DELETE FROM [VBSP_TB_MOP] WHERE [ID_MOP] = @original_ID_MOP AND (([MOP] = @original_MOP) OR ([MOP] IS NULL AND @original_MOP IS NULL)) AND (([LIBELLE_MOP] = @original_LIBELLE_MOP) OR ([LIBELLE_MOP] IS NULL AND @original_LIBELLE_MOP IS NULL))" InsertCommand="INSERT INTO [VBSP_TB_MOP] ([MOP], [LIBELLE_MOP]) VALUES (@MOP, @LIBELLE_MOP)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [VBSP_TB_MOP]" UpdateCommand="UPDATE [VBSP_TB_MOP] SET [MOP] = @MOP, [LIBELLE_MOP] = @LIBELLE_MOP WHERE [ID_MOP] = @original_ID_MOP AND (([MOP] = @original_MOP) OR ([MOP] IS NULL AND @original_MOP IS NULL)) AND (([LIBELLE_MOP] = @original_LIBELLE_MOP) OR ([LIBELLE_MOP] IS NULL AND @original_LIBELLE_MOP IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID_MOP" Type="Int32" />
            <asp:Parameter Name="original_MOP" Type="String" />
            <asp:Parameter Name="original_LIBELLE_MOP" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MOP" Type="String" />
            <asp:Parameter Name="LIBELLE_MOP" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MOP" Type="String" />
            <asp:Parameter Name="LIBELLE_MOP" Type="String" />
            <asp:Parameter Name="original_ID_MOP" Type="Int32" />
            <asp:Parameter Name="original_MOP" Type="String" />
            <asp:Parameter Name="original_LIBELLE_MOP" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_material" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [VBSP_TB_material]">

    </asp:SqlDataSource>

   

</asp:Content>
