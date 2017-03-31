<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EASA_POKAYOKE.aspx.cs" Inherits="DX_DAHERCMS.ToolBox.EASA_POKAYOKE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
      
        function GetErrorText(editor) {
            
            if (txt1.GetText() !== txt2.GetText()) {
                var RedImage = '/img/RedLight.png';
                img1.SetImageUrl(RedImage);
                return "Les Valeurs ne correspondent pas !";
            }
            else {
                //ratingControl.SetValue(5);
                var GreenImage = '/img/GreenLight.png';
                img1.SetImageUrl(GreenImage);
              
            }
            
      
        }
        function ApplyPasswordRating(value) {
            ratingControl.SetValue(value);
            switch (value) {
                case 0:
                    ratingLabel.SetValue("Password safety");
                    break;
                case 1:
                    ratingLabel.SetValue("Too simple");
                    break;
                case 2:
                    ratingLabel.SetValue("Not safe");
                    break;
                case 3:
                    ratingLabel.SetValue("Normal");
                    break;
                case 4:
                    ratingLabel.SetValue("Safe");
                    break;
                case 5:
                    ratingLabel.SetValue("Very safe");
                    break;
                default:
                    ratingLabel.SetValue("Password safety");
            }
        }
        function OnPassValidation(s, e) {
            var errorText = GetErrorText(s);
            if (errorText) {
                e.isValid = false;
                e.errorText = errorText;
            }
        }
        function OnPasswordTextBoxInit(s, e) {
            ApplyCurrentPasswordRating();
        }
        function OnPassChanged(s, e) {
            ApplyCurrentPasswordRating();
        }
        function GetPasswordRating(password) {
            var result = 0;
            //if (password) {
            //    result++;
            //    if (password.length >= passwordMinLength) {
            //        if (/[a-z]/.test(password))
            //            result++;
            //        if (/[A-Z]/.test(password))
            //            result++;
            //        if (/\d/.test(password))
            //            result++;
            //        if (!(/^[a-z0-9]+$/i.test(password)))
            //            result++;
            //    }
            //}
            return result;
        }
        function ApplyCurrentPasswordRating() {
            var password = txt1.GetText();
            var passwordRating = GetPasswordRating(password);
            ApplyPasswordRating(passwordRating);
        }
        function DoProcessEnterKey(htmlEvent, editName) {
            if (htmlEvent.keyCode == 13) {
                ASPxClientUtils.PreventEventAndBubble(htmlEvent);
                if (editName) {
                    ASPxClientControl.GetControlCollection().GetByName(editName).SetFocus();
                } else {
                    btn.DoClick();
                }
            }
        }
        function Click(s, e) {
            ASPxClientControl.GetControlCollection().GetByName('txt1').SetFocus();

        }
        function Clear(s, e) {
            txt1.SetText = '';
            txt2.SetText = '';
        }
    </script>

    <div style="height: 3px; margin-left: 250px; margin-top: 50px">
        <div>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Poka Yoke" Font-Size="X-Large"></dx:ASPxLabel>
            <asp:Panel runat="server">
                <dx:ASPxTextBox ID="txt1" runat="server" ClientInstanceName="txt1" Password="false" Width="600" Font-Size="XX-Large">
                    <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text" Display="Dynamic" SetFocusOnError="true">
                        <RequiredField IsRequired="True" ErrorText="The value is required" />
                    </ValidationSettings>
                    <ClientSideEvents 
                        Init="OnPasswordTextBoxInit" 
                        KeyUp=""
                        Validation="" 
                        KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, 'txt2'); }" />
                </dx:ASPxTextBox>

            </asp:Panel>


            <asp:Panel runat="server">
                <dx:ASPxTextBox ID="txt2" runat="server" ClientInstanceName="txt2" Password="false" Width="600" Font-Size="XX-Large">
                    <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="Text" Display="Dynamic" SetFocusOnError="true">
                        <RequiredField IsRequired="True" ErrorText="The value is required" />
                    </ValidationSettings>
                    <ClientSideEvents 
                        Validation="OnPassValidation" 
                        KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent, ''); }" />
                </dx:ASPxTextBox>

            </asp:Panel>
            <div style="margin-left: auto; margin-top: 20px">
                <dx:ASPxButton runat="server" ID="signUp" Text="Sign Up" Width="100px" ClientInstanceName="btn" AutoPostBack="false" ClientSideEvents-Click="Click" ClientVisible="false"/>

                <dx:ASPxRatingControl ID="ratingControl" runat="server" ReadOnly="true" ItemCount="5" Value="0" ClientInstanceName="ratingControl" ClientVisible="false"/>

                <dx:ASPxLabel ID="ratingLabel" runat="server" ClientInstanceName="ratingLabel" Text="Password safety" ClientVisible="false" />

                <dx:ASPxImage ID="ASPxImage1" runat="server" ShowLoadingImage="true" ClientInstanceName="img1"></dx:ASPxImage>
            </div>


        </div>


    </div>
</asp:Content>
