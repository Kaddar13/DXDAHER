<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_Gallery.aspx.cs" Inherits="DX_DAHERCMS.VBSP.VBSP_Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
 Gallery VBSP
    </div>
    
     <div style="float: left;">
 <dx:ASPxDataView ID="ASPxDataView1" runat="server" DataSourceID="SqlDataSource1" SettingsTableLayout-RowsPerPage="2" Width="850px" PagerAlign="Justify" ItemSpacing="25px" Theme="MetropolisBlue">
        <ItemTemplate>
            <table style="margin: 0 auto;">
                <tr>
                    <td colspan="2">
                        <%--<dx:ASPxImage ID="imgCover" runat="server" ImageUrl='<%# Eval("imgbi1") %>' Width="200px" Height="200px" ShowLoadingImage="true" />--%> 
                         <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("imgbi1") %>' Width="246" />
                    </td>
                </tr>
                 <tr>
                    <td><b>PartNumber:</b></td>
                    <td><dx:ASPxLabel ID="lblName" runat="server" Text='<%# Eval("PartNumber") %>' /></td>
                </tr>
                 <tr>
                    <td><b>Material:</b></td>
                    <td><dx:ASPxLabel ID="lblAddress" runat="server" Text='<%# Eval("Materiel") %>' /></td>
                </tr>
                 <tr>
                    <td><b>Volume:</b></td>
                    <%--<td><dx:ASPxLabel ID="lblPrice" runat="server" Text='<%# Eval("Volume") %>' /> mm3</td>--%>
                </tr>
                     <tr>
                    <td><b>Surface:</b></td>
                    <%--<td><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text='<%# Eval("Surface") %>' /> mm2</td>--%>
                </tr>
            </table>
        </ItemTemplate>
<SettingsTableLayout RowsPerPage="2" ColumnCount="4"></SettingsTableLayout>

        <PagerSettings ShowNumericButtons="true">
            <AllButton Visible="False" />
            <Summary Visible="false" />
            <PageSizeItemSettings Visible="true" ShowAllItem="true" />
        </PagerSettings>
    </dx:ASPxDataView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT * FROM [VBSP_TB_Article]">
        
    </asp:SqlDataSource>
   
</asp:Content>


