<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DX_DAHERCMS.Default1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


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
        newwindow = window.open(url, 'name', 'directories=yes,toolbar=yes,menubar=yes,location=yes,statusbar=yes');
        if (window.focus) { newwindow.focus() }
        return false;
    }
    function divselect() {

        document.getElementById('Div1').style.display = 'inline-block';
    }


</script>
<link rel="stylesheet" href="metro_speedup.css"/>



        <div>
            <%--EasyVista--%>
              <div class="kutu" onclick="return popitup('https://daher.easyvista.com/')" >
                <div>                  
                    <img  src="img/Tiles/easyvista.png"  />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">@Service</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">EasyVista : Creation des demandes informatiques Daher</div>
                </div>
            </div>
            <%--Maintenance--%>
            <div class="kutu" onclick="return popitup('https://maintenance-marlog.daher.com/')">
                <div>                  
                    <img  src="img/tiles/gmao.png"  />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Maintenance</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">Maintenance : Ouverture de tickets de maintenance.</div>
                </div>
            </div>
            <%--TalentSoft--%>
             <div class="kutu" onclick="return popitup('https://daher.talent-soft.com/')" >
                <div>                  
                    <img  src="img/Tiles/talentsoft.png" />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">TalentSoft</div>
                    <div class="numeros"><span></span></div>
                    <div class="description"></div>
                </div>
            </div>
            <%--Gap--%>
             <div class="kutu" onclick="return popitup('https://marlog.daher.com/')">
                <div>                  
                    <img  src="img/tiles/marlog.png"  />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Marlog</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">GAP : Gestion administrative du personnel</div>
                </div>
            </div>
            <%--Notilus--%>
            <div class="kutu" onclick="return popitup('https://s42.mynotilus.com/daher')">
                <div>                  
                    <img  src="img/Tiles/notilus.png"  />
                </div>
                <div class="metin">
                    <div class="titreTuilefond"></div>
                    <div class="titreTuile">Notilus</div>
                    <div class="numeros"><span></span></div>
                    <div class="description">Gestion des notes de frais</div>
                </div>
            </div>
        </div>
        

</asp:Content>