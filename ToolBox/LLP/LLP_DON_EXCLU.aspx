<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LLP_DON_EXCLU.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.LLP_DON_EXCLU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script runat="server">
        protected void Export(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse(new DevExpress.XtraPrinting.XlsExportOptionsEx() { ExportType = DevExpress.Export.ExportType.WYSIWYG });
        }


    </script>
    <div>
        Exclusions for KPI 10. 
        <div>
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Export" OnClick="Export"></dx:ASPxButton>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="AspxGridView1"></dx:ASPxGridViewExporter>
        </div>
        
    </div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Transport">
        <SettingsPager PageSize="20">
        </SettingsPager>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Transport" ReadOnly="false" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
</dx:ASPxGridView>

    


<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:IndustrieMagasin_ConnectionString %>" DeleteCommand="DELETE FROM [Don_exclu_KPI10] WHERE [Transport] = @original_Transport AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))" InsertCommand="INSERT INTO [Don_exclu_KPI10] ([Transport], [Comments]) VALUES (@Transport, @Comments)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Don_exclu_KPI10]" UpdateCommand="UPDATE [Don_exclu_KPI10] SET [Comments] = @Comments WHERE [Transport] = @original_Transport AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Transport" Type="String" />
        <asp:Parameter Name="original_Comments" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Transport" Type="String" />
        <asp:Parameter Name="Comments" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Comments" Type="String" />
        <asp:Parameter Name="original_Transport" Type="String" />
        <asp:Parameter Name="original_Comments" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
