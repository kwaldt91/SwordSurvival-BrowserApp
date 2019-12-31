<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TitlePage.aspx.cs" Inherits="SwordSurvival.TitlePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script>
            var intro = new Howl({
                src: ['Audio/Defeat.wav'],
                loop: true
            }).play();

            var startSound = new Howl({
                src: ['Audio/hit.wav']
            });

            function PlayStart()
            {
                startSound.play();
            }

            function GoToClassPage()
            {
                window.location = "ClassSelection.aspx";
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

     <telerik:RadAjaxManager ID="RadAjaxManagerTitle" runat="server" >
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnStart">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="MessagePopUp" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div class="StartPageWrapper">
        <telerik:RadWindowManager ID="MessagePopUp" runat="server" Skin="Glow" AutoSize="True">
        
        </telerik:RadWindowManager>

        <label class="GameTitle">Sword Survival</label>
     
        <telerik:RadButton 
            ID="btnStart" 
            runat="server"
            CssClass="StartButton" 
            Text="Start"          
            Skin="Glow" 
            Width="175px"
            Height="75px"
            Font-Size="XX-Large" 
            BorderStyle="Groove"            
            OnClientMouseOver ="PlayStart" 
            OnClick="btnStart_Click">
        </telerik:RadButton>

    </div>

</asp:Content>
