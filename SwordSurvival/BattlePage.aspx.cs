using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SwordSurvival
{
    public partial class BattlePage : System.Web.UI.Page
    {
        //player variables
        static string playerClass;
        static int xp;
        static int xpNeeded;
        static int leftOverXP;
        static int lvl;
        static int playerHealth;
        static int playerMaxHealth;
        static int playerMP;
        static int playerMaxMp;
        static int playerAttack;
        static int playerMagic;
        static string attackVerb;

        //enemy variables
        static string enemyName;
        static int enemyHealth;
        static int enemyMaxHealth;
        static int enemyAttack;
        static int enemyXP;
        static int monstersSlain;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["class"] == null)
                {
                    Response.Redirect("TitlePage.aspx");
                }
                else
                {
                    monstersSlain = 0;
                    playerClass = Request.QueryString["class"];
                    InitializePlayer(playerClass);                 
                    SpawnEnemy(lvl);            
                }                       
            }

            pnlPlayerImages.CssClass = "";
            pnlEnemyImages.CssClass = "";

            if(xp >= 10 && enemyName != "King Tobias")
            {
                btnRun.OnClientClicking = "PlayVictorySong";
            }
            else
            {
                btnRun.OnClientClicking = "PlayNope";
            }

            if(playerMP >= 25)
            {
                btnHeal.OnClientClicking = "PlayHeal";
            }
            else
            {
                btnHeal.OnClientClicking = "PlayNope";
            }

            btnEnemyAttack.OnClientClicking = "PlayEnemyHit";
            
        }

        protected void btnAttack_Click(object sender, EventArgs e)
        {
            lblEnemyName.Visible = false;
            AttackEnemy();

            if(playerClass == "Witch")
            {
                pnlPlayerImages.CssClass = "AnimatePlayerZap"; 
                pnlEnemyImages.CssClass = "AnimateEnemyZap";
            }
            else
            {
                pnlPlayerImages.CssClass = "AnimatePlayerAttack";
                pnlEnemyImages.CssClass = "AnimateEnemyTakeDamage";
            }
                      
            btnEnemyAttack.Visible = true;
            btnAttack.Enabled = false;
            btnHeal.Enabled = false;
            btnRun.Enabled = false;
            
            if (enemyHealth <= 0)
            {
                btnEnemyAttack.OnClientClicking = "PlayVictorySong";
            }
            else
            {
                btnEnemyAttack.OnClientClicking = "PlayEnemyHit";
            }        
        }
      
        protected void btnEnemyAttack_Click(object sender, EventArgs e)
        {
            if (enemyHealth > 0)
            {
                AttackPlayer();
                pnlEnemyImages.CssClass = "AnimateEnemyAttack";
                pnlPlayerImages.CssClass = "AnimatePlayerTakeDamage";
                btnEnemyAttack.Visible = false;
                btnContinue.Visible = true;

                if (playerHealth <= 0)
                {
                    btnContinue.OnClientClicking = "PlayDefeatSong";
                }
                else
                {
                    btnContinue.OnClientClicking = "";
                }
            }
            else
            {
                if(enemyName == "King Tobias")
                {
                    lblBattleLog.Text = $"You defeated {enemyName}!";
                    string message = "Well done!<br><br> you have proven yourself worthy to join my Royal Guard!<br>Next time I will not go so easy on you! <br><br> -King Tobias";
                    LvlUpPopUp.RadAlert(message, 500, 250, "King Tobias says...", "EmptyFunction");
                }
                else
                {
                    lblBattleLog.Text = $"You defeated the {enemyName}!";
                }
                
                GainXP();
                monstersSlain++;

                pnlEnemyImages.Visible = false;
                imgDeadEnemy.Visible = true;

                btnEnemyAttack.Visible = false;
                btnResetEnemy.Visible = true;
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if(playerHealth <= 0)
            {
                pnlPlayerImages.Visible = false;
                imgDeadPlayer.Visible = true;
                lblBattleLog.Text = "You were defeated";
                btnContinue.Visible = false;
                btnResetEnemy.Visible = true;       
            }
            else
            {
                ResetBattleInterface();
            }
            
        }
        
        protected void btnResetEnemy_Click(object sender, EventArgs e)
        {  
            if(playerHealth <= 0)
            {
                Random rand = new Random();
                int id = rand.Next(999999);
                Response.Redirect($"GameOver.aspx?id={id}&class={playerClass}&monstersSlain={monstersSlain}&levelReached={lvl}");
            }
            else
            {
                if(enemyName == "King Tobias")
                {
                    Random rand = new Random();
                    int id = rand.Next(999999);
                 
                    Response.Redirect($"GameOver.aspx?id={id}&class=RoyalGuard&monstersSlain={monstersSlain}&levelReached={lvl}");
                }

                if (xp >= xpNeeded)
                {
                    LevelUp();
                }

                SpawnEnemy(lvl);
                ResetBattleInterface();
            }
            
        }

        protected void btnHeal_Click(object sender, EventArgs e)
        {
            lblEnemyName.Visible = false;
            bool healedSuccessfully = Heal();

            if(healedSuccessfully)
            {
               pnlPlayerImages.CssClass = "AnimateHeal";
            }
            else
            {
                pnlPlayerImages.CssClass = "AnimateCantRun";
            }
            
            btnEnemyAttack.Visible = true;
            btnAttack.Enabled = false;
            btnHeal.Enabled = false;
            btnRun.Enabled = false;          
        }

        protected void btnRun_Click(object sender, EventArgs e)
        {
            lblEnemyName.Visible = false;
            bool ranSuccessfully = RecoverHealthFromRun();

            if(ranSuccessfully)
            {
                btnResetEnemy.Visible = true;
                pnlPlayerImages.Visible = false;
                imgRun.Visible = true;
                pnlEnemyImages.CssClass = "AnimateRun";
            }
            else
            {
                pnlPlayerImages.CssClass = "AnimateCantRun";
                btnEnemyAttack.Visible = true;
            }
            
            btnAttack.Enabled = false;
            btnHeal.Enabled = false;
            btnRun.Enabled = false;
        }

        protected void InitializePlayer(string playerClass)
        {
            switch(playerClass)
            {
                case "Barbarian":
                    playerHealth = 100;
                    playerMaxHealth = 100;
                    playerAttack = 150;
                    attackVerb = "slash";

                    lblClass.ForeColor = System.Drawing.Color.DarkRed;

                    imgBarbarian.Visible = true;
                    imgKnight.Visible = false;
                    imgAssassin.Visible = false;
                    imgWitch.Visible = false;
                    break;

                case "Knight":
                    playerHealth = 150;
                    playerMaxHealth = 150;
                    playerAttack = 100;
                    attackVerb = "bash";

                    lblClass.ForeColor = System.Drawing.Color.DarkSlateGray;

                    imgBarbarian.Visible = false;
                    imgKnight.Visible = true;
                    imgAssassin.Visible = false;
                    imgWitch.Visible = false;
                    break;

                case "Assassin":
                    playerHealth = 125;
                    playerMaxHealth = 125;
                    playerAttack = 125;
                    attackVerb = "stab";

                    lblClass.ForeColor = System.Drawing.Color.DarkSlateBlue;

                    imgBarbarian.Visible = false;
                    imgKnight.Visible = false;
                    imgAssassin.Visible = true;
                    imgWitch.Visible = false;
                    break;

                case "Witch":
                    playerHealth = 100;
                    playerMaxHealth = 100;
                    playerAttack = 100;
                    playerMP = 100;
                    playerMaxMp = 100;
                    playerMagic = 100;
                    attackVerb = "zap";

                    lblClass.ForeColor = System.Drawing.Color.DarkGreen;
                
                    lblMP.Visible = true;
                    lblPlayerMP.Visible = true;
                    lblMagic.Visible = true;
                    lblPlayerMagic.Visible = true;


                    btnHeal.Visible = true;
                    imgBarbarian.Visible = false;
                    imgKnight.Visible = false;
                    imgAssassin.Visible = false;
                    imgWitch.Visible = true;
                    btnAttack.OnClientClicking = "PlayZap";
                    break;             
            }

            lblClass.Text = playerClass;
            xp = 0;
            xpNeeded = 100;
            lvl = 1;
            lblXP.Text = $"{xp}/{xpNeeded}";
            lblLVL.Text = lvl.ToString();
            lblPlayerHealth.Text = $"{playerHealth}/{playerMaxHealth}";
            lblPlayerMP.Text = $"{playerMP}/{playerMaxMp}";
            lblPlayerAttack.Text = playerAttack.ToString();
            lblPlayerMagic.Text = playerMagic.ToString();
        }

        protected void SpawnEnemy(int playerLevel)
        {
            Random rand = new Random();

            pnlEnemyImages.Visible = true;
            pnlPlayerImages.Visible = true;
            imgDeadEnemy.Visible = false;
            imgRun.Visible = false;

            switch (playerLevel)
            {
                case 1:
                    enemyAttack = rand.Next(25, 50);
                    enemyMaxHealth = rand.Next(125, 150);
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(25, 50);
                    enemyName = "Zombie Rat";
                    imgRat.Visible = true;
                    break;

                case 2:
                    enemyAttack = rand.Next(50, 75);
                    enemyMaxHealth = rand.Next(150, 175);
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(50, 75);
                    enemyName = "Goblin Bandit";
                    imgRat.Visible = false;
                    imgGoblin.Visible = true;                  
                    break;

                case 3:
                    enemyAttack = rand.Next(75, 100);
                    enemyMaxHealth = rand.Next(175, 200);
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(75, 100);
                    enemyName = "Hungry Spider";
                    imgGoblin.Visible = false;
                    imgSpider.Visible = true;
                    break;

                case 4:
                    enemyAttack = rand.Next(100, 125);
                    enemyMaxHealth = rand.Next(200, 225);
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(100, 125);
                    enemyName = "Savage Orc";
                    imgSpider.Visible = false;
                    imgOrc.Visible = true;

                    break;

                case 5:
                    enemyAttack = rand.Next(125, 150);
                    enemyMaxHealth = rand.Next(225, 250);
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(125, 150);
                    enemyName = "Shadow Demon";
                    imgOrc.Visible = false;
                    imgDemon.Visible = true;

                    break;

                case 6:
                    enemyAttack = rand.Next(150, 175);
                    enemyMaxHealth = rand.Next(250, 275);
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(150, 175);
                    enemyName = "Earth Golem";
                    imgDemon.Visible = false;
                    imgGolem.Visible = true;

                    break;

                case 7:
                    enemyAttack = rand.Next(175, 200);
                    enemyMaxHealth = rand.Next(275, 300);
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(175, 200);
                    enemyName = "Royal Guard";
                    imgGolem.Visible = false;
                    imgGuard.Visible = true;

                    break;

                case 8:
                    enemyAttack = 300;
                    enemyMaxHealth = 400;
                    enemyHealth = enemyMaxHealth;
                    enemyXP = rand.Next(175, 200);
                    enemyName = "King Tobias";
                    imgGuard.Visible = false;
                    imgKing.Visible = true;

                    break;

                default:

                    break;
            }

            lblEnemyName.Visible = true;

            if(enemyName == "King Tobias")
            {
                lblEnemyName.Text = $"What?! {enemyName} himself has challenged you!";
            }
            else
            {
                lblEnemyName.Text = $"a {enemyName} appeared!";
            }
            
            lblEnemyHealth.ForeColor = System.Drawing.Color.Green;
            lblEnemyHealth.Text = $"{enemyHealth}/{enemyMaxHealth}";
            lblEnemyAttack.Text = enemyAttack.ToString();
        }

        protected void ResetBattleInterface()
        {
            btnEnemyAttack.Visible = false;
            btnContinue.Visible = false;
            btnResetEnemy.Visible = false;
            lblXPLog.Visible = false;

            lblBattleLog.Text = "What will you do?";
            btnAttack.Enabled = true;
            btnHeal.Enabled = true;
            btnRun.Enabled = true;
        }

        protected void AttackEnemy()
        {
            Random rand = new Random();
            int playerDamage = rand.Next(playerAttack / 2, playerAttack);

            if(enemyName == "King Tobias")
            {
                lblBattleLog.Text = $"You {attackVerb} {enemyName}, for {playerDamage} damage!";
            }
            else
            {
                lblBattleLog.Text = $"You {attackVerb} the {enemyName}, for {playerDamage} damage!";
            }
            
            enemyHealth -= playerDamage;

            UpdateHpColor("enemy");

            if (enemyHealth <= 0)
            {
                lblEnemyHealth.Text = $"0/{enemyMaxHealth}";
            }
            else
            {
                lblEnemyHealth.Text = $"{enemyHealth}/{enemyMaxHealth}";
            }
        }

        protected void AttackPlayer()
        {
            Random rand = new Random();
            int enemyDamage = rand.Next(enemyAttack / 2, enemyAttack);

            if(enemyName == "King Tobias")
            {
                lblBattleLog.Text = $"{enemyName} attacks for {enemyDamage} damage!";
            }
            else
            {
                lblBattleLog.Text = $"The {enemyName} attacks for {enemyDamage} damage!";
            }
            
            playerHealth -= enemyDamage;

            UpdateHpColor("player");

            if (playerHealth <= 0)
            {
                lblPlayerHealth.Text = $"0/{playerMaxHealth}";
            }
            else
            {
                lblPlayerHealth.Text = $"{playerHealth}/{playerMaxHealth}";
            }
        }

        protected void GainXP()
        {
            leftOverXP = 0;
            xp += enemyXP;

            if(xp > xpNeeded)
            {
                leftOverXP = xp - xpNeeded;
                lblXP.Text = $"{xpNeeded}/{xpNeeded}";
            }
            else
            {
                lblXP.Text = $"{xp}/{xpNeeded}";
            }

            lblXPLog.Visible = true;
            lblXPLog.Text = $"You gained {enemyXP} XP";
            
        }

        protected void LevelUp()
        {
            int addedAttack = 0;
            int addedHealth = 0;
            int addedMagic = 0;
            int addedMp = 0;
          
            lvl++;
            xp = leftOverXP;
            xpNeeded += 100;

            string lvlUpMessage = "<div class=\"PopUp\"> <label style=\"font-weight:bold;\">";
            lvlUpMessage += $"Congratulations! Your {playerClass} is now Level {lvl} </label> <br/> <br/>";
            switch (playerClass)
            {
                case "Barbarian":
                    addedAttack = 40;
                    addedHealth = 30;
                    break;

                case "Knight":
                    addedAttack = 30;
                    addedHealth = 40;
                    break;

                case "Assassin":
                    addedAttack = 35;
                    addedHealth = 35;
                    break;

                case "Witch":
                    addedAttack = 30;
                    addedHealth = 30;
                    addedMagic = 30;
                    addedMp = 30;

                    playerMagic += addedMagic;
                    playerMaxMp += addedMp;
                    playerMP = playerMaxMp;
                    lvlUpMessage += $"MAGIC + {addedMagic} <br/> MAX MP + {addedMp} <br/>";
                    break;
            }

            lvlUpMessage += $"ATTACK + {addedAttack} <br/> MAX HP + {addedHealth} </div>";

            LvlUpPopUp.RadAlert(lvlUpMessage, 550, 200, "Level Up!", "PlayBattleSong");

            playerAttack += addedAttack;
            playerMaxHealth += addedHealth;
            playerHealth = playerMaxHealth;

            lblXP.Text = $"{xp}/{xpNeeded}";
            lblLVL.Text = lvl.ToString();
            lblPlayerHealth.ForeColor = System.Drawing.Color.Green;
            lblPlayerHealth.Text = $"{playerHealth}/{playerMaxHealth}";
            lblPlayerMP.Text = $"{playerMP}/{playerMaxMp}";
            lblPlayerAttack.Text = playerAttack.ToString();
            lblPlayerMagic.Text = playerMagic.ToString();

            if (xp >= 10) // this is needed, for some reason if unsuccessful run after level up, victory song will play.
            {
                btnRun.OnClientClicking = "PlayVictorySong";
            }
            else
            {
                btnRun.OnClientClicking = "";
            }

        }

        protected bool Heal()
        {
            if(playerMP >= 25)
            {
                playerMP -= 25;

                Random rand = new Random();
                int amountHealed = rand.Next(playerMagic / 4, playerMagic);

                if(playerHealth + amountHealed > playerMaxHealth)
                {
                    amountHealed = playerMaxHealth - playerHealth;                  
                }
                
                playerHealth += amountHealed;
                UpdateHpColor("player");

                lblBattleLog.Text = $"You recovered {amountHealed} HP";
                lblPlayerHealth.Text = $"{playerHealth}/{playerMaxHealth}";
                lblPlayerMP.Text = $"{playerMP}/{playerMaxMp}";
                return true;
            }
            else
            {
                lblBattleLog.Text = "Not enough MP!";
                return false;
            }
        }

        protected bool RecoverHealthFromRun()
        {          
            if(enemyName == "King Tobias")
            {
                lblBattleLog.Text = $"{enemyName} does not tolerate cowards!";
                return false;
            }

            if (xp >= 10)
            {
                Random rand = new Random();
                int lostXP = 0;
                
                try
                {
                    lostXP = rand.Next(10, xp / 2);
                }
                catch (ArgumentOutOfRangeException)
                {

                    lostXP = 10;
                }

                int amountHealed = rand.Next(10, playerMaxHealth);

                if (playerHealth + amountHealed > playerMaxHealth)
                {
                    amountHealed = playerMaxHealth - playerHealth;
                }

                xp -= lostXP;
                playerHealth += amountHealed;
                UpdateHpColor("player");

                lblBattleLog.Text = $"You recovered {amountHealed} HP";
                lblXPLog.Visible = true;
                lblXPLog.Text = $"You lost {lostXP} XP";
                lblPlayerHealth.Text = $"{playerHealth}/{playerMaxHealth}";
                lblXP.Text = $"{xp}/{xpNeeded}";

                return true;           
            }
            else
            {
                lblBattleLog.Text = "Not enough XP!";
                return false;
            }
        }

        protected void UpdateHpColor(string whatHealth)
        {
            if(whatHealth == "player")
            {
                if (playerHealth > playerMaxHealth / 2)
                {
                    lblPlayerHealth.ForeColor = System.Drawing.Color.Green;
                }
                else if (playerHealth <= playerMaxHealth / 2 && playerHealth >= playerMaxHealth / 3)
                {
                    lblPlayerHealth.ForeColor = System.Drawing.Color.DarkGoldenrod;
                }
                else
                {
                    lblPlayerHealth.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if(whatHealth == "enemy")
            {
                if (enemyHealth > enemyMaxHealth / 2)
                {
                    lblEnemyHealth.ForeColor = System.Drawing.Color.Green;
                }
                else if (enemyHealth <= enemyMaxHealth / 2 && enemyHealth >= enemyMaxHealth / 3)
                {
                    lblEnemyHealth.ForeColor = System.Drawing.Color.DarkGoldenrod;
                }
                else
                {
                    lblEnemyHealth.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        
    }
}