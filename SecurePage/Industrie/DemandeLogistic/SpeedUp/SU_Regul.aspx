<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SU_Regul.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.DemandeLogistic.SpeedUp.SU_Regul" %>
<%@ Register Assembly="DevExpress.XtraReports.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="ds_MVT" AutoGenerateColumns="False" KeyFieldName="ID_Mouvement" 
        OnRowInserted="ASPxGridView1_RowInserted" KeyboardSupport="True" OnRowDeleted="ASPxGridView1_RowDeleted" >
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" />
        <SettingsDataSecurity AllowDelete="true" AllowEdit="False" />
        <EditFormLayoutProperties ColCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="IDSPEEDUP" Name="IDSPEEDUP">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Date_Mouvement">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Statut">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Affectation">
                </dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Commentaire">
                </dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                </dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID_Mouvement" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date_Mouvement" VisibleIndex="3">
                <PropertiesDateEdit EditFormatString="dd/MM/yyyy HH:mm:ss" DisplayFormatString="dd/MM/yyyy HH:mm:ss">
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
            <dx:GridViewDataTextColumn FieldName="Commentaire" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Affectation" VisibleIndex="5">
                <PropertiesComboBox AllowNull="False">

                    <Items>
                        <dx:ListEditItem Text="Reception" Value="Reception" />
                        <dx:ListEditItem Text="Magasin" Value="Magasin" />
                        <dx:ListEditItem Text="Expe R7" Value="Expe R7" />
                        <dx:ListEditItem Text="Expe Florides" Value="Expe Florides" />
                        <dx:ListEditItem Text="Market Place" Value="Market Place" />
                        <dx:ListEditItem Text="Distribution" Value="Distribution" />
                        <dx:ListEditItem Text="Guichet MACS" Value="Guichet MACS" />
                        <dx:ListEditItem Text="Externe" Value="Externe" />
                        <dx:ListEditItem Text="LLP Control Tower" Value="LLP Control Tower" />
                        <dx:ListEditItem Text="Transporteur" Value="Transporteur" />
                        <dx:ListEditItem Text="Exclusion" Value="Exclusion" />
                    </Items>

                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Statut" VisibleIndex="4">
                <PropertiesComboBox AllowNull="False">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Remise Manuelle" Value="Remise Manuelle" />
                        <dx:ListEditItem Selected="True" Text="Exclusion" Value="Exclusion" />
                    </Items>
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="IDSPEEDUP" VisibleIndex="2" Name="txt_IDSPEEDUP">
                <PropertiesComboBox AllowNull="False"  DataSourceID="ds_IDPEEDUP" TextField="IDSPEEDUP" ValueField="IDSPEEDUP">
                    <ClearButton Visibility="Auto">
                    </ClearButton>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
      
        <Styles AdaptiveDetailButtonWidth="22"></Styles>


        


    </dx:ASPxGridView>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:SqlDataSource ID="ds_MVT" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [T_SpeedUp_Mouvement] WHERE [ID_Mouvement] = @original_ID_Mouvement AND (([Date_Mouvement] = @original_Date_Mouvement) OR ([Date_Mouvement] IS NULL AND @original_Date_Mouvement IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Affectation] = @original_Affectation) OR ([Affectation] IS NULL AND @original_Affectation IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([IDSPEEDUP] = @original_IDSPEEDUP) OR ([IDSPEEDUP] IS NULL AND @original_IDSPEEDUP IS NULL))" InsertCommand="INSERT INTO [T_SpeedUp_Mouvement] ([Date_Mouvement], [Statut], [Affectation], [Commentaire], [IDSPEEDUP]) VALUES (@Date_Mouvement, @Statut, @Affectation, @Commentaire, @IDSPEEDUP)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_SpeedUp_Mouvement]" UpdateCommand="UPDATE [T_SpeedUp_Mouvement] SET [Date_Mouvement] = @Date_Mouvement, [Statut] = @Statut, [Affectation] = @Affectation, [Commentaire] = @Commentaire, [IDSPEEDUP] = @IDSPEEDUP WHERE [ID_Mouvement] = @original_ID_Mouvement AND (([Date_Mouvement] = @original_Date_Mouvement) OR ([Date_Mouvement] IS NULL AND @original_Date_Mouvement IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Affectation] = @original_Affectation) OR ([Affectation] IS NULL AND @original_Affectation IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([IDSPEEDUP] = @original_IDSPEEDUP) OR ([IDSPEEDUP] IS NULL AND @original_IDSPEEDUP IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID_Mouvement" Type="Int32" />
            <asp:Parameter Name="original_Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Affectation" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_IDSPEEDUP" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Affectation" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="IDSPEEDUP" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="Statut" Type="String" />
            <asp:Parameter Name="Affectation" Type="String" />
            <asp:Parameter Name="Commentaire" Type="String" />
            <asp:Parameter Name="IDSPEEDUP" Type="Int32" />
            <asp:Parameter Name="original_ID_Mouvement" Type="Int32" />
            <asp:Parameter Name="original_Date_Mouvement" Type="DateTime" />
            <asp:Parameter Name="original_Statut" Type="String" />
            <asp:Parameter Name="original_Affectation" Type="String" />
            <asp:Parameter Name="original_Commentaire" Type="String" />
            <asp:Parameter Name="original_IDSPEEDUP" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_IDPEEDUP" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT DISTINCT [IDSPEEDUP] FROM [T_SpeedUp_Mouvement]" OnInserted="ds_IDPEEDUP_Inserted" OnUpdated="ds_IDPEEDUP_Updated">

    </asp:SqlDataSource>
</asp:Content>
