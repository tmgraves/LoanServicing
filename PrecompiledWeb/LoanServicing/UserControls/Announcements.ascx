<%@ control language="C#" autoeventwireup="true" inherits="Controls_Announcements, App_Web_1skrkizd" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<style type="text/css">
    .announcementimage
    {
    	float: left;
    	padding-right: 5px;
    	text-decoration: none;
    	border: none;
    }
    .announcementimage > img
    {
    	border: none;
    }
    .announcementtext
    {
    	padding: 5px;
    	color: #222222;
    	text-align: left;
    }
    .announcementpager > td
    {
    	padding-right: 10px;
    }
    .announcementpager a
    {
    	margin: 2px;
    	display: block;
    	padding-top: 3px;
    	width: 18px;
    	height: 18px;
    	font-size: 11px;
    	background-color: #ffffff;
    	color: #555555;
    	text-align: center;
    	text-decoration: none;
    	border: 1px solid #dddddd;
    }
    .announcementpager span
    {
    	margin: 2px;
    	display: block;
    	padding-top: 3px;
    	width: 18px;
    	height: 18px;
    	font-size: 11px;
    	background-color: #cccccc;
    	text-align: center;
    	color: #ffffff;
    	text-decoration: none;
    	font-weight: bold;
    	border: 1px solid #dddddd;
    }
    .annoucementtext
    {
    	float: left;
        font-size: 12px;
        color: #222222;
    }
</style>
<style type="text/css">
    .announcementlink:hover
    {
    	background-color: #cccccc;
    	color: #fff;
    }
    		
</style>
<asp:UpdatePanel ID="upAnnouncements" runat="server" UpdateMode="Conditional">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="tAnnouncements" EventName="Tick" />
    </Triggers>
    <ContentTemplate>
    <asp:Timer id="tAnnouncements" runat="server"
          Interval="10000" ontick="tAnnouncements_Tick">
    </asp:Timer>
        <asp:ObjectDataSource ID="odsAnnouncements" runat="server"
            SelectMethod="GetByOrganization"
            TypeName="AnnouncementsBLL">
            <SelectParameters>
                <asp:SessionParameter SessionField="OrganizationID" Name="OrganizationID" Type="int32" ConvertEmptyStringToNull="true" DefaultValue="-1" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:DetailsView ID="dvAnnouncements" runat="server"
            AutoGenerateRows="false"
            AllowPaging="true"
            DataSourceID="odsAnnouncements"
            DataKeyNames="AnnouncementID"
            HorizontalAlign="Left"
            GridLines="None"
            Font-Size="14px"
            CellPadding="0"
            BorderStyle="Solid"
            BorderColor="#DDDDDD"
            BorderWidth="1px"
            Width="600px"
            Height="200px"
            EmptyDataText="No current announcements." 
            ondatabound="dvAnnouncements_DataBound" >
            <HeaderStyle forecolor="white" backcolor="Blue" />
            <Fields>
                <asp:TemplateField>
                    <ItemStyle VerticalAlign="Top" HorizontalAlign="Left" />
                    <ItemTemplate>
                        <div style="width: 100%; height: 200px; overflow: auto;">
                        <asp:HyperLink ID="hlLink" runat="server"
                            NavigateUrl='<%# Eval("ImageLink") %>'
                            Target="_blank"
                            Text=""
                            Visible='<%# Eval("ImageContent").ToString() != "" %>'
                            ImageUrl='<%# Eval("AnnouncementID", "~/Handlers/getimage.ashx?imagetype=announcement&id={0}&height=400&width=400") %>'
                            CssClass="announcementimage">
                        </asp:HyperLink>
                        <asp:Label ID="lblAnnouncement" runat="server"
                            CssClass="announcementtext generalfontstyle"
                            Text='<%# Eval("Announcement") %>'>
                        </asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <PagerSettings Mode="NumericFirstLast"
                Position="Top"
                FirstPageText="<<"
                LastPageText=">>"
                PageButtonCount="10" />
            <PagerStyle
                Height="30px"
                Width="100%"
                CssClass="announcementpager"
                HorizontalAlign="Right" />
        </asp:DetailsView>
        <ajaxToolkit:AnimationExtender ID="ae" runat="server"
            TargetControlID="dvAnnouncements">
            <Animations>
                <OnLoad>
                    <FadeIn Duration=".1" Fps="30" />
                </OnLoad>
            </Animations>  
        </ajaxToolkit:AnimationExtender>
    </ContentTemplate>
</asp:UpdatePanel>
