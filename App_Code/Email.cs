using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.IO;

namespace EmailManager
{
    public class EmailSender
    {
        StringBuilder emailTemplateBody = new StringBuilder(1024);

        public EmailSender(string templateFile) {
            System.Exception ex = null;
            if (!File.Exists(templateFile)) {
                throw new ArgumentNullException("Email template not found", ex);
            }

            emailTemplateBody.Append(File.ReadAllText(templateFile));
        }

        public void SendEmail(string toName, string toAddress, string labList) {
            SmtpClient mailObj;

            MailMessage myMessage = new MailMessage();

            mailObj = new SmtpClient("10.1.3.5");

            myMessage.To.Add(toAddress.ToLower());
            myMessage.Bcc.Add("rp@asna.com");
            myMessage.Bcc.Add("liz@asna.com");

            myMessage.From = new MailAddress( "no-reply@asna.com" );  
            myMessage.Subject = "Your ASNApalooza lab registration has been received"; 
            myMessage.IsBodyHtml = true;

            emailTemplateBody.Replace("{{FullName}}", toName);
            emailTemplateBody.Replace("{{Labs}}", GetLabUnOrderedList(labList));
            myMessage.Body = emailTemplateBody.ToString();
                
            try {
                mailObj.Send(myMessage);
            }
            catch (System.Exception ex) {
                // swallow exception.
                throw ex;                     
            }
        }

        private string GetLabUnOrderedList(string labList) {
            StringBuilder result = new StringBuilder(512);

            string[] labs = labList.Split(';');

            foreach ( string lab in labs) {
                if (lab.Length > 0) {
                    string[] tokens = lab.Split(',');
                    if (tokens.Length == 3)  {
                        result.Append(String.Format("<li>{0}, {1}</li>", tokens[2], tokens[1]));
                    }
                }
            }

            return result.ToString();
        }

    }
}
