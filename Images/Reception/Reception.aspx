﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PADS/PADS.Master" AutoEventWireup="true" CodeBehind="Reception.aspx.cs" Inherits="DX_DAHERCMS.PADS.Image.Reception.Reception" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div style="margin-left:auto;margin-right:auto;width:50%">
                <dx:ASPxImageSlider ID="ASPxImageSlider2" runat="server" ClientInstanceName="ImageSlider" ImageSourceFolder="~/PADS/Image/Reception/"
                        EnableViewState="False" EnableTheming="False" ShowNavigationBar="False" BackColor="White" >
                        <SettingsImageArea ImageSizeMode="FitProportional" NavigationButtonVisibility="None"
                            ItemTextVisibility="Always" EnableLoopNavigation="true" />
                        <SettingsNavigationBar Mode="Dots" ItemSpacing="1px" ThumbnailsModeNavigationButtonVisibility="None" />
                        <SettingsSlideShow AutoPlay="true" StopPlayingWhenPaging="false" PausePlayingWhenMouseOver="false" PlayPauseButtonVisibility="Faded" Interval="5000"></SettingsSlideShow>

                            <Styles>
                                <ImageArea BackColor="White">
                                </ImageArea>
                                <Disabled BackColor="White">
                                </Disabled>
                            </Styles>

                    </dx:ASPxImageSlider>
            </div>
      
  
</asp:Content>

