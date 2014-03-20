using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net.Mail; 

namespace ASNA.Monarch.Support
{
    partial class EoJ : System.Web.UI.Page
    {
        protected override void OnLoad( EventArgs e )
        {
            showLabConfirmation.Visible = false;

            if ( Session["email"] != null && Session["labslist"] != null ) {
                if ( Session["labslist"].ToString().Trim().Length > 0 )
                {                
                    showLabConfirmation.Visible = true;

                    string email = Session["email"].ToString();
                    string fullName = Session["fullname"].ToString();
                    string labsList = Session["labslist"].ToString();
                    string templateFile = Server.MapPath("~/App_Data") + "\\lab-confirmation.html.template.txt";

                    EmailManager.EmailSender em = new EmailManager.EmailSender(templateFile);

                    em.SendEmail(fullName,email,labsList);
                }
            }

            Session.Abandon();
        }
    }
}
