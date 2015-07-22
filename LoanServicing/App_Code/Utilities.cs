using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Net.Mail;

/// <summary>
/// Summary description for Utilities
/// </summary>
public class Utilities
{
	public Utilities()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DownloadFile(string fname, bool forceDownload)
    {
        string path = HttpContext.Current.Server.MapPath(fname);
        string name = Path.GetFileName(path);
        string ext = Path.GetExtension(path);
        string type = "";
        // set known types based on file extension  
        if (ext != null)
        {
            switch (ext.ToLower())
            {
                case ".htm":
                case ".html":
                    type = "text/HTML";
                    break;

                case ".txt":
                    type = "text/plain";
                    break;

                case ".doc":
                case ".rtf":
                    type = "Application/msword";
                    break;
            }
        }
        if (forceDownload)
        {
            HttpContext.Current.Response.AppendHeader("content-disposition",
                "attachment; filename=" + name);
        }
        if (type != "")
            HttpContext.Current.Response.ContentType = type;
        HttpContext.Current.Response.WriteFile(path);
        HttpContext.Current.Response.End();
    }

    public static void DownloadDatabaseFile(byte[] fileStream, string fileName, string fileType)
    {
        using (Stream st = new MemoryStream(fileStream))
        {
            long dataLengthToRead = st.Length;
            HttpContext.Current.Response.ContentType = fileType;
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            while (dataLengthToRead > 0 && HttpContext.Current.Response.IsClientConnected)
            {
                byte[] buffer = new byte[st.Length];
                Int32 lengthRead = st.Read(buffer, 0, (int)st.Length);
                HttpContext.Current.Response.OutputStream.Write(buffer, 0, lengthRead);
                HttpContext.Current.Response.Flush();
                dataLengthToRead = dataLengthToRead - lengthRead;
            }
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.Close();
        }
        HttpContext.Current.Response.End();
    }

