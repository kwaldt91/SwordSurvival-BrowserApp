<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewPlayer.aspx.cs" Inherits="SwordSurvival.ViewPlayer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function PrintPage()
            {
                var buttons = document.getElementById("<%=pnlBackButton.ClientID%>");

                buttons.style.visibility = "hidden";

                window.print();

                buttons.style.visibility = "visible";

            }

            var startSound = new Howl({
                src: ['Audio/hit.wav']
            });

            function PlayStart() {
                startSound.play();
            }
        </script>
    </telerik:RadCodeBlock>

    <asp:Panel ID="pnlViewPlayer" runat="server" CssClass ="ViewPlayerWrapper">

        <asp:Panel ID="MainNameHeader" runat="server" CssClass="HeaderWrapper">

            <asp:Image 
                ID="imgCrown1" 
                runat="server"                
                ImageUrl="~/Images/crown.jpg" 
                CssClass ="CrownImg"
                Visible="false" />

            <asp:Panel ID="pnlNameWrapper" runat="server" CssClass="NameWrapper">
                   
                <telerik:RadLabel 
                    ID="lblName" 
                    runat="server"                   
                    Font-Bold ="true">
                </telerik:RadLabel>

            </asp:Panel>

            <asp:Image 
                ID="imgCrown2" 
                runat="server"                
                ImageUrl="~/Images/crown.jpg" 
                CssClass="CrownImg"
                Visible="false"/>

        </asp:Panel>

        <asp:Panel ID="pnlPlayerImg" runat="server" CssClass="ViewPlayerImgWrapper">

            <asp:Image 
                ID="imgColumn1" 
                runat="server"                
                ImageUrl="~/Images/Column.jpg" 
                />

             <asp:Image 
                ID="imgBarbarian" 
                runat="server"  
                Visible="false" 
                ImageUrl="~/Images/barbarian.jpg" 
                CssClass="PlayerImage"/>

            <asp:Image 
                ID="imgKnight" 
                runat="server" 
                Visible="false" 
                ImageUrl="~/Images/knight.png" 
                CssClass="KnightImage"/>

            <asp:Image 
                ID="imgAssassin" 
                runat="server" 
                Visible="false" 
                ImageUrl="~/Images/assassin.jpg" 
                CssClass="PlayerImage"/>

            <asp:Image 
                ID="imgWitch" 
                runat="server" 
                Visible="false" 
                ImageUrl="~/Images/witch.png" 
                CssClass="PlayerImage"/>

            <asp:Image 
                ID="imgGuard" 
                runat="server" 
                Visible="false" 
                ImageUrl="~/Images/RoyalGuard.png" 
                CssClass="PlayerImage"/>

            <asp:Image 
                ID="imgColumn2" 
                runat="server"                
                ImageUrl="~/Images/Column.jpg" />

        </asp:Panel>

         <asp:Panel ID="StatsHeader" runat="server" CssClass="XPLVLwrapper">

            <asp:Panel ID="pnlClassWrapper" runat="server" CssClass="XPwrapper">

                <telerik:RadLabel 
                    ID="Classlbl" 
                    runat="server" 
                    Text="Class: " 
                    Font-Size="X-Large"
                    Font-Bold ="true">
                </telerik:RadLabel>
                &nbsp &nbsp
                <telerik:RadLabel 
                    ID="lblClass" 
                    runat="server" 
                    Font-Size="X-Large">
                </telerik:RadLabel>

            </asp:Panel>

             <asp:Panel ID="pnlMostersSlainWrapper" runat="server" CssClass="MonstersSlainWrapper">

                <telerik:RadLabel 
                    ID="monSlayLbl" 
                    runat="server" 
                    Text="Monsters Slain: " 
                    Font-Size="X-Large"
                    Font-Bold ="true">
                </telerik:RadLabel>
                &nbsp &nbsp
                <telerik:RadLabel 
                    ID="lblMonSlay" 
                    runat="server" 
                    Font-Size="X-Large">
                </telerik:RadLabel>

            </asp:Panel>


            <asp:Panel ID="pnlLVLwrapper" runat="server" CssClass="LVLwrapper">

                <telerik:RadLabel 
                    ID="LVLlbl" 
                    runat="server" 
                    Text="Level Reached: " 
                    Font-Size="X-Large"
                    Font-Bold ="true">
                </telerik:RadLabel>
                &nbsp &nbsp
                <telerik:RadLabel 
                    ID="lblLVL" 
                    runat="server" 
                    Font-Size="X-Large">
                </telerik:RadLabel>

            </asp:Panel>      

        </asp:Panel>
   
        <asp:Panel ID="pnlBackButton" runat="server" CssClass="BackButtonWrapper">

            <telerik:RadButton
                 ID="btnPrint" 
                 runat="server" 
                 Text="Print" 
                 Skin="Glow"
                 Font-Size ="X-Large"
                 OnClientClicked="PrintPage"
                 OnClientMouseOver="PlayStart">
                <Icon PrimaryIconCssClass="rbPrint" />
             </telerik:RadButton>
            &nbsp &nbsp
             <telerik:RadLinkButton
                 ID="btnBack" 
                 runat="server" 
                 Text="Back" 
                 Skin="Glow"
                 Font-Size ="X-Large"
                 OnClientMouseOver="PlayStart">
             </telerik:RadLinkButton>

            
        </asp:Panel>

    </asp:Panel>
   
</asp:Content>
