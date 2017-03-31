<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SU_CONSULTATION.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.SPEEDUP.SU_CONSULTATION" %>

<%@ Register Assembly="DevExpress.XtraCharts.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>

        window.onload = setId;


        function addUrlParam(url, key, value) {
            var newParam = key + "=" + value;
            var result = url.replace(new RegExp("(&|\\?)" + key + "=[^\&|#]*"), '$1' + newParam);
            if (result === url) {
                result = (url.indexOf("?") != -1 ? url.split("?")[0] + "?" + newParam + "&" + url.split("?")[1]
                   : (url.indexOf("#") != -1 ? url.split("#")[0] + "?" + newParam + "#" + url.split("#")[1]
                      : url + '?' + newParam));
            }
            return result;
        }


        function GotoQuery() {

            var url = "http://localhost:49999/ToolBox/SPEEDUP/SU_CONSULTATION.aspx";
            var idspeedup = IDSPEEDUP.GetText()
            window.location = addUrlParam(url, "IDSPEEDUP", idspeedup);
            

        }

        function setId() {
            var idspeedup = IDSPEEDUP.GetText()
            IDSPEEDUP.SetText = idspeedup;

        }

    </script>

    <div style="margin-left:50px">

        <dx:ASPxLabel ID="Titre" runat="server"   Text="SpeedUp : Consulation publique" Theme="MetropolisBlue"></dx:ASPxLabel>

    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Theme="MetropolisBlue" ColCount="2">
        <Items>
            <dx:LayoutItem Caption="Num de SpeedUp :">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" >
                        <dx:ASPxTextBox ID="txt_IDSPEEDUP" ClientInstanceName="IDSPEEDUP" runat="server" Width="170px"  Theme="Moderno" />
                    </dx:LayoutItemNestedControlContainer>

                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>

                    <dx:LayoutItemNestedControlContainer runat="server">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Rechercher" Theme="MetropolisBlue" ClientSideEvents-Click="GotoQuery" AutoPostBack="False" />
                    </dx:LayoutItemNestedControlContainer>

                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>




    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" Theme="Moderno" AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataDateColumn FieldName="DateMouvement" ReadOnly="True" VisibleIndex="0">
                 <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
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
            <dx:GridViewDataTextColumn FieldName="Statut" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Gare de destination" Caption="Affectation" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LC"  ReadOnly="True" VisibleIndex="3" Caption="Liste de Colisage">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IDSPEEDUP" ReadOnly="True" VisibleIndex="4" Caption="Id SpeedUp">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles AdaptiveDetailButtonWidth="22"></Styles>
    </dx:ASPxGridView>




    </div>






    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="Use Dashboard
SELECT * 
FROM(
SELECT [Date création] As DateMouvement,'Creation LC' as Statut,[Gare de destination],LC,'ID' as IDSPEEDUP
FROM T_SPEEDUP_OD2_LC
UNION
SELECT [Date clôture],'Cloture LC' ,LC  ,[Gare de destination],'ID'
FROM T_SPEEDUP_OD2_LC
UNION
SELECT [Date de 1ère prise],'Prise LC',[Gare de destination],Référenceélémentdistribué,[Autre identifiant]
FROM T_SPEEDUP_OD2
UNION
SELECT [Date de remise],'Remise LC',[Gare de destination],Référenceélémentdistribué,[Autre identifiant]
FROM T_SPEEDUP_OD2

UNION

SELECT 
      [Date_Mouvement]
      ,[T_SpeedUp_Mouvement].[Statut]
      ,[Affectation]
      ,''
      ,CAST([IDSPEEDUP] as VARCHAR(10)) 
  FROM [Dashboard].[dbo].[T_SpeedUp_Mouvement]
  ) as t
 WHERE t.IDSPEEDUP LIKE @IDSPEEDUP AND Statut is Not null and DateMouvement <> '1900-01-01 00:00:00.000'

  ">

        <SelectParameters>
            <asp:QueryStringParameter Name="IDSPEEDUP" Direction="Input" QueryStringField="IDSPEEDUP" ConvertEmptyStringToNull="True" DefaultValue="%" />

        </SelectParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Mouvement" runat="server"
        ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_SpeedUp_Mouvement]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_SPEEDUP" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>"
        SelectCommand="SELECT * FROM [T_SPEEDUP]"></asp:SqlDataSource>

</asp:Content>


