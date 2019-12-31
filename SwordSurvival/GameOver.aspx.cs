using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;
using Telerik.Web.UI;


namespace SwordSurvival
{

    public partial class GameOver : System.Web.UI.Page
    {
        static int rowNumber; 
        protected void Page_Load(object sender, EventArgs e)
        {
            //pnlGameOver.Visible = false;
            //pnlHighScores.Visible = true;

            if (IsPostBack || Request.QueryString["back"] != null)
            {
                pnlGameOver.Visible = false;
                pnlHighScores.Visible = true;
            }

            if (!IsPostBack)
            {
                rowNumber = 0;
            }
        }

        protected void btnSubmitName_Click(object sender, EventArgs e)
        {
            XmlDocument xmlplayers = new XmlDocument();
            xmlplayers.Load(Server.MapPath("Scores.xml"));

            XmlElement player = xmlplayers.CreateElement("player");

            player.SetAttribute("id", Request.QueryString["id"]);
            player.SetAttribute("name", txtPlayerName.Text);
            player.SetAttribute("class", Request.QueryString["class"]);
            player.SetAttribute("monstersSlain", Request.QueryString["monstersSlain"]);
            player.SetAttribute("levelReached", Request.QueryString["levelReached"]);
            player.SetAttribute("date", DateTime.Now.ToShortDateString());
         
            xmlplayers.DocumentElement.AppendChild(player);
            xmlplayers.Save(Server.MapPath("Scores.xml"));
        }

        protected void grdScores_ItemCommand(object sender, GridCommandEventArgs e)//fires when row is clicked
        {
            if (e.CommandName == "RowClick")
            {
                GridDataItem row = e.Item as GridDataItem;
                string id = row["id"].Text.Trim();
                string name = row["name"].Text.Trim();
                string playerClass = row["class"].Text.Trim();
                string monstersSlain = row["monstersSlain"].Text.Trim();
                string levelReached = row["levelReached"].Text.Trim();
                string date = row["date"].Text.Trim();
                Label lbl = e.Item.FindControl("numberLabel") as Label;
                string place = lbl.Text;

                //pass row values to StartPackageRequest in querystring
                Response.Redirect($"~/ViewPlayer.aspx?id={id}&place={place}&name={name}&class={playerClass}&monstersSlain={monstersSlain}&levelReached={levelReached}");
            }

        }

        protected void grdScores_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && e.Item.OwnerTableView.DataSourceID == "XmlScores")
            {             
                rowNumber++;
                Label lbl = e.Item.FindControl("numberLabel") as Label;
                lbl.Text = rowNumber.ToString();

                GridDataItem row = e.Item as GridDataItem;
                string id = row["id"].Text.Trim();

                if (id == Request.QueryString["id"])
                {
                    row.ForeColor = System.Drawing.Color.Yellow;
                }
            }
      
        }

        protected void grdScores_PageIndexChanged(object sender, GridPageChangedEventArgs e)
        {
            if(e.NewPageIndex < grdScores.MasterTableView.CurrentPageIndex)
            {
                rowNumber -= 10 + grdScores.MasterTableView.Items.Count;
            }
          
        }
    }
}