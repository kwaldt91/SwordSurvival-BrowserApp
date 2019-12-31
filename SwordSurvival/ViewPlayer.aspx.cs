using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SwordSurvival
{
    public partial class ViewPlayer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["place"] == "1")
            {
                imgCrown1.Visible = true;
                imgCrown2.Visible = true;
            }

            lblName.Text = Request.QueryString["name"];
            
            switch (Request.QueryString["class"])
            {
                case "Barbarian":
                    
                    lblName.ForeColor = System.Drawing.Color.DarkRed;
                    Classlbl.ForeColor = System.Drawing.Color.DarkRed;
                    monSlayLbl.ForeColor = System.Drawing.Color.DarkRed;
                    LVLlbl.ForeColor = System.Drawing.Color.DarkRed;

                    imgBarbarian.Visible = true;
                    imgKnight.Visible = false;
                    imgAssassin.Visible = false;
                    imgWitch.Visible = false;

                    break;

                case "Knight":
                   
                    lblName.ForeColor = System.Drawing.Color.DarkSlateGray;
                    Classlbl.ForeColor = System.Drawing.Color.DarkSlateGray;
                    monSlayLbl.ForeColor = System.Drawing.Color.DarkSlateGray;
                    LVLlbl.ForeColor = System.Drawing.Color.DarkSlateGray;

                    imgBarbarian.Visible = false;
                    imgKnight.Visible = true;
                    imgAssassin.Visible = false;
                    imgWitch.Visible = false;

                    break;

                case "Assassin":
                    
                    lblName.ForeColor = System.Drawing.Color.DarkSlateBlue;
                    Classlbl.ForeColor = System.Drawing.Color.DarkSlateBlue;
                    monSlayLbl.ForeColor = System.Drawing.Color.DarkSlateBlue;
                    LVLlbl.ForeColor = System.Drawing.Color.DarkSlateBlue;

                    imgBarbarian.Visible = false;
                    imgKnight.Visible = false;
                    imgAssassin.Visible = true;
                    imgWitch.Visible = false;

                    break;

                case "Witch":

                    lblName.ForeColor = System.Drawing.Color.DarkGreen;
                    Classlbl.ForeColor = System.Drawing.Color.DarkGreen;
                    monSlayLbl.ForeColor = System.Drawing.Color.DarkGreen;
                    LVLlbl.ForeColor = System.Drawing.Color.DarkGreen;

                    imgBarbarian.Visible = false;
                    imgKnight.Visible = false;
                    imgAssassin.Visible = false;
                    imgWitch.Visible = true;

                    break;

                case "RoyalGuard":

                    lblName.ForeColor = System.Drawing.Color.DarkTurquoise;
                    Classlbl.ForeColor = System.Drawing.Color.DarkTurquoise;
                    monSlayLbl.ForeColor = System.Drawing.Color.DarkTurquoise;
                    LVLlbl.ForeColor = System.Drawing.Color.DarkTurquoise;

                    imgGuard.Visible = true;

                    break;
            }

            lblClass.Text = Request.QueryString["class"];
            lblMonSlay.Text = Request.QueryString["monstersSlain"];
            lblLVL.Text = Request.QueryString["levelReached"];
            btnBack.NavigateUrl = $"~/GameOver.aspx?id={Request.QueryString["id"]}&back=true";
        }
    }
}