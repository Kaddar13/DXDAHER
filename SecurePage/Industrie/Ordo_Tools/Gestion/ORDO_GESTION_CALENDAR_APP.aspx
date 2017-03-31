<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ORDO_GESTION_CALENDAR_APP.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Industrie.Ordo_Tools.Gestion.ORDO_GESTION_CALENDAR_APP" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Xpo.v15.2, Version=15.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <telerik:RadSplitter RenderMode="Auto" runat="server" ID="RadSplitter1" Width="100%" Height="600px" Orientation="Horizontal">
        <telerik:RadPane runat="server" ID="PaneSearch" Scrolling="None" Height="22">
            <telerik:RadSlidingZone runat="server" Height="22">
                <telerik:RadSlidingPane runat="server" ID="serchpane" Title="Search">                        
                        <telerik:RadTextBox ID="txt_Appareil" runat="server" Label="Appareil" Text="%"></telerik:RadTextBox>
                        <telerik:RadTextBox ID="txt_PosteAppareil" runat="server" Label="Appareil Poste" Text="%"></telerik:RadTextBox>
                        <telerik:RadTextBox ID="txt_MagasinCedant" runat="server" Label="Magasin Cedant" Text="%"></telerik:RadTextBox>
                        <asp:Button ID="Button1" runat="server" Text="Actualiser" />
                </telerik:RadSlidingPane>
            </telerik:RadSlidingZone>
        </telerik:RadPane>

        <telerik:RadSplitBar runat="Server" ID="RadSplitBar2" />
        
        <telerik:RadPane runat="server" ID="TopPane">
            <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server"
            ClientIDMode="AutoID" Start="2016-06-30" Theme="Moderno"  AppointmentDataSourceID="SqlDataSource1">
            <Storage>
                <Appointments>
                    <Mappings End="End" Start="Start" AppointmentId="ID" Subject="Subject" />
                    <CustomFieldMappings>
                        <dxwschs:ASPxAppointmentCustomFieldMapping Member="Subject" Name="Subject" />
                    </CustomFieldMappings>
                </Appointments>
            </Storage>
            <Views>
                <DayView>
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>
                </DayView>

                <WorkWeekView>
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>
                </WorkWeekView>

                <WeekView Enabled="false"></WeekView>
                <FullWeekView Enabled="true">
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>
                </FullWeekView>
            </Views>

        </dxwschs:ASPxScheduler>
        </telerik:RadPane>

    </telerik:RadSplitter>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="SELECT
dbo.T_Ordo.Appareil,
Start,
[End], 
COUNT(dbo.T_Ordo_Appointments_DragAndDrop.AppointmentID) AS nb,
 
LTRIM(RTRIM(dbo.T_Ordo.Appareil)) + ' / ' + LTRIM(RTRIM(T_ordo.poste)) + ' / ' + LTRIM(RTRIM(T_ordo.[Type magasin cédant])) AS Subject
FROM         dbo.T_Ordo_Appointments_DragAndDrop INNER JOIN
                      dbo.T_Ordo ON dbo.T_Ordo_Appointments_DragAndDrop.AppointmentID = dbo.T_Ordo.AppointmentID INNER JOIN
                      dbo.T_Ordo_TypeOrdo ON dbo.T_Ordo.[Clé gare] = dbo.T_Ordo_TypeOrdo.Cle_Gare INNER JOIN
                      dbo.T_Ordo_PerimetreMagasin ON dbo.T_Ordo.[Type magasin cédant] = dbo.T_Ordo_PerimetreMagasin.Id_Magasin
 
GROUP BY T_ordo.Appareil, Start, [End], T_ordo.poste, T_ordo.[Type magasin cédant]
HAVING (Start IS NOT NULL) AND (dbo.T_Ordo.Appareil IS NOT NULL)"></asp:SqlDataSource>
</asp:Content>
