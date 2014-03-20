<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Palooza.aspx.cs" Inherits="Palooza" MasterPageFile="~/Themes/Current/MasterPage.master" %>
<%@ Register TagPrefix="mdf" Assembly="ASNA.Monarch.WebDspF, Version=11.0.53.0, Culture=neutral, PublicKeyToken=71de708db13b26d3" Namespace="ASNA.Monarch.WebDspF" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeaderPH">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="AppBody">
    <%-- Invisible DdsFile control --%>
    <mdf:ddsfile ID="Ddsfile1" runat="server" BannerStyle="Invisible" DisplayErrorMessages="False" SrcDdsCcsid="37" PopUpWindows="false" SetDefaultFocus="false" />

    <%-- Home Record: Home Navigation bar and a simple label on the Page --%>
    <mdf:DdsRecord id="_HomeMenu" runat="server" style="position: relative;" Alias="HOMEMENU"
         CssClass="DdsRecord" NavigationBarControlID="NavigationBar" FuncKeys="F3 03;" EraseFormats="*ALL" CursorField="CAction" >

        <mdf:DdsCharField ID="DdsCharField6" runat="server" Alias="CAction"
            DefaultValue=""
            Length="32"
            Usage="Both"
            VisibleCondition="*False" />

        <mdf:DdsCharField ID="DdsCharField8" runat="server" Alias="CFormat"
            DefaultValue="HOMEMENU"
            Length="10"
            Protect="*True"
            Usage="InputOnly"
            VisibleCondition="*False" />

        <mdf:DdsBar ID="NavigationBar" runat="server" CssClass="DdsBar"  >
            <mdf:DdsBarSegment ID="DdsBarSegment1" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton1" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F3" Text="End" FieldName="END"/>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment2" runat="server" Alignment="Center">
                <span class="PanelTitle">Home</span>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment3" runat="server" Alignment="Right">
                <%-- add buttons if required here --%>
            </mdf:DdsBarSegment>
        </mdf:DdsBar>

        <asp:Panel ID="pnlHomeMenuMain" runat="server" CssClass="pnlHomeMenuMain text-center">
            <asp:Panel ID="pnlLogo" runat="server" CssClass="pnlLogo">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Themes/Current/Images/ASNApalooza2014-275.png" />
            </asp:Panel>

            <asp:Panel ID="pnlWelcome" runat="server" CssClass="pnlWelcome">
                Welcome to
                <br />
                ASNApalooza 2014 Lab Registration
            </asp:Panel>

            <asp:Panel ID="pnlHomeMenuButtons" runat="server" CssClass="pnlHomeMenuButtons clearfix">
                <mdf:DdsButton ID="DdsButton5" runat="server" AidKey="F3" CssClass="NewRegButton NavButton" Text="New Registration" FieldName="REGISTER" />
                <mdf:DdsButton ID="DdsButton3" runat="server" AidKey="F3" CssClass="ShowLabsButton NavButton" Text="Registered - Show Labs" FieldName="RETURNING"/>
            </asp:Panel>
        </asp:Panel>
        

        <br />
        <%-- add your page controls here --%>
        <br />
    </mdf:DdsRecord>

    <mdf:DdsRecord ID="_ShowLabs" runat="server" Style="position: relative;" Alias="ShowLabs"
        CssClass="DdsRecord" NavigationBarControlID="DdsBar1" FuncKeys="F3 03;F24 24;" EraseFormats="*All"  CursorField="CAction" >

        <mdf:DdsCharField ID="DdsCharField1" runat="server" Alias="CAction"
            DefaultValue=""
            Length="32"
            Usage="Both"
            VisibleCondition="*False" />

        <mdf:DdsCharField ID="DdsCharField2" runat="server" Alias="CFormat"
            DefaultValue="SHOWLABS"
            Length="10"
            Protect="*True"
            Usage="InputOnly"
            VisibleCondition="*False" />


        <mdf:DdsBar ID="DdsBar1" runat="server" CssClass="DdsBar"  >
            <mdf:DdsBarSegment ID="DdsBarSegment4" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton2" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F3" Text="Done" FieldName="END"/>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment5" runat="server" Alignment="Center">
                <span class="PanelTitle">Palooza Labs</span>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment6" runat="server" Alignment="Right">
                <%-- add buttons if required here --%>
            </mdf:DdsBarSegment>
        </mdf:DdsBar>

        <asp:Panel ID="pnlShowLabs" runat="server" CssClass="pnlShowLabs">
            
            <asp:Panel ID="pnlShowLabsFullName" runat="server" CssClass="pnlShowLabsFullName">
                <mdf:DdsCharField ID="DdsCharField25" runat="server" CssClass="DdsCharField" Alias="FullName" Length="60" Usage="OutputOnly" />
            </asp:Panel>
            
            <asp:Panel ID="pnlShowLabsInstructions" runat="server" CssClass="pnlShowLabsInstructions">
                When you've selected all of your labs click the "Done" button above to get your confirmation email.
            </asp:Panel>

        

            <mdf:DdsList ID="DdsList1" runat="server" ClearIndicator="99" CssClass="DdsList-lab" 
                         CssClassChevron="DdsListChevron" CssClassDetail="DdsListDetail" CssClassImage="DdsListImage" 
                         CssClassList="DdsListList-lab" SubfileName="LabsSfl" SubfileControlName="LabsSflC" 
                         SelectedField="LabSel" TextField="LabName" TextFieldLength="80" NavigableField="*True" 
                         SelectChevronKey="F24" SelectItemKey="F24" ValueField="LabID" ValueFieldLength="12" 
                         DetailField="Subhead" DetailFieldLength="80" IconIdField="IconID" IconIdFieldLength="24" />

            <asp:Panel ID="pnlShowLabsIcons" runat="server" CssClass="pnlShowLabsIcons">
                <div id="DdsList1_Icon600">
		           <svg id="Svg1" width="16" height="16" viewBox="0 -1536 1536 1792" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" version="1.1">
		               <g transform="scale(1,-1)">
		                    <path style="fill:black" d="M1536 640q0 -209 -103 -385.5t-279.5 -279.5t-385.5 -103t-385.5 103t-279.5 279.5t-103 385.5t103 385.5t279.5 279.5t385.5 103t385.5 -103t279.5 -279.5t103 -385.5z"/>
		               </g>
		           </svg>
                   = Registered.
                </div>
               <div id="DdsList1_Icon700" >
		           <svg id="DdsList1_Icon0_Icon" width="16" height="16" viewBox="0 -1536 1536 1792" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" version="1.1">
		               <g transform="scale(1,-1)">
    		               <path style="fill:black" d="M1280 640q0 104 -40.5 198.5t-109.5 163.5t-163.5 109.5t-198.5 40.5t-198.5 -40.5t-163.5 -109.5t-109.5 -163.5t-40.5 -198.5t40.5 -198.5t109.5 -163.5t163.5 -109.5t198.5 -40.5t198.5 40.5t163.5 109.5t109.5 163.5t40.5 198.5zM1536 640q0 -209 -103 -385.5 t-279.5 -279.5t-385.5 -103t-385.5 103t-279.5 279.5t-103 385.5t103 385.5t279.5 279.5t385.5 103t385.5 -103t279.5 -279.5t103 -385.5z"/>
	                   </g>
	              </svg>
                  = Not registered.
		      </div>

              <div id="sessionlocked">
		         <svg id="DdsList1_Icon1_Icon" width="16" height="16" viewBox="0 -1536 1152 1792" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" version="1.1">
		             <g transform="scale(1,-1)">
		                 <path style="fill:black" d="M704 512q0 53 -37.5 90.5t-90.5 37.5t-90.5 -37.5t-37.5 -90.5q0 -37 19 -67t51 -47l-69 -229q-5 -15 5 -28t26 -13h192q16 0 26 13t5 28l-69 229q32 17 51 47t19 67zM320 768h512v192q0 106 -75 181t-181 75t-181 -75t-75 -181v-192zM1152 672v-576q0 -40 -28 -68 t-68 -28h-960q-40 0 -68 28t-28 68v576q0 40 28 68t68 28h32v192q0 184 132 316t316 132t316 -132t132 -316v-192h32q40 0 68 -28t28 -68z"/>
		             </g>
		         </svg>
                 = Lab is full.
		      </div>
            </asp:Panel>

            <asp:Panel ID="pnlShowLabsFooterInstructions" runat="server" CssClass="pnlShowLabsFooterInstructions pnlShowLabsInstructions">
                Tap a lab's row to register/unregister. 
            </asp:Panel>

            <mdf:DdsCharField ID="DdsCharField26" runat="server" Alias="LabsOut" CssClass="hidden boom"
                DefaultValue=""
                Length="1024"
                Protect="*True"
                Usage="Both"
                />

        </asp:Panel>

    </mdf:DdsRecord>


    <mdf:DdsRecord ID="_LabDtl" runat="server" Style="position: relative;" Alias="LabDtl"
        CssClass="DdsRecord" NavigationBarControlID="DdsBar3" FuncKeys="F3 03" EraseFormats="*All"  CursorField="CAction" >

        <mdf:DdsCharField ID="DdsCharField11" runat="server" Alias="CAction"
            DefaultValue=""
            Length="32"
            Usage="Both"
            VisibleCondition="*False" />

        <mdf:DdsCharField ID="DdsCharField14" runat="server" Alias="CFormat"
            DefaultValue="LABDTL"
            Length="10"
            Protect="*True"
            Usage="InputOnly"
            VisibleCondition="*False" />


        <mdf:DdsBar ID="DdsBar3" runat="server" CssClass="DdsBar"  >
            <mdf:DdsBarSegment ID="DdsBarSegment10" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton8" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F3" Text="Back" FieldName="SHOWLABS"/>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment11" runat="server" Alignment="Center">
                <span class="PanelTitle">Lab Detail</span>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment12" runat="server" Alignment="Right">
                <%-- add buttons if required here --%>
            </mdf:DdsBarSegment>
        </mdf:DdsBar>

        <asp:Panel ID="pnlDetail" runat="server" CssClass="pnlDetail">

            <mdf:DdsCharField ID="DdsCharField15" runat="server" CssClass="hidden DdsCharField" Alias="LabID" Length="12" Usage="OutputOnly" />
            <asp:Panel ID="pnlDetailFullName" runat="server" CssClass="pnlDetailFullName pnlDetailGroup">
                <asp:Label ID="lblDetailFullName" runat="server" Text="Full name" CssClass="lblDetailFullName lblDetail"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField18" runat="server" CssClass="DetailField DdsCharField" Alias="FullName" Length="60" Usage="OutputOnly" />
            </asp:Panel>
            <mdf:DdsCharField ID="DdsCharField24" runat="server" CssClass="hidden DdsCharField" Alias="Email" Length="75" Usage="OutputOnly" />
            <mdf:DdsCharField ID="DdsCharField19" runat="server" CssClass="hidden DdsCharField" Alias="Company" Length="30" Usage="OutputOnly" />
            <asp:Panel ID="pnlDetailLabName" runat="server" CssClass="pnlDetailLabName pnlDetailGroup">
                <asp:Label ID="lblDetailLabName" runat="server" Text="Lab name" CssClass="lblDetailLabName lblDetail"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField16" runat="server" CssClass="DetailField DdsCharField" Alias="LabName" Length="80" Usage="OutputOnly" />
            </asp:Panel>
            <mdf:DdsCharField ID="DdsCharField17" runat="server" CssClass="hidden DdsCharField" Alias="LabSubhead" Length="80" Usage="OutputOnly" />
            <asp:Panel ID="pnlDetailLabDesc" runat="server" CssClass="pnlDetailLabDesc pnlDetailGroup">
                <asp:Label ID="lblDetailLabDesc" runat="server" Text="Lab Description" CssClass="lblDetailLabDesc lblDetail"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField20" runat="server" CssClass="DetailField DdsCharField" Alias="LabDesc" Length="400" Usage="OutputOnly" />
            </asp:Panel>

            <asp:Panel ID="pnlDetailButtons" runat="server" CssClass="pnlDetailButtons pnlFormButtons clearfix">
                <mdf:DdsButton ID="DdsButton9" ButtonStyle="Button" runat="server" CssClass="ContinueButton NavButton" AidKey="F3" FieldName="DOREG" TextField="BtnTxt" TextFieldLength="24" />
                <mdf:DdsButton ID="DdsButton10" ButtonStyle="Button" runat="server" CssClass="CancelButton NavButton" AidKey="F3" Text="Cancel"  FieldName="DONOTREG"/>
            </asp:Panel>

        </asp:Panel>

    </mdf:DdsRecord>


    <mdf:DdsRecord ID="_Register" runat="server" Style="position: relative;" Alias="Register"
        CssClass="DdsRecord" NavigationBarControlID="DdsBar2" FuncKeys="F3 03;" EraseFormats="*All"  CursorField="CAction" >

        <mdf:DdsCharField ID="DdsCharField3" runat="server" Alias="CAction"
            DefaultValue=""
            Length="32"
            Usage="Both"
            VisibleCondition="*False" />

        <mdf:DdsCharField ID="DdsCharField4" runat="server" Alias="CFormat"
            DefaultValue="REGISTER"
            Length="10"
            Protect="*True"
            Usage="InputOnly"
            VisibleCondition="*False" />


        <mdf:DdsBar ID="DdsBar2" runat="server" CssClass="DdsBar"  >
            <mdf:DdsBarSegment ID="DdsBarSegment7" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton4" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F3" Text="Home" FieldName="HOME"/>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment8" runat="server" Alignment="Center">
                <span class="PanelTitle">Register</span>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment9" runat="server" Alignment="Right">
                <%-- add buttons if required here --%>
            </mdf:DdsBarSegment>
        </mdf:DdsBar>

        <asp:Panel ID="pnlRegForm" runat="server" CssClass="pnlRegForm">
            
            <asp:Panel ID="pnlEmail" runat="server" CssClass="pnlEmail pnlFormGroup">
                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="lblEmail lblFormControl" AssociatedControlID="DdsCharField10"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField10" runat="server" CssClass="DdsCharField" Alias="Email" Length="75" Lower="True" SubType="email" />
            </asp:Panel>
        
            <asp:Panel ID="pnlRepeatEmail" runat="server" CssClass="pnlRepeatEmail pnlFormGroup">
                <asp:Label ID="lblRepeatEmail" runat="server" Text="Repeat email" CssClass="lblRepeatEmail lblFormControl" AssociatedControlID="DdsCharField12"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField12" runat="server" CssClass="DdsCharField" Alias="Email2" Length="75" Lower="True" SubType="email" />
            </asp:Panel>

            <asp:Panel ID="pnlFirstName" runat="server" CssClass="pnlFirstName pnlFormGroup">
                <asp:Label ID="lblFirstName" runat="server" Text="First name" CssClass="lblFirstName lblFormControl" AssociatedControlID="DdsCharField5"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField5" runat="server" CssClass="DdsCharField" Alias="FName" Length="30" Lower="True" />
            </asp:Panel>

            <asp:Panel ID="pnlLastName" runat="server" CssClass="pnlLastName pnlFormGroup">
                <asp:Label ID="lblLastName" runat="server" Text="Last name" CssClass="lblLastName lblFormControl" AssociatedControlID="DdsCharField7"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField7" runat="server" CssClass="DdsCharField" Alias="LName" Length="30" Lower="True" />
            </asp:Panel>

            <asp:Panel ID="pnlCompanyName" runat="server" CssClass="pnlCompanyName pnlFormGroup">
                <asp:Label ID="lblCompanyName" runat="server" Text="Company name" CssClass="lblCompanyName lblFormControl" AssociatedControlID="DdsCharField9"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField9" runat="server" CssClass="DdsCharField" Alias="Company" Length="30" Lower="True" />
            </asp:Panel>

            <asp:Panel ID="pnlRegErrorMsg" runat="server" CssClass="pnlRegErrorMsg pnlErrorMsg text-center">
                <mdf:DdsCharField ID="DdsCharField13" runat="server" Alias="ErrorMsg" CssClass="DdsCharField" Length="80" VisibleCondition="98" Usage="OutputOnly" />
            </asp:Panel>

            <asp:Panel ID="pnlRegFormButtons" runat="server" CssClass="pnlRegFormButtons pnlFormButtons clearfix">
                <mdf:DdsButton ID="DdsButton7" ButtonStyle="Button" runat="server" CssClass="ContinueButton NavButton" AidKey="F3" Text="Continue" FieldName="REGATT"/>
                <mdf:DdsButton ID="DdsButton6" ButtonStyle="Button" runat="server" CssClass="CancelButton NavButton" AidKey="F3" Text="Cancel" FieldName="CANREG"/>
            </asp:Panel>

        </asp:Panel>

    </mdf:DdsRecord>


    <mdf:DdsRecord ID="DdsRecord1" runat="server" Style="position: relative;" Alias="RETURNING"
        CssClass="DdsRecord" NavigationBarControlID="DdsBar4" FuncKeys="F3 03;" EraseFormats="*All"  CursorField="CAction" >

        <mdf:DdsCharField ID="DdsCharField21" runat="server" Alias="CAction"
            DefaultValue=""
            Length="32"
            Usage="Both"
            VisibleCondition="*False" />

        <mdf:DdsCharField ID="DdsCharField22" runat="server" Alias="CFormat"
            DefaultValue="RETURNING"
            Length="10"
            Protect="*True"
            Usage="InputOnly"
            VisibleCondition="*False" />


        <mdf:DdsBar ID="DdsBar4" runat="server" CssClass="DdsBar"  >
            <mdf:DdsBarSegment ID="DdsBarSegment13" runat="server" Alignment="Left">
                <mdf:DdsButton ID="DdsButton11" ButtonStyle="Button" runat="server" CssClass="NavButton" AidKey="F3" Text="Home" FieldName="HOME"/>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment14" runat="server" Alignment="Center">
                <span class="PanelTitle">Login</span>
            </mdf:DdsBarSegment>
            <mdf:DdsBarSegment ID="DdsBarSegment15" runat="server" Alignment="Right">
                <%-- add buttons if required here --%>
            </mdf:DdsBarSegment>
        </mdf:DdsBar>

        <asp:Panel ID="pnlLoginForm" runat="server" CssClass="pnlLoginForm">

            <asp:Panel ID="pnlUserEmail" runat="server" CssClass="pblUserEmail pnlFormGroup">
                <asp:Label ID="lblUserEmail" runat="server" Text="Email" CssClass="lblUserEmail lblFormControl" AssociatedControlID="DdsCharField23"></asp:Label>
                <mdf:DdsCharField ID="DdsCharField23" runat="server" CssClass="DdsCharField" Alias="Email" Length="75" Lower="True" SubType="email" />
            </asp:Panel>

            <asp:Panel ID="pnlLoginErrorMsg" runat="server" CssClass="pnlLoginErrorMsg pnlErrorMsg text-center">
                <mdf:DdsCharField ID="DdsCharField28" runat="server" Alias="ErrorMsg" CssClass="DdsCharField" Length="80" VisibleCondition="98" Usage="OutputOnly" />
            </asp:Panel>
            
            <asp:Panel ID="pnlLoginFormButtons" runat="server" CssClass="pnlLoginFormButtons pnlFormButtons clearfix">
                <mdf:DdsButton ID="DdsButton12" ButtonStyle="Button" runat="server" CssClass="ContinueButton NavButton" AidKey="F3" Text="Continue" FieldName="RETURNINGATT"/>
                <mdf:DdsButton ID="DdsButton13" ButtonStyle="Button" runat="server" CssClass="CancelButton NavButton" AidKey="F3" Text="Cancel" FieldName="CANREG"/>
            </asp:Panel>

        </asp:Panel>
        
    </mdf:DdsRecord>
       



    <%-- add more records here --%>

</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PageScriptPH"  >
    <script type="text/javascript" >
    </script>  
</asp:Content>
