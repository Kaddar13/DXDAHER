<%@ Page Title="" Language="C#" MasterPageFile="~/PADS/PADS.Master" AutoEventWireup="true" CodeBehind="Rechange_SWITCH.aspx.cs" Inherits="DX_DAHERCMS.PADS.Report.Rechange.Rechange_SWITCH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function Switch() {
            var url = ['http://localhost:49999/PADS/Image/Distribution/Distribution.aspx', 'http://localhost:49999/PADS/Image/ContreReception/ContreReception.aspx'];
            var length = url.length;
            var d = Math.floor(Math.random() * length)
            window.setInterval(function () {
                changeUrl();
            }, 6000);

            function changeUrl() {
                //alert(url[d]);
                document.getElementById("iframeId").src = url[d];
            }
        }
    </script>
  



               <iframe id="iframeId" onload="Switch()" height="100%" width="100%"> </iframe>

 
 



</asp:Content>
