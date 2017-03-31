<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VBSP_ImportImage.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.VBSP.VBSP_ImportImage" %>

<%@ Register Assembly="DevExpress.Xpo.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="EntityDataSource1" AutoGenerateColumns="False">
        <Settings ShowFilterRow="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataBinaryImageColumn FieldName="imgbi1" VisibleIndex="1">
                <PropertiesBinaryImage>
                    <EditingSettings Enabled="True">
                    </EditingSettings>
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>
            <dx:GridViewDataBinaryImageColumn FieldName="imgbi2" VisibleIndex="2">
                <PropertiesBinaryImage>
                    <EditingSettings Enabled="True">
                    </EditingSettings>
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>
            <dx:GridViewDataBinaryImageColumn FieldName="imgbi3" VisibleIndex="3">
                <PropertiesBinaryImage>
                    <EditingSettings Enabled="True">
                    </EditingSettings>
                </PropertiesBinaryImage>
            </dx:GridViewDataBinaryImageColumn>
        </Columns>
<Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>
   <ef:EntityDataSource id="EntityDataSource1" runat="server"
        ConnectionString="name=DashboardEntities"
        DefaultContainerName="DashboardEntities" EnableFlattening="False" 
        EntitySetName="VBSP_TB_Article" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</ef:EntityDataSource>
    </asp:Content>
