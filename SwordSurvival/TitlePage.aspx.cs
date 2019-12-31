using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Media;
using System.IO;

namespace SwordSurvival
{
    public partial class TitlePage : System.Web.UI.Page
    {   
            
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            string message = "I, King Tobias, am in need of mighty warriors to join my Royal Guard!<br><br>If you believe yourself worthy of this noble cause,<br> then you must prove so by completing my Sword Survival Challenge!<br> Do you have what it takes?<br><br>Let the games begin!";

            MessagePopUp.RadAlert(message, 600, 250, "Here Ye! Here Ye!", "GoToClassPage");
        }
    }
}