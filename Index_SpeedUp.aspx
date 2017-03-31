<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index_SpeedUp.aspx.cs" Inherits="DX_DAHERCMS.Index_SpeedUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.kutu').hover(function () {
            //$(this).css("border", "5px solid #FFFF00");
            //$(this).css("margin", "1px 3px 1px 3px");
            $(this).css("cursor", "pointer");
            $(this).find(".metin").stop().animate({ top: "-110px" }, 300);
        });
        $('.kutu').mouseleave(function () {
            $(this).css("border", "1px solid #FFFFFF");
            //$(this).css("margin", "5px 7px 5px 7px");
            $(this).find(".metin").stop().animate({ top: "-48px" }, 300);
        });
        $('.numeros span').each(function () {
            var item = $(this);
            if (item.text().trim() === "") {
                item.parents('.numeros:first').css("display", "none");
            }
        });
    });
    function popitup(url) {
        newwindow = window.open(url, 'name', 'height=800,width=800,directories=no,toolbar=no,menubar=no,location=no,statusbar=no');
        if (window.focus) { newwindow.focus() }
        return false;
    }
    function divselect() {

        document.getElementById('Div1').style.display = 'inline-block';
    }


</script>
<head runat="server">
    <link rel="stylesheet" href="metro_speedup.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div style="background-color: #022e5d; color: #fff; padding-bottom: 20px; border-bottom: 4px solid red; height: 63px;">
            <div style="float: left;">
                <div style="margin-bottom: 5px">
                    <img src="/img/Logo_Daher_white.png" />
                </div>
            </div>
        </div>

        <div>
              <div class="kutu" onclick="divselect()">
                <div>                  
                    <img  src="img/speedup.png" onclick="return popitup('ToolBox/SPEEDUP/SU_NEW.aspx')" />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Creation d'une demande Logistique.</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">Speed Up , Guichet</div>
                </div>
            </div>
        </div>
        <div id="Div1" style="display:none;margin-top:60px">
        <%--SpeedUp--%>
            <div>
<div class="cerceve" >
            <div class="kutu">
                <div>                  
                    <img  src="img/speedup.png" onclick="return popitup('ToolBox/SPEEDUP/SU_NEW.aspx')" />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Creation d'une SpeedUp</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">Accéleration etc etc ...</div>
                </div>
            </div>
            <div class="kutu">
                <div>                  
                    <img  src="img/speedup.png" onclick="return popitup('ToolBox/SPEEDUP/SU_NEW.aspx')"/>
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Kit de communication</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">Kit de communication</div>
                </div>
            </div>
              <div class="kutu">
                <div>                  
                    <img  src="img/speedup.png" onclick="return popitup('ToolBox/SPEEDUP/SU_NEW.aspx')"/>
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Kit Utilisateur</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">Kit Utilisateur</div>
                </div>
            </div>
        </div>
            </div>
        

        <%--Guichet--%>
            <div>
<div class="cerceve" >
            <div class="kutu">
                <div>                  
                    <img  src="img/speedup.png" onclick="return popitup('ToolBox/SPEEDUP/GUICHET_NEW.aspx')" />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Creation Demande Guichet</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">Reservation Guichet</div>
                </div>
            </div>
          
             
            </div>
            </div>
         
        </div>
    </form>
</body>
</html>
