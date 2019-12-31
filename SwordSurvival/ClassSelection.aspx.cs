using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SwordSurvival
{
    public partial class ClassSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void slctClass_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            string selectedClass = slctClass.SelectedValue;
            btnSubmit.Visible = true;
            btnSubmit.NavigateUrl = $"BattlePage.aspx?class={selectedClass}";

            if(selectedClass == "Barbarian")
            {
                lblClassDescription.Text = @"The Barbarian charges into battle with a battle axe and no armor.  
                                             What he lacks in armor and defense, he makes up for in terrrifying 
                                             agrression and brute force.";

                imgNoClass.Visible = false;
                imgBarbarian.Visible = true;
                imgKnight.Visible = false;
                imgAssassin.Visible = false;
                imgWitch.Visible = false;

                lblClassStats.Text = "(High attack, Low defense)";


            }
            else if(selectedClass == "Knight")
            {
                lblClassDescription.Text = @"The Knight is equipped with a blade shield and heavy plate armor. However,  
                                             he was at his dad's house last weekend and forgot to bring his sword home with him.";

                imgNoClass.Visible = false;
                imgBarbarian.Visible = false;
                imgKnight.Visible = true;
                imgAssassin.Visible = false;
                imgWitch.Visible = false;

                lblClassStats.Text = " (Low attack, High defense)";
            }
            else if (selectedClass == "Assassin")
            {
                lblClassDescription.Text = @"The Assassin wears light armor and weilds a steel dagger.
                                             He is quick and agile, making him a well rounded combatant.";

                imgNoClass.Visible = false;
                imgBarbarian.Visible = false;
                imgKnight.Visible = false;
                imgAssassin.Visible = true;
                imgWitch.Visible = false;

                lblClassStats.Text = "(Moderate attack, Moderate defense)";
            }
            else if (selectedClass == "Witch")
            {
                lblClassDescription.Text = @"Instead of a blade or similar weapon, the Witch carries a magical staff, 
                                             which can be used to zap her enemies and even restore her health.";

                imgNoClass.Visible = false;
                imgBarbarian.Visible = false;
                imgKnight.Visible = false;
                imgAssassin.Visible = false;
                imgWitch.Visible = true;

                lblClassStats.Text = "(Low attack, Low defense, Has healing abilities)";
            }          
        }
    }
}