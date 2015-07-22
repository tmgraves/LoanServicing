using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for Email
/// </summary>
public class Email
{
	public Email()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static MailMessage BuildMessage(MailAddress From, MailAddress[] To, string Subject, string Body, Attachment[] Attachments, MailAddress[] CC, MailAddress[] BCC)
    {
        MailMessage m = new MailMessage();
        m.From = From;

        //  Add To
        foreach (MailAddress a in To)
        {
            m.To.Add(a);
        }
        //  Add CC
        if (CC != null)
        {
            foreach (MailAddress a in CC)
            {
                m.CC.Add(a);
            }
        }
        //  Add BCC
        if (BCC != null)
        {
            foreach (MailAddress a in BCC)
            {
                m.Bcc.Add(a);
            }
        }
        m.Subject = Subject;
        m.Body = Body;

        foreach (Attachment a in Attachments)
        {
            m.Attachments.Add(a);
        }

        return m;
    }

    private delegate void SendEmailDelegate(System.Net.Mail.MailMessage m);

    private static void SendEmailResponse(IAsyncResult ar)
    {
        try
        {
            SendEmailDelegate sd = (SendEmailDelegate)(ar.AsyncState);

            sd.EndInvoke(ar);
        }
        catch (Exception ex)
        {
        }
    }

    public static void SendAsyncEmail(MailAddress From, MailAddress[] To, string Subject, string Body, Attachment[] Attachments, MailAddress[] CC, MailAddress[] BCC)
    {
        try
        {
            MailMessage m = new MailMessage();
            m.From = From;

            //  Add To
            foreach (MailAddress a in To)
            {
                m.To.Add(a);
            }
            //  Add CC
            if (CC != null)
            {
                foreach (MailAddress a in CC)
                {
                    m.CC.Add(a);
                }
            }
            //  Add BCC
            if (BCC != null)
            {
                foreach (MailAddress a in BCC)
                {
                    m.Bcc.Add(a);
                }
            }
            m.Subject = Subject;
            m.Body = Body;

            if (Attachments != null)
            {
                foreach (Attachment a in Attachments)
                {
                    m.Attachments.Add(a);
                }
            }

            //  Send Message
            SmtpClient smtp = new SmtpClient();
            //  smtp.EnableSsl = true;
            SendEmailDelegate sd = new SendEmailDelegate(smtp.Send);
            AsyncCallback cb = new AsyncCallback(SendEmailResponse);
            sd.BeginInvoke(m, cb, sd);
        }
        catch (Exception ex)
        {
        }
    }

    public static void SendMail(MailAddress From, MailAddress[] To, String subject, String body, MailAddress[] CC, MailAddress[] BCC, string[] Attachments)
    {
        try
        {
            MailMessage message = new MailMessage();
            message.From = From;

            //  Add To
            foreach (MailAddress a in To)
            {
                message.To.Add(a);
            }
            //  Add CC
            if (CC != null)
            {
                foreach (MailAddress a in CC)
                {
                    message.CC.Add(a);
                }
            }
            //  Add BCC
            if (BCC != null)
            {
                foreach (MailAddress a in BCC)
                {
                    message.Bcc.Add(a);
                }
            }

            if (Attachments != null)
            {
                foreach (string a in Attachments)
                {
                    message.Attachments.Add(new Attachment(File.OpenRead(a), Path.GetFileName(a)));
                }
            }

            message.Subject = subject;
            message.Body = body;
            SmtpClient smtp = new SmtpClient();

            smtp.SendCompleted += delegate(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
            {
                if (e.Error != null)
                {
                    System.Diagnostics.Trace.TraceError(e.Error.ToString());

                }
                MailMessage userMessage = e.UserState as MailMessage;
                if (userMessage != null)
                {
                    userMessage.Dispose();
                }
            };

            smtp.SendAsync(message, message);
        }
        catch (SmtpException smtpEx)
        {
            System.Diagnostics.Trace.TraceError(smtpEx.ToString());
        }
    }
}