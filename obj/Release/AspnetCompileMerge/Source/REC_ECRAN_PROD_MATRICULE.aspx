<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="REC_ECRAN_PROD_MATRICULE.aspx.cs" Inherits="DX_DAHERCMS.REC_ECRAN_MATRICULE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div style="height:50px" >
    </div>
        <div>
        <dx:ASPxLabel runat="server" Text="Table des matricules"></dx:ASPxLabel> 
    </div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="XA_ID">
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="XA_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="XA_MATRICULE" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="XA_NOM_PRENOM" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConLocal %>" DeleteCommand="DELETE FROM [T_MACS_MATRICULE] WHERE [XA_ID] = @original_XA_ID AND [XA_MATRICULE] = @original_XA_MATRICULE AND [XA_NOM_PRENOM] = @original_XA_NOM_PRENOM" InsertCommand="INSERT INTO [T_MACS_MATRICULE] ([XA_MATRICULE], [XA_NOM_PRENOM]) VALUES (@XA_MATRICULE, @XA_NOM_PRENOM)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [T_MACS_MATRICULE]" UpdateCommand="UPDATE [T_MACS_MATRICULE] SET [XA_MATRICULE] = @XA_MATRICULE, [XA_NOM_PRENOM] = @XA_NOM_PRENOM WHERE [XA_ID] = @original_XA_ID AND [XA_MATRICULE] = @original_XA_MATRICULE AND [XA_NOM_PRENOM] = @original_XA_NOM_PRENOM">
        <DeleteParameters>
            <asp:Parameter Name="original_XA_ID" Type="Int32" />
            <asp:Parameter Name="original_XA_MATRICULE" Type="String" />
            <asp:Parameter Name="original_XA_NOM_PRENOM" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="XA_MATRICULE" Type="String" />
            <asp:Parameter Name="XA_NOM_PRENOM" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="XA_MATRICULE" Type="String" />
            <asp:Parameter Name="XA_NOM_PRENOM" Type="String" />
            <asp:Parameter Name="original_XA_ID" Type="Int32" />
            <asp:Parameter Name="original_XA_MATRICULE" Type="String" />
            <asp:Parameter Name="original_XA_NOM_PRENOM" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
