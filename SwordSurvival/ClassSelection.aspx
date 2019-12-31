<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ClassSelection.aspx.cs" Inherits="SwordSurvival.ClassSelection" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script>
            var intro = new Howl({
                src: ['Audio/Intro.wav'],
                loop: true
            }).play();

            var selectSound = new Howl({
                src: ['Audio/swordSheath.wav']               
            });

            var startSound = new Howl({
                src: ['Audio/hit.wav']
            });

            function PlayStart()
            {
                startSound.play();
            }

            function PlaySelect()
            {
                selectSound.play();
            }


        </script>
    </telerik:RadCodeBlock>
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="main" runat="server">

    <telerik:RadAjaxManager ID="RadAjaxManagerClass" runat="server" >
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="slctClass">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="pnlClass" />
                    <telerik:AjaxUpdatedControl ControlID="lblClassDescription" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <asp:Panel ID="Panel1" runat="server" CssClass="ClassSelection">

        <telerik:RadDropDownList 
            ID="slctClass" 
            runat="server" 
            DefaultMessage="Select a Class" 
            Skin="Glow" 
            AutoPostBack ="true" 
            CausesValidation="false" 
            OnSelectedIndexChanged="slctClass_SelectedIndexChanged" 
            Font-Size="XX-Large"
            OnClientItemSelecting="PlaySelect">
            <Items>
                <telerik:DropDownListItem Text="Barbarian" Value ="Barbarian"/>
                <telerik:DropDownListItem Text="Knight" Value ="Knight"/>
                <telerik:DropDownListItem Text="Assassin" Value ="Assassin"/>
                <telerik:DropDownListItem Text="Witch" Value ="Witch"/>
            </Items>
        </telerik:RadDropDownList>
             
    </asp:Panel>

    <asp:Panel ID="pnlClass" runat="server" CssClass="ClassDescriptions">

        <telerik:RadLabel 
            ID="lblClassDescription" 
            runat="server" 
            Text ="" 
            Font-Size="Large" 
            Font-Bold="True">
        </telerik:RadLabel>
        
        <asp:Image 
            ID="imgNoClass" 
            runat="server"  
            Visible="true" 
            ImageUrl="~/Images/noClass.jpg" 
            CssClass="NoClassImage"/>

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

        <telerik:RadLabel 
            ID="lblClassStats" 
            runat="server" 
            Font-Size="X-Large" 
            Font-Bold="True" 
            ForeColor="DarkRed">
        </telerik:RadLabel>

        <telerik:RadLinkButton 
            ID="btnSubmit" 
            runat="server" 
            Text="Continue" 
            Skin="Glow" 
            CssClass="Buttons" 
            Visible="false" 
            Font-Size="X-Large"
            OnClientMouseOver="PlayStart">
        </telerik:RadLinkButton>

    </asp:Panel>

</asp:Content>
