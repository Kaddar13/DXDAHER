<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_NEW_ARTICLE.aspx.cs" Inherits="DX_DAHERCMS.VBSP.VBSP_NEW_ARTICLE" %>

<%@ Register Src="~/UserControl/ExportToolBar.ascx" TagPrefix="uc1" TagName="ExportToolBar" %>

<%@ Register Assembly="DevExpress.Xpo.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function genericPopup(href, width, height, scrollbars) {
            var param = "width=" + width + ", height=" + height + ", scrollbars=" + scrollbars + ", resizable, status";

            return window.open(href, "", param);
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
    <dx:ASPxComboBox runat="server" ID="ddlExportMode" Caption="Details Export Mode" AllowNull="False" Visible="false">
        <RootStyle CssClass="OptionsBottomMargin"></RootStyle>
        <CaptionCellStyle>
            <Paddings PaddingRight="4px" />
        </CaptionCellStyle>
    </dx:ASPxComboBox>
    <div style="margin-bottom: 10px">
        <asp:LoginName ID="LoginName1" runat="server" Visible="True" />
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to XLSX" UseSubmitBehavior="False" OnClick="btnXlsExport_Click" />
    </div>



    <div>
        <dx:ASPxGridView ID="gridVBSP" runat="server" Theme="MetropolisBlue" AutoGenerateColumns="False" DataSourceID="DS_VBSP" KeyFieldName="IDPartNumber" ClientInstanceName="GridView" Style="margin-right: 1px" 
           
            OnStartRowEditing="grid_StartRowEditing" OnRowUpdated="gridVBSP_RowUpdated">
            <ClientSideEvents EndCallback="OnInitEdit" />
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
            <SettingsDetail ExportMode="All" />
            <Settings ShowFilterRow="True" />
            <SettingsSearchPanel Visible="False" />
            <EditFormLayoutProperties ColCount="2">
                <Items>
                    <dx:GridViewColumnLayoutItem ColumnName="PartNumber">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="MOP">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Mass">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Lenght">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Width">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Height">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Materiel">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="FINO">
                    </dx:GridViewColumnLayoutItem>
                    <dx:GridViewColumnLayoutItem ColumnName="Litige">
                    </dx:GridViewColumnLayoutItem>
                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                    </dx:EditModeCommandLayoutItem>
                </Items>
            </EditFormLayoutProperties>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="IDPartNumber" ReadOnly="True" VisibleIndex="1" Visible="false">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PartNumber" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="4" Caption="Gallery">
                    <DataItemTemplate>
                        <a id="clickElement" target="_blank" href="javascript:window.open('VBSP_Popup.aspx?id=<%# Container.KeyValue%>','mywindowtitle','width=670,height=800')"><%# "Gallery = " + Eval("IDPartNumber").ToString()%></a>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mass" VisibleIndex="5" Caption="Poids(gr)" UnboundType="String">
                    <PropertiesTextEdit>

                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lenght" VisibleIndex="6" Caption="Longueur(mm)">
                    <PropertiesTextEdit>

                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Width" VisibleIndex="7" Caption="Largeur(mm)">
                    <PropertiesTextEdit>
                        <ClientSideEvents ValueChanged="OnEditorValueChangedSurface" />
                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Height" VisibleIndex="8" Caption="Hauteur(mm)">
                    <PropertiesTextEdit>
                        <ClientSideEvents ValueChanged="OnEditorValueChangedVolume" />
                        <ValidationSettings>
                            <RequiredField IsRequired="True" ErrorText="Champs Obligatoire" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Surface" VisibleIndex="9" Caption="Surface(mm2)" ReadOnly="true" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Volume" VisibleIndex="10" Caption="Volume(mm3)" ReadOnly="true" Visible="false">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataDateColumn FieldName="DatePicture" VisibleIndex="17" ReadOnly="true">
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
                <dx:GridViewDataTextColumn FieldName="UserPicture" VisibleIndex="18" Visible="true" ReadOnly="true">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataDateColumn FieldName="DateData" VisibleIndex="19" Visible="false" ReadOnly="true">
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

                <dx:GridViewDataTextColumn FieldName="UserData" VisibleIndex="20" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Commentaires" VisibleIndex="21" Visible="false">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataComboBoxColumn FieldName="FINO" VisibleIndex="16">
                    <PropertiesComboBox AllowNull="False">
                        <Items>
                            <dx:ListEditItem Text="NON" Value="NON" />
                            <dx:ListEditItem Text="OUI" Value="OUI" />
                        </Items>
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn FieldName="Materiel" VisibleIndex="11">
                    <PropertiesComboBox AllowNull="False" DataSourceID="ds_material" TextField="MATERIAL" ValueField="MATERIAL">
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Name="Type" FieldName="Type" Caption="Type" VisibleIndex="22">
                    <PropertiesComboBox AllowNull="False">
                        <Items>
                            <dx:ListEditItem Text="AUTRES" Value="AUTRES" />
                            <dx:ListEditItem Text="VIS/ECROU/TUBE" Value="VIS/ECROU/TUBE" />

                        </Items>
                        <ClearButton Visibility="Auto">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataCheckColumn FieldName="Litige" VisibleIndex="23">
                    <PropertiesCheckEdit ValueChecked="True      " ValueType="System.String" ValueUnchecked="False     ">
                    </PropertiesCheckEdit>
                </dx:GridViewDataCheckColumn>

                <dx:GridViewDataComboBoxColumn FieldName="MOP" VisibleIndex="3">
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

                        <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormEditors" runat="server" />

                              <dx:ASPxFormLayout runat="server" ID="FormEdit" DataSourceID="DS_VBSPImage" OnInit="FormEdit_Init">
                            <Items>
                                <dx:LayoutGroup ColCount="2">
                                    <Items>
                                        <dx:LayoutItem Caption="Image1" FieldName="imgbi1" ColSpan="1" RowSpan="1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi1" EditingSettings-Enabled="true">
