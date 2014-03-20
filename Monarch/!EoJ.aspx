<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="!EoJ.aspx.cs" Inherits="ASNA.Monarch.Support.EoJ"  MasterPageFile="~/Themes/Current/MasterPage.master" %>

    <asp:Content ID="FileContent1" runat="server" ContentPlaceHolderID="HeaderPH">
    </asp:Content>

    <asp:Content ID="FileContent2" runat="server" ContentPlaceHolderID="AppBody">

           <asp:Panel ID="pnlEoJ" runat="server" CssClass="pnlEoJ text-center">
               
               <asp:Panel ID="pnlLogo" runat="server" CssClass="pnlLogo">
                    <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Themes/Current/Images/ASNApalooza2014-275.png" />
               </asp:Panel>

               <asp:Panel ID="pnlEoJThanks" runat="server" CssClass="pnlEoJThanks">
                    <p>Thank you for your interest in ASNApalooza labs!</p>

                    <div id="showLabConfirmation" runat="server">
                        <p>An email confirming your lab registration has been sent to you.</p>
                    </div>

                </asp:Panel>
               
               <asp:Panel ID="pnlAppInfo" runat="server" CssClass="pnlAppInfo">
                    <p>This app is powered by ASNA Mobile RPG and the IBM i.</p>
                </asp:Panel>

                <img src="http://media.asna.com/uploads/images/MobileRPG.png" />

            </asp:Panel>

    </asp:Content>

   
    