    /// Create thumbnail of the image
    public static byte[] CreateThumbnailFromArray(byte[] image, int maxHeight, int maxWidth, string extension)
    {
        Stream s = new MemoryStream(image);
        System.Drawing.Image img = System.Drawing.Image.FromStream(s);
        extension = extension.ToLower();

        byte[] buffer = null;
        try
        {
            int width = img.Size.Width;
            int height = img.Size.Height;

            bool doWidthResize = (maxWidth > 0 && width > maxWidth);
            bool doHeightResize = (maxHeight > 0 && height > maxHeight);

            if (doHeightResize)
            {
                if (height > maxHeight)
                {
                    Decimal ratio = (Decimal)maxHeight / (Decimal)height;
                    width = (int)(ratio * (Decimal)width);
                    height = maxHeight;
                }
            }

            if (doWidthResize)
            {
                if (width > maxWidth)
                {
                    Decimal ratio = (Decimal)maxWidth / (Decimal)width;
                    height = (int)(ratio * (Decimal)height);
                    width = maxWidth;
                }
            }

            System.Drawing.Bitmap newImg = new System.Drawing.Bitmap(width, height);

            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(newImg);
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
            g.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
            System.Drawing.Rectangle rd = new System.Drawing.Rectangle(0, 0, width, height);
            g.DrawImage(img, rd, 0, 0, img.Size.Width, img.Size.Height, System.Drawing.GraphicsUnit.Pixel);

            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    if (extension.IndexOf("jpg") > -1)
                    {
                        newImg.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                    else if (extension.IndexOf("png") > -1)
                    {
                        newImg.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    }
                    else if (extension.IndexOf("gif") > -1)
                    {
                        newImg.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                    }
                    else // if (extension.IndexOf("bmp") > -1)
                    {
                        newImg.Save(ms, System.Drawing.Imaging.ImageFormat.Bmp);
                    }
                    buffer = ms.ToArray();
                }
            }
            finally
            {
                newImg.Dispose();
            }
        }
        catch
        {
            System.Drawing.Image imNoimage = System.Drawing.Image.FromFile("../images/noimage.gif");
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    imNoimage.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                    buffer = ms.ToArray();
                }
            }
            finally
            {
                imNoimage.Dispose();
            }
        }
        finally
        {
            img.Dispose();
        }
        return buffer;
    }

    public static int GetQuestionView(string type)
    {
        int intView = 0;
        switch (type)
        {
            case "Date":
                intView = 3;
                break;
            case "Multi-Select":
                intView = 1;
                break;
            case "Number":
                intView = 5;
                break;
            case "Open Text":
                intView = 0;
                break;
            case "Single-Select":
                intView = 2;
                break;
            case "Time":
                intView = 4;
                break;
        }

        return intView;
    }

    //<summary>
    // Evaluate Filename and return extension
    //</summary>
    //<param name="FileName"></param>
    //<returns>FilePath of the Extension Icon</returns>
    //<remarks></remarks>
    public static string FileIcon(string FileName)
    {
        switch (System.IO.Path.GetExtension(FileName))
        {
            case ".pdf":
                return "~/images/documenticons/pdf.gif";
            case ".doc":
                return "~/images/documenticons/word.gif";
            case ".docx":
                return "~/images/documenticons/word.gif";
            case ".xls":
                return "~/images/documenticons/excel.gif";
            case ".xlsx":
                return "~/images/documenticons/excel.gif";
            case ".ppt":
                return "~/images/documenticons/powerpoint.gif";
            case ".jpg":
                return "~/images/documenticons/image.gif";
            case ".jpeg":
                return "~/images/documenticons/image.gif";
            case ".gif":
                return "~/images/documenticons/image.gif";
            default:
                return "~/images/documenticons/generic.gif";
        }
    }

    public static string ReplaceLinks(string arg)
    //Replaces web and email addresses in text with hyperlinks
    {
        Regex urlregex = new Regex(@"(^|[\n ])(?<url>(www|ftp)\.[^ ,""\s<]*)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        arg = urlregex.Replace(arg, " <a href=\"http://${url}\" target=\"_blank\">${url}</a>");
        Regex httpurlregex = new Regex(@"(^|[\n ])(?<url>(http://www\.|http://|https://)[^ ,""\s<]*)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        arg = httpurlregex.Replace(arg, " <a href=\"${url}\" target=\"_blank\">${url}</a>");
        Regex emailregex = new Regex(@"(?<url>[a-zA-Z_0-9.-]+\@[a-zA-Z_0-9.-]+\.\w+\s)", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        arg = emailregex.Replace(arg, " <a href=\"mailto:${url}\">${url}</a> ");
        return arg;
    }

    // returns an encrypted string version of an ID suitable for transmission on a URL
    public static string EncryptID(int unencryptedID)
    {
        string encryptedID;

        byte[] bKey = new byte[8];
        byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };

        bKey = System.Text.Encoding.UTF8.GetBytes("!#$a54?3");  // you might want to store the encryption key in an appSetting of your web.config
        DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        Byte[] inputByteArray = System.Text.Encoding.UTF8.GetBytes(unencryptedID.ToString());
        MemoryStream ms = new MemoryStream();
        CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(bKey, IV), CryptoStreamMode.Write);
        cs.Write(inputByteArray, 0, inputByteArray.Length);
        cs.FlushFinalBlock();

        encryptedID = Convert.ToBase64String(ms.ToArray());

        return HttpContext.Current.Server.UrlEncode(encryptedID);
    }

    public static int DecryptID(string encryptedID)
    {
        try
        {

            byte[] key = System.Text.Encoding.UTF8.GetBytes("!#$a54?3");  // you might want to store the encryption key in an appSetting of your web.config
            byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
            byte[] inputByteArray = new byte[encryptedID.Length];

            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Convert.FromBase64String(encryptedID);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            System.Text.Encoding encoding = System.Text.Encoding.UTF8;

            return int.Parse(encoding.GetString(ms.ToArray()));
        }
        catch
        {
            return -1;
            //  throw new ApplicationException("An invalid ID was received.");
        }
    }

    /// <summary>
    /// Starts the matching and calls the matchevaluator delegate so that we can format the string
    /// </summary>
    /// <param name="phone">object</param>
    /// <returns></returns>
    /// <remarks>(012) 234-5678</remarks>
    public static string FormatPhone(object oPhone)
    {
        string phone = oPhone.ToString();

        return FormatPhone(phone);
    }

    /// <summary>
    /// Starts the matching and calls the matchevaluator delegate so that we can format the string
    /// </summary>
    /// <param name="phone">string</param>
    /// <returns></returns>
    /// <remarks>(012) 234-5678</remarks>
    public static string FormatPhone(string phone)
    {
        string pattern = @"(?<ac>[\d]{3}){0,1}(?<ex>[\d]{3})(?<ph>[\d]{4})";

        if (Regex.IsMatch(phone, pattern))
        {
            phone = Regex.Replace(phone, pattern,
                delegate(Match m)
                {
                    string phoneFormatted = string.Empty;

                    if (string.IsNullOrEmpty(m.Groups["ac"].Value))
                    {
                        phoneFormatted = string.Format("{0}-{1}", m.Groups["ex"], m.Groups["ph"]);
                        return phoneFormatted;
                    }

                    phoneFormatted = string.Format("({0}) {1}-{2}", m.Groups["ac"], m.Groups["ex"], m.Groups["ph"]);
                    return phoneFormatted;

                }
            );
        }

        return phone;
    }

    /// <summary>
    /// Format SSN
    /// </summary>
    /// <param name="ssn">object</param>
    /// <returns></returns>
    /// <remarks>555-55-0000</remarks>
    public static string FormatSSN(object oSSN)
    {
        string ssn = oSSN.ToString();

        return FormatSSN(ssn);
    }

    /// <summary>
    /// FormatSSN
    /// </summary>
    /// <param name="ssn">string</param>
    /// <returns></returns>
    /// <remarks>555-55-0000</remarks>
    public static string FormatSSN(string ssn)
    {
        if (ssn.Length == 9)
        {
            return ssn.Substring(0, 3) + "-" + ssn.Substring(3, 2) + "-" + ssn.Substring(5, 4);
        }
        else
        {
            return ssn;
        }
    }
}