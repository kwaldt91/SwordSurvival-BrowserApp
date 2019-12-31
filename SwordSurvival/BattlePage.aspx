<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BattlePage.aspx.cs" Inherits="SwordSurvival.BattlePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <script type="text/javascript">

            var song1 = new Howl({
                src: ['Audio/BattleSong.wav'],
                loop: true
            });

            var song2 = new Howl({
                src: ['Audio/BattleSong2.wav'],
                loop: true
            });

            var lvlUpSong = new Howl({
                src: ['Audio/LevelUp.wav'],
                loop: true
            });

            var victorySong = new Howl({
                src: ['Audio/Victory.wav'],
                loop: true
            });

            var defeatSong = new Howl({
                src: ['Audio/Defeat.wav'],
                loop: true
            });

            var healSound = new Howl({
                src: ['Audio/heal.wav']
            });

            var zapSound = new Howl({
                src: ['Audio/zap.wav']
            });

            var nopeSound = new Howl({
                src: ['Audio/nope.wav']
            });

            var hitSound = new Howl({
                src: ['Audio/hit2.wav']
            });

            var enemyHitSound = new Howl({
                src: ['Audio/hit3.wav']
            });

            var songCounter = 0;
            
            PlayBattleSong();
            
            function PlayBattleSong()
            {
                song1.stop();
                song2.stop();
                lvlUpSong.stop();
                victorySong.stop();
                                           
                if(songCounter % 2 == 0)
                {               
                    song1.play();
                }
                else
                {
                    song2.play();
                }

                songCounter++;
            }

            function PlayLvlUpSong()
            {
                song1.stop();
                song2.stop();
                victorySong.stop();

                lvlUpSong.play();
            }

            function PlayVictorySong()
            {
                song1.stop();
                song2.stop();
                lvlUpSong.stop();

                victorySong.play();
            }

            function PlayDefeatSong()
            {
                song1.stop();
                song2.stop();
                lvlUpSong.stop();
                victorySong.stop();

                defeatSong.play();
            }

            function PlayHeal()
            {
                healSound.play();
            }

            function PlayZap()
            {
                zapSound.play();
            }

            function PlayNope()
            {
                nopeSound.play();
            }

            function PlayHit()
            {
                hitSound.play();
            }

            function PlayEnemyHit()
            {
                enemyHitSound.play();
            }
        
            function AddAnimation()
            {
                var enemy = document.getElementById(<%=pnlEnemyImages.ClientID%>);
                enemy.classList.add("");
            }

            function EmptyFunction()
            {

            }

        </script>
    </telerik:RadCodeBlock>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnAttack">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblEnemyName" />
                    <telerik:AjaxUpdatedControl ControlID="lblBattleLog" />
                    <telerik:AjaxUpdatedControl ControlID="btnEnemyAttack" />
                    <telerik:AjaxUpdatedControl ControlID="lblEnemyHealth" />
                    <telerik:AjaxUpdatedControl ControlID="pnlEnemyImages" />
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerImages" />
                    <telerik:AjaxUpdatedControl ControlID="btnAttack" UpdatePanelRenderMode="Inline"/>
                    <telerik:AjaxUpdatedControl ControlID="btnHeal" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="btnRun" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnEnemyAttack">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblBattleLog" />
                    <telerik:AjaxUpdatedControl ControlID="lblPlayerHealth" />
                    <telerik:AjaxUpdatedControl ControlID="btnEnemyAttack" />
                    <telerik:AjaxUpdatedControl ControlID="btnContinue" />
                    <telerik:AjaxUpdatedControl ControlID="btnResetEnemy" />
                    <telerik:AjaxUpdatedControl ControlID="lblXPLog" />
                    <telerik:AjaxUpdatedControl ControlID="lblXP" UpdatePanelRenderMode="Inline"/>
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerImages" />
                    <telerik:AjaxUpdatedControl ControlID="pnlEnemyImages" />
                    <telerik:AjaxUpdatedControl ControlID="imgDeadEnemy" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID ="btnContinue">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblBattleLog" />
                    <telerik:AjaxUpdatedControl ControlID="lblXPLog" />
                    <telerik:AjaxUpdatedControl ControlID="btnContinue" />
                    <telerik:AjaxUpdatedControl ControlID="btnResetEnemy" />
                    <telerik:AjaxUpdatedControl ControlID="btnAttack" UpdatePanelRenderMode="Inline"/>
                    <telerik:AjaxUpdatedControl ControlID="btnHeal" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="btnRun" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerImages" />
                    <telerik:AjaxUpdatedControl ControlID="imgDeadPlayer" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID ="btnResetEnemy">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="btnResetEnemy" />
                    <telerik:AjaxUpdatedControl ControlID="lblEnemyName" />
                    <telerik:AjaxUpdatedControl ControlID="lblBattleLog" />
                    <telerik:AjaxUpdatedControl ControlID="lblXPLog" />
                    <telerik:AjaxUpdatedControl ControlID="btnAttack" UpdatePanelRenderMode="Inline"/>
                    <telerik:AjaxUpdatedControl ControlID="btnHeal" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="btnRun" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="lblEnemyHealth" />
                    <telerik:AjaxUpdatedControl ControlID="lblEnemyAttack" />
                    <telerik:AjaxUpdatedControl ControlID="lblXP" />
                    <telerik:AjaxUpdatedControl ControlID="lblLVL" />
                    <telerik:AjaxUpdatedControl ControlID="lblPlayerHealth" />
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerMP" />
                    <telerik:AjaxUpdatedControl ControlID="lblPlayerAttack" />
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerMagic" />
                    <telerik:AjaxUpdatedControl ControlID="pnlEnemyImages" />
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerImages" />
                    <telerik:AjaxUpdatedControl ControlID="imgDeadEnemy" />
                    <telerik:AjaxUpdatedControl ControlID="imgRun" />           
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnHeal">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblEnemyName" />
                    <telerik:AjaxUpdatedControl ControlID="lblBattleLog" />
                    <telerik:AjaxUpdatedControl ControlID="btnEnemyAttack" />
                    <telerik:AjaxUpdatedControl ControlID="lblPlayerHealth" />
                    <telerik:AjaxUpdatedControl ControlID="lblPlayerMP" />
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerImages" />
                    <telerik:AjaxUpdatedControl ControlID="btnAttack" UpdatePanelRenderMode="Inline"/>
                    <telerik:AjaxUpdatedControl ControlID="btnHeal" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="btnRun" UpdatePanelRenderMode="Inline" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnRun">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblEnemyName" />
                    <telerik:AjaxUpdatedControl ControlID="lblBattleLog" />
                    <telerik:AjaxUpdatedControl ControlID="lblXPLog" />
                    <telerik:AjaxUpdatedControl ControlID="lblXP" />
                    <telerik:AjaxUpdatedControl ControlID="btnEnemyAttack" />
                    <telerik:AjaxUpdatedControl ControlID="btnResetEnemy" />
                    <telerik:AjaxUpdatedControl ControlID="lblPlayerHealth" />
                    <telerik:AjaxUpdatedControl ControlID="btnAttack" UpdatePanelRenderMode="Inline"/>
                    <telerik:AjaxUpdatedControl ControlID="btnHeal" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="btnRun" UpdatePanelRenderMode="Inline" />
                    <telerik:AjaxUpdatedControl ControlID="pnlPlayerImages" />
                    <telerik:AjaxUpdatedControl ControlID="pnlEnemyImages" />
                    <telerik:AjaxUpdatedControl ControlID="imgRun" />
                </UpdatedControls>
            </telerik:AjaxSetting>

        </AjaxSettings>
    </telerik:RadAjaxManager>

    <telerik:RadWindowManager ID="LvlUpPopUp" runat="server" Skin="Glow" AutoSize="True" OnClientShow="PlayLvlUpSong">
        
    </telerik:RadWindowManager>

    <asp:Panel ID="MainClassHeader" runat="server" CssClass="HeaderWrapper">

        <asp:Panel ID="pnlClassWrapper" runat="server" CssClass="ClassWrapper">
                     
            <telerik:RadLabel 
                ID="lblClass" 
                runat="server" 
                Font-Size="XX-Large"
                Font-Bold ="true">
            </telerik:RadLabel>

        </asp:Panel>

    </asp:Panel>

    <asp:Panel ID="XPLVLHeader" runat="server" CssClass="XPLVLwrapper">

        <asp:Panel ID="pnlXPwrapper" runat="server" CssClass="XPwrapper">

            <telerik:RadLabel 
                ID="XPlbl" 
                runat="server" 
                Text="XP: " 
                Font-Size="X-Large"
                Font-Bold ="true">
            </telerik:RadLabel>

            <telerik:RadLabel 
                ID="lblXP" 
                runat="server" 
                Font-Size="X-Large">
            </telerik:RadLabel>

        </asp:Panel>


        <asp:Panel ID="pnlLVLwrapper" runat="server" CssClass="LVLwrapper">

            <telerik:RadLabel 
                ID="LVLlbl" 
                runat="server" 
                Text="LVL: " 
                Font-Size="X-Large"
                Font-Bold ="true">
            </telerik:RadLabel>

            <telerik:RadLabel 
                ID="lblLVL" 
                runat="server" 
                Font-Size="X-Large">
            </telerik:RadLabel>

        </asp:Panel>

    </asp:Panel>

    <asp:Panel ID="MainBattlePane" runat="server" CssClass="MainBattleWrapper">

        <asp:Panel ID="pnlPlayer" runat="server" CssClass="PlayerWrapper">

            <asp:Panel ID="pnlPlayerHealth" runat="server" CssClass="PlayerHealthWrapper">

                <telerik:RadLabel 
                    ID="lblHP" 
                    runat="server" 
                    Text="HP: " 
                    Font-Size="X-Large"
                    Font-Bold ="true">
                </telerik:RadLabel>

                <telerik:RadLabel 
                    ID="lblPlayerHealth" 
                    runat="server" 
                    Font-Size="X-Large"
                    ForeColor="Green">
                </telerik:RadLabel>

            </asp:Panel>

            <asp:Panel ID="pnlPlayerMP" runat="server" CssClass="PlayerMPwrapper" >

                <telerik:RadLabel 
                    ID="lblMP" 
                    runat="server" 
                    Text="MP: " 
                    Font-Size="X-Large"
                    Font-Bold ="true"
                    Visible="false">
                </telerik:RadLabel>

                <telerik:RadLabel 
                    ID="lblPlayerMP" 
                    runat="server" 
                    Font-Size="X-Large"
                    ForeColor="Blue"
                    Visible="false">
                </telerik:RadLabel>

            </asp:Panel>

            <asp:Panel ID="pnlPlayerImages" runat="server">

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

            </asp:Panel>

            <asp:Image 
                ID="imgDeadPlayer" 
                runat="server" 
                Visible="false" 
                ImageUrl="~/Images/RIP.jpg" 
                CssClass="PlayerImage"/>

            <asp:Image 
                ID="imgRun" 
                runat="server"  
                Visible="false" 
                ImageUrl="~/Images/Run.gif" 
                CssClass="PlayerImage"/>

            <asp:Panel ID="pnlPlayerAttack" runat="server" CssClass="PlayerAttackWrapper">

                <telerik:RadLabel 
                    ID="playerAttackLbl" 
                    runat="server" 
                    Text="ATTACK: " 
                    Font-Size="X-Large"
                    ForeColor="Red">
                </telerik:RadLabel>

                <telerik:RadLabel 
                    ID="lblPlayerAttack" 
                    runat="server" 
                    Font-Size="X-Large"
                    ForeColor="Red">
                </telerik:RadLabel>

            </asp:Panel>

            <asp:Panel ID="pnlPlayerMagic" runat="server" CssClass="PlayerMagicWrapper" >

                <telerik:RadLabel 
                    ID="lblMagic" 
                    runat="server" 
                    Text="MAGIC: " 
                    Font-Size="X-Large"
                    ForeColor="Blue"
                    Visible="false">
                </telerik:RadLabel>

                <telerik:RadLabel 
                    ID="lblPlayerMagic" 
                    runat="server" 
                    Font-Size="X-Large"
                    ForeColor="Blue"
                    Visible="false">
                </telerik:RadLabel>

            </asp:Panel>

        </asp:Panel>

        <asp:Panel ID="pnlBattleInterface" runat="server" CssClass="BattleInterfaceWrapper">

            <telerik:RadLabel 
                ID="lblEnemyName" 
                runat="server" 
                Font-Size="Larger" 
                Font-Bold="true" 
                ForeColor="White">
            </telerik:RadLabel>

            <telerik:RadLabel 
                ID="lblBattleLog" 
                runat="server" 
                Font-Size="Larger"  
                Font-Bold="true" 
                CssClass="BattleLog" 
                ForeColor="White"
                Text="What will you do?">
            </telerik:RadLabel>

            <telerik:RadLabel 
                ID="lblXPLog" 
                runat="server" 
                Font-Size="Larger" 
                Font-Bold="true" 
                ForeColor="White"
                Visible="false">
            </telerik:RadLabel>

            <asp:Panel ID="pnlContinueButtons" runat="server" CssClass ="ContinuewButtonsWrapper">

                 <telerik:RadButton 
                    ID="btnEnemyAttack" 
                    runat="server" 
                    Text="Continue" 
                    Skin="Glow" 
                    Height="50px" 
                    Width="115px" 
                    Font-Size="Medium" 
                    BorderStyle="Outset"
                    Visible="false" 
                    OnClick="btnEnemyAttack_Click">
                </telerik:RadButton>

                <telerik:RadButton 
                        ID="btnContinue" 
                        runat="server" 
                        Text="Continue" 
                        Skin="Glow" 
                        Height="50px" 
                        Width="115px" 
                        Font-Size="Medium" 
                        BorderStyle="Outset"
                        Visible="false" 
                        OnClick="btnContinue_Click">
                </telerik:RadButton>

                <telerik:RadButton 
                        ID="btnResetEnemy" 
                        runat="server" 
                        Text="Continue" 
                        Skin="Glow" 
                        Height="50px" 
                        Width="115px" 
                        Font-Size="Medium" 
                        BorderStyle="Outset"
                        Visible="false" 
                        OnClick="btnResetEnemy_Click"
                        OnClientClicking="PlayBattleSong">
                </telerik:RadButton>

            </asp:Panel>
           

            <asp:Panel ID="pnlBattleButtons" runat="server" CssClass="BattleButtonWrapper">

                <telerik:RadButton 
                    ID="btnAttack" 
                    runat="server" 
                    Text="Attack" 
                    Skin="Glow" 
                    Height="50px" 
                    Width="125px" 
                    Font-Size="X-Large" 
                    BorderStyle="Outset" 
                    OnClick="btnAttack_Click"
                    OnClientClicking="PlayHit">
                </telerik:RadButton>

                <telerik:RadButton 
                    ID="btnHeal" 
                    runat="server" 
                    Text="Heal" 
                    Skin="Glow"  
                    Height="50px" 
                    Width="125px" 
                    Font-Size="X-Large" 
                    Visible="false" 
                    BorderStyle="Outset" 
                    OnClick="btnHeal_Click"                    
                    ToolTip="-25 MP">
                </telerik:RadButton>

                <telerik:RadButton 
                    ID="btnRun" 
                    runat="server" 
                    Text="Run" 
                    Skin="Glow"  
                    Height="50px" 
                    Width="125px" 
                    Font-Size="X-Large" 
                    BorderStyle="Outset" 
                    OnClick="btnRun_Click"
                    Tooltip="Requires at least 10 XP">
                </telerik:RadButton>

            </asp:Panel>
            
        </asp:Panel>

        <asp:Panel ID="pnlEnemy" runat="server" CssClass="EnemyWrapper">
          
            <asp:Panel ID="pnlEnemyHealth" runat="server" CssClass="EnemyHealthWrapper">

                <telerik:RadLabel 
                    ID="lblEnempHP" 
                    runat="server" 
                    Text="HP: " 
                    Font-Size="X-Large"
                    Font-Bold ="true">
                </telerik:RadLabel>

                <telerik:RadLabel 
                    ID="lblEnemyHealth" 
                    runat="server" 
                    Font-Size="X-Large"
                    ForeColor="Green">
                </telerik:RadLabel>

            </asp:Panel>

            <asp:Panel ID="pnlEnemyImages" runat="server">

                <asp:Image 
                    ID="imgRat" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/zombieRat.jpg" 
                    CssClass="EnemyImg"/>

                <asp:Image 
                    ID="imgGoblin" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/Goblin.png"
                    CssClass="EnemyImg" />

                <asp:Image 
                    ID="imgSpider" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/spider.png"
                    CssClass="EnemyImg" />

                <asp:Image 
                    ID="imgOrc" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/orc.jpg"
                    CssClass="EnemyImg" />

                <asp:Image 
                    ID="imgDemon" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/demon.jpg"
                    CssClass="EnemyImg" />

                <asp:Image 
                    ID="imgGolem" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/golem.png"
                    CssClass="EnemyImg" />

                <asp:Image 
                    ID="imgGuard" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/RoyalGuard.png"
                    CssClass="EnemyImg" />

                <asp:Image 
                    ID="imgKing" 
                    runat="server" 
                    Visible="false" 
                    ImageUrl="~/Images/king.png"
                    CssClass="EnemyImg" />

            </asp:Panel>

            <asp:Image 
                ID="imgDeadEnemy" 
                runat="server" 
                Visible="false" 
                ImageUrl="~/Images/skull.jpg"
                CssClass="EnemyImg" />

            <asp:Panel ID="pnlEnemyAttack" runat="server" CssClass="EnemyAttackWrapper">

                <telerik:RadLabel 
                    ID="enemyAttackLbl" 
                    runat="server" 
                    Text="ATTACK: " 
                    Font-Size="X-Large"
                    ForeColor="Red">
                </telerik:RadLabel>

                <telerik:RadLabel 
                    ID="lblEnemyAttack" 
                    runat="server" 
                    Font-Size="X-Large"
                    ForeColor="Red">
                </telerik:RadLabel>

            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>
