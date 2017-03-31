<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IndicateurDivision.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.IndicateurDivision" %>
<%@ Register Assembly="DevExpress.XtraCharts.v15.2.Web, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .div-table {
            display: table;
            width: 100%;
            table-layout: fixed;
            margin-top: 50px;
            border: 2px solid;
        }

        .div-row {
            display: table-row;
            border: 2px solid;
        }

        .div-div {
            display: table-cell;
            border:1px solid;
            text-align: center;
            border-bottom:2px solid;
            border-right: 1px solid;
            border-left: 1px solid;
        }

        .circle1 {
            float: right;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            line-height: 50px;
            text-align: center;
            background: green;
        }
    </style>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="div-table">
                                <div class="div-row">
                                    <div class="div-div">
                                        <div style="background-color:#022e5d">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="S32" Font-Size="X-Large" ForeColor="White"></dx:ASPxLabel>   
                                        </div>
                                                                             
                                        <dx:ASPxGaugeControl ID="gaugeS32" runat="server" Height="260px" Width="260px" 
                                BackColor="White" LayoutInterval="6" Value="22">
                                        <Gauges>
                                            <dx:CircularGauge Bounds="6, 6, 248, 248" Name="circularGauge1">
                                                <scales>
                                                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 9pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-13" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-9" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" RadiusX="98" RadiusY="98" StartAngle="-180" Value="22">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                                <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style16" Size="250, 179" ZOrder="1000" />
                                                </backgroundlayers>
                                                <needles>
                                                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="3" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                                                </needles>
                                                <spindlecaps>
                                                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="circularGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                                                </spindlecaps>
                           
                                            </dx:CircularGauge>
                                        </Gauges>
                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                    </dx:ASPxGaugeControl>
                                    </div>
                                    <div class="div-div">
                                        <div style="background-color:#022e5d">
                                             <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="S21" Font-Size="X-Large" ForeColor="White"></dx:ASPxLabel>  
                                        </div>
                                      
                                            <dx:ASPxGaugeControl ID="gaugeS21" runat="server" Height="260px" Width="260px" 
                                                                        BackColor="White" LayoutInterval="6" Value="22">
                                                                                <Gauges>
                                                                                    <dx:CircularGauge Bounds="6, 6, 248, 248" Name="circularGauge1">
                                                                                        <scales>
                                                                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 9pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-13" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-9" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" RadiusX="98" RadiusY="98" StartAngle="-180" Value="22">
                                                                                            </dx:ArcScaleComponent>
                                                                                        </scales>
                                                                                        <backgroundlayers>
                                                                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style16" Size="250, 179" ZOrder="1000" />
                                                                                        </backgroundlayers>
                                                                                        <needles>
                                                                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="3" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                                                                                        </needles>
                                                                                        <spindlecaps>
                                                                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="circularGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                                                                                        </spindlecaps>
                           
                                                                                    </dx:CircularGauge>
                                                                                </Gauges>
                                                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                                            </dx:ASPxGaugeControl>
                                    </div>
                                    </div>
                                <div class="div-row">
                                <div class="div-div">
                                    <div style="background-color:#022e5d">
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="S11" Font-Size="X-Large" ForeColor="White"></dx:ASPxLabel>  
                                    </div>
                                    
                                    <dx:ASPxGaugeControl ID="gaugeS11" runat="server" Height="260px" Width="260px" 
                            BackColor="White" LayoutInterval="6" Value="22">
                                    <Gauges>
                                        <dx:CircularGauge Bounds="6, 6, 248, 248" Name="circularGauge1">
                                            <scales>
                                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 9pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-13" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-9" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" RadiusX="98" RadiusY="98" StartAngle="-180" Value="22">
                                                </dx:ArcScaleComponent>
                                            </scales>
                                            <backgroundlayers>
                                                <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style16" Size="250, 179" ZOrder="1000" />
                                            </backgroundlayers>
                                            <needles>
                                                <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="3" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                                            </needles>
                                            <spindlecaps>
                                                <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="circularGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                                            </spindlecaps>
                           
                                        </dx:CircularGauge>
                                    </Gauges>
                                    <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                </dx:ASPxGaugeControl>
                                </div>
                                <div class="div-div">
                                    <div style="background-color:#022e5d">
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="S31" Font-Size="X-Large" ForeColor="White"></dx:ASPxLabel> 
                                    </div>
                                     
                                        <dx:ASPxGaugeControl ID="gaugeS31" runat="server" Height="260px" Width="260px" 
                                BackColor="White" LayoutInterval="6" Value="22">
                                        <Gauges>
                                            <dx:CircularGauge Bounds="6, 6, 248, 248" Name="circularGauge1">
                                                <scales>
                                                    <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 9pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-13" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-9" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" RadiusX="98" RadiusY="98" StartAngle="-180" Value="22">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                                <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style16" Size="250, 179" ZOrder="1000" />
                                                </backgroundlayers>
                                                <needles>
                                                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="3" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                                                </needles>
                                                <spindlecaps>
                                                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="circularGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                                                </spindlecaps>
                           
                                            </dx:CircularGauge>
                                        </Gauges>
                                        <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                    </dx:ASPxGaugeControl>
                                </div>
                                </div>
                 </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="timer" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
    <dx:ASPxTimer ID="timer" runat="server" Interval="5000" ontick="timer_Tick">
    </dx:ASPxTimer>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IndustrieMagasin_ConnectionString %>" SelectCommand="SELECT [Nb_Occupe], [Nb_Divisions] FROM [View_Rechange_DashMagAuto_TauxOccupation]"></asp:SqlDataSource>
    

</asp:Content>
