<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SU_Admin_Mvt.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Admin.Industrie.DemandeLogistic.SpeedUp.SU_Admin_Mvt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID_Mouvement">
        <Settings ShowFilterRow="True" />
        <SettingsBehavior ConfirmDelete="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ID_Mouvement" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date_Mouvement" VisibleIndex="2">
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
            <dx:GridViewDataTextColumn FieldName="Statut" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Affectation" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Commentaire" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IDSPEEDUP" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowCancelButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButton="True" ShowUpdateButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" DeleteCommand="DELETE FROM [T_SpeedUp_Mouvement] WHERE [ID_Mouvement] = @original_ID_Mouvement AND (([Date_Mouvement] = @original_Date_Mouvement) OR ([Date_Mouvement] IS NULL AND @original_Date_Mouvement IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Affectation] = @original_Affectation) OR ([Affectation] IS NULL AND @original_Affectation IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([IDSPEEDUP] = @original_IDSPEEDUP) OR ([IDSPEEDUP] IS NULL AND @original_IDSPEEDUP IS NULL))" InsertCommand="INSERT INTO [T_SpeedUp_Mouvement] ([Date_Mouvement], [Statut], [Affectation], [Commentaire], [IDSPEEDUP]) VALUES (@Date_Mouvement, @Statut, @Affectation, @Commentaire, @IDSPEEDUP)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_SpeedUp_Mouvement]" UpdateCommand="UPDATE [T_SpeedUp_Mouvement] SET [Date_Mouvement] = @Date_Mouvement, [Statut] = @Statut, [Affectation] = @Affectation, [Commentaire] = @Commentaire, [IDSPEEDUP] = @IDSPEEDUP WHERE [ID_Mouvement] = @original_ID_Mouvement AND (([Date_Mouvement] = @original_Date_Mouvement) OR ([Date_Mouvement] IS NULL AND @original_Date_Mouvement IS NULL)) AND (([Statut] = @original_Statut) OR ([Statut] IS NULL AND @original_Statut IS NULL)) AND (([Affectation] = @original_Affectation) OR ([Affectation] IS NULL AND @original_Affectation IS NULL)) AND (([Commentaire] = @original_Commentaire) OR ([Commentaire] IS NULL AND @original_Commentaire IS NULL)) AND (([IDSPEEDUP] = @original_IDSPEEDUP) OR ([IDSPEEDUP] IS NULL AND @original_IDSPEEDUP IS NULL))">
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
</asp:Content>