<EditingSettings Enabled="True"></EditingSettings>
                                                    </dx:ASPxBinaryImage>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Image2" FieldName="imgbi2" RowSpan="1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi2" EditingSettings-Enabled="true">
<EditingSettings Enabled="True"></EditingSettings>
                                                    </dx:ASPxBinaryImage>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Image3" FieldName="imgbi3" ColSpan="1" RowSpan="2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi3" EditingSettings-Enabled="true">
<EditingSettings Enabled="True"></EditingSettings>
                                                    </dx:ASPxBinaryImage>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Image4" FieldName="imgbi4" RowSpan="2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer>
                                                    <dx:ASPxBinaryImage runat="server" ID="txt_imgbi4" EditingSettings-Enabled="true">
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
                    <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormUpdateButton" runat="server" />
                    <dx:ASPxGridViewTemplateReplacement ReplacementType="EditFormCancelButton" runat="server" />
                </EditForm>
            </Templates>
        </dx:ASPxGridView>
    </div>


    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" ExportEmptyDetailGrid="True" GridViewID="Grid_Export" FileName="Export">
    </dx:ASPxGridViewExporter>

    <dx:ASPxGridView ID="Grid_Export" runat="server" DataSourceID="DS_VBSP" Visible="False" AutoGenerateColumns="False" KeyFieldName="IDPartNumber">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IDPartNumber" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PartNumber" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mass" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Lenght" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Width" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Height" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Surface" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Volume" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Materiel" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img1" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img2" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img3" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="img4" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FINO" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DatePicture" VisibleIndex="14">
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
            <dx:GridViewDataTextColumn FieldName="UserPicture" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DateData" VisibleIndex="16">
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
            <dx:GridViewDataTextColumn FieldName="UserData" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Commentaires" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Litige" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MOP" VisibleIndex="21">               

            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="DS_VBSP" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" OnInserting="SqlDataSource1_Inserting"
        DeleteCommand="DELETE FROM [VBSP_TB_Article] WHERE [IDPartNumber] = @original_IDPartNumber"
        InsertCommand="
        INSERT INTO 
        [VBSP_TB_Article] 
        ([PartNumber], 
        [MassZ], 
        [Lenght], [Width], [Height], [Surface], [Volume], [Materiel], [DateData], [UserData], [Commentaires], [Type], [Litige], [Mass],[FINO],[MOP]) 
        VALUES (@PartNumber, @MassZ, @Lenght, @Width, @Height, @Surface, @Volume, @Materiel, @DateData, @UserData, @Commentaires, @Type, @Litige, @Mass,@FINO,@MOP)"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT IDPartNumber, PartNumber, MassZ, Lenght, Width, Height, Surface, Volume, Materiel, FINO, DatePicture, UserPicture, DateData, UserData, Commentaires, Type, Litige, Mass, MOP,img1,img2,img3,img4 FROM VBSP_TB_Article"
        UpdateCommand="UPDATE 
        [VBSP_TB_Article] 
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
            <asp:Parameter Name="img1" Type="String" />
            <asp:Parameter Name="img2" Type="String" />
            <asp:Parameter Name="img3" Type="String" />
            <asp:Parameter Name="img4" Type="String" />
            <asp:Parameter Name="FINO" Type="String" />
           
            <asp:Parameter Name="imgbi2" DbType="Binary" />
            <asp:Parameter Name="imgbi3" DbType="Binary" />
            <asp:Parameter Name="imgbi4" DbType="Binary" />
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

    <asp:SqlDataSource ID="DS_VBSPImage" runat="server" ConflictDetection="OverwriteChanges"
       
        ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
       
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT IDPartNumber,
        imgbi1,imgbi2,imgbi3,imgbi4 
        FROM VBSP_TB_Article where IDPartNumber = @IDPartNumber">

        <SelectParameters>
            <asp:Parameter Name="IDPartNumber" Type="Int32" DefaultValue="1755" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_MOP" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [VBSP_TB_MOP] WHERE [ID_MOP] = @original_ID_MOP AND (([MOP] = @original_MOP) OR ([MOP] IS NULL AND @original_MOP IS NULL)) AND (([LIBELLE_MOP] = @original_LIBELLE_MOP) OR ([LIBELLE_MOP] IS NULL AND @original_LIBELLE_MOP IS NULL))" InsertCommand="INSERT INTO [VBSP_TB_MOP] ([MOP], [LIBELLE_MOP]) VALUES (@MOP, @LIBELLE_MOP)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [VBSP_TB_MOP]" UpdateCommand="UPDATE [VBSP_TB_MOP] SET [MOP] = @MOP, [LIBELLE_MOP] = @LIBELLE_MOP WHERE [ID_MOP] = @original_ID_MOP AND (([MOP] = @original_MOP) OR ([MOP] IS NULL AND @original_MOP IS NULL)) AND (([LIBELLE_MOP] = @original_LIBELLE_MOP) OR ([LIBELLE_MOP] IS NULL AND @original_LIBELLE_MOP IS NULL))">
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
