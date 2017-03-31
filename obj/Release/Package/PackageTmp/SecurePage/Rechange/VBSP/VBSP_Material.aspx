<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_Material.aspx.cs" Inherits="DX_DAHERCMS.VBSP.VBSP_Material" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:SqlDataSource ID="ds_material" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT * FROM [VBSP_TB_material]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [VBSP_TB_material] WHERE [ID_MATERIAL] = @original_ID_MATERIAL AND (([MATERIAL] = @original_MATERIAL) OR ([MATERIAL] IS NULL AND @original_MATERIAL IS NULL))" InsertCommand="INSERT INTO [VBSP_TB_material] ([MATERIAL]) VALUES (@MATERIAL)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [VBSP_TB_material] SET [MATERIAL] = @MATERIAL WHERE [ID_MATERIAL] = @original_ID_MATERIAL AND (([MATERIAL] = @original_MATERIAL) OR ([MATERIAL] IS NULL AND @original_MATERIAL IS NULL))">
           <DeleteParameters>
               <asp:Parameter Name="original_ID_MATERIAL" Type="Int32" />
               <asp:Parameter Name="original_MATERIAL" Type="String" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="MATERIAL" Type="String" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="MATERIAL" Type="String" />
               <asp:Parameter Name="original_ID_MATERIAL" Type="Int32" />
               <asp:Parameter Name="original_MATERIAL" Type="String" />
           </UpdateParameters>

    </asp:SqlDataSource>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds_material" KeyFieldName="ID_MATERIAL">
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID_MATERIAL" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MATERIAL" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
</dx:ASPxGridView>
</asp:Content>
