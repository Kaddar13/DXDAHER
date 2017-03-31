<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VBSP_Popup_DON.aspx.cs" Inherits="DX_DAHERCMS.SecurePage.Rechange.VBSP.VBSP_Popup_DON" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <telerik:RadImageGallery ID="RadImageGallery1" runat="server" Culture="fr-FR" DataImageField="img" DataSourceID="SqlDataSource1">
        <ImageAreaSettings ShowDescriptionBox="False" />
        <ToolbarSettings ShowFullScreenButton="False" ShowSlideshowButton="False" />
<ClientSettings>
<KeyboardNavigationSettings><Shortcuts>
<telerik:ImageGalleryShortcut Command="Focus" Key="Y" Modifiers="Ctrl" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="Prev" Key="LeftArrow" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="Next" Key="RightArrow" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="Up" Key="UpArrow" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="Down" Key="DownArrow" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="MoveToFirst" Key="Home" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="MoveToLast" Key="End" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="PrevView" Key="LeftArrow" Modifiers="Alt" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="NextView" Key="RightArrow" Modifiers="Alt" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="PrevView" Key="UpArrow" Modifiers="Alt" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="NextView" Key="DownArrow" Modifiers="Alt" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="Select" Key="Enter" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="Close" Key="Escape" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="ToggleSlideshow" Key="Space" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="ToggleFullScreen" Key="F" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="ToggleThumbnails" Key="T" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="PrevPage" Key="PageDown" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
<telerik:ImageGalleryShortcut Command="NextPage" Key="PageUp" Modifiers="None" Enabled="True"></telerik:ImageGalleryShortcut>
</Shortcuts>
</KeyboardNavigationSettings>
</ClientSettings>
    </telerik:RadImageGallery>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dashboard_ConnectionString %>" SelectCommand="Select *
From (Select IDPartNumber, IIF(imgbi1 is null , '',imgbi1) as img
From VBSP_TB_ArticleDON 
UNION ALL
Select IDPartNumber, imgbi2
From VBSP_TB_ArticleDON
UNION ALL
Select IDPartNumber, imgbi3
From VBSP_TB_ArticleDON
UNION ALL
Select IDPartNumber,imgbi4
From VBSP_TB_ArticleDON) t
WHERE IDPartNumber = @ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" />
        </SelectParameters>

    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
