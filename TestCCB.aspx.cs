using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TBOffice
{
    public partial class TestCCB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadEvent("2498");
            return;

            //string url = "https://tbbf.ccbchurch.com/api.php?srv=event_profiles";
            string url = "https://tbbf.ccbchurch.com/api.php?srv=event_profile&id=2498";
            WebRequest myReq = WebRequest.Create(url);
            CredentialCache mycache = new CredentialCache();
            mycache.Add(new Uri(url), "Basic", new NetworkCredential("rkleinen", "col12829"));
            myReq.Credentials = mycache;
            //HttpWebResponse resp = (HttpWebResponse)myReq.GetResponse();
            WebResponse wr = myReq.GetResponse();
            Stream rs = wr.GetResponseStream();
            //DataSet ds = new DataSet();
            //ds.ReadXml(rs);

            //StreamReader sr = new StreamReader(rs, Encoding.UTF8);
            //string content = sr.ReadToEnd();
            //Response.ContentType = "text/xml";

            XmlDocument doc = new XmlDocument();
            doc.Load(rs);

            XmlNodeList list = doc.GetElementsByTagName("event");

            //Response.Write("<root>");

            foreach (XmlNode n in list)
            {
                //Response.Write(n.OuterXml);
                DateTime start = DateTime.Parse(n.SelectSingleNode("start_datetime").InnerText);
                if (start > DateTime.Now.AddDays(-1))
                {
                    Response.Write("(" + n.SelectSingleNode("modifier").InnerText + ") ");
                    Response.Write("(" + start.ToString() + ") ");
                    Response.Write(n.SelectSingleNode("name").InnerText + " (" + n.Attributes["id"].Value + ")<br/>");
                }
            }

            //Response.Write("</root>");
        }

        private void LoadEvent(string id)
        {
            //string url = "https://tbbf.ccbchurch.com/api.php?srv=event_profiles";
            string url = "https://tbbf.ccbchurch.com/api.php?srv=event_profile&id=" + id;
            WebRequest myReq = WebRequest.Create(url);
            CredentialCache mycache = new CredentialCache();
            mycache.Add(new Uri(url), "Basic", new NetworkCredential("rkleinen", "col12829"));
            myReq.Credentials = mycache;
            //HttpWebResponse resp = (HttpWebResponse)myReq.GetResponse();
            WebResponse wr = myReq.GetResponse();
            Stream rs = wr.GetResponseStream();
            //DataSet ds = new DataSet();
            //ds.ReadXml(rs);

            //StreamReader sr = new StreamReader(rs, Encoding.UTF8);
            //string content = sr.ReadToEnd();
            Response.ContentType = "text/xml";

            XmlDocument doc = new XmlDocument();
            doc.Load(rs);

            XmlNodeList list = doc.GetElementsByTagName("event");

            Response.Write("<root>");

            foreach (XmlNode n in list)
            {
                Response.Write(n.OuterXml);
                /*
                DateTime start = DateTime.Parse(n.SelectSingleNode("start_datetime").InnerText);
                if (start > DateTime.Now.AddDays(-1))
                {
                    Response.Write("(" + n.SelectSingleNode("modifier").InnerText + ") ");
                    Response.Write("(" + start.ToString() + ") ");
                    Response.Write(n.SelectSingleNode("name").InnerText + " (" + n.Attributes["id"].Value + ")<br/>");
                }
                 */
            }

            Response.Write("</root>");
        }

    }
}