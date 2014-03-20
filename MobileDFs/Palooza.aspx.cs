using System.Text;

public partial class Palooza : ASNA.Monarch.WebDspF.Page
{

    MiscHelpers helpers;

    protected override void OnCopyBrowserToDspFile()
    {
        base.OnCopyBrowserToDspFile();

        helpers = new MiscHelpers(this, this.Context);

        if (this.DspF.LastFormatName != null ) {
            if (helpers.StringsAreEqual(this.DspF.LastFormatName, "Register"))
            {
                // Here is a sneaky thing! When Register format fields are 
                // on their way back to the blue side, there values are available here. 
                // It is all but impossible to validate an email address with ILE RPG
                // so this code-behind is charged with that responsibility. 
                // If the email address doesn't pass the test, the 
                // CFormat (current format) name is changed to the pseudo format
                // name "BADEMAIL." 
                // The RPG program thinks this just another incoming format.
                // Its logic sets the error message and then simply redisplays
                // the Register format (with the error message).
                string email = helpers.GetDspField("Register", "email").ToString();
                if (!ValidateEmail(email)) {
                    helpers.SetDspField("Register","CFormat","BADEMAIL");
                }
            }

            if (helpers.StringsAreEqual(this.DspF.LastFormatName, "Returning"))
            {
                string email = helpers.GetDspField("Returning", "email").ToString();
                Session["email" ] = email;
            }

            if (helpers.StringsAreEqual(this.DspF.LastFormatName, "Register"))
            {
                string email = helpers.GetDspField("Register", "email").ToString();
                Session["email"] = email;
            }
        }
    }

    protected override void OnCopyDspFileToBrowser()
    {
        base.OnCopyDspFileToBrowser();

        helpers = new MiscHelpers(this, this.Context);

        if (helpers.StringsAreEqual(this.DspF.LastFormatName, "ShowLabs"))
        {
            string x = helpers.GetDspField("ShowLabs", "LabsOut").ToString();
            Session["labslist"] = helpers.GetDspField("ShowLabs", "LabsOut").ToString();
            Session["fullname"] = helpers.GetDspField("ShowLabs", "fullname").ToString();
        }
    }

    private bool ValidateEmail(string email) {
        {
            try
            {
                System.Net.Mail.MailAddress m = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch (System.FormatException)
            {
                return false;
            }
        }
    }

}
